From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Thu, 25 Aug 2011 17:12:40 +0200
Message-ID: <201108251712.40894.arnd@arndb.de>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<201108241823.20904.arnd@arndb.de>
	<1314256010.18988.18.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1314256010.18988.18.camel@sauron>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: dedekind1@gmail.com
Cc: linux-embedded <linux-embedded@vger.kernel.org>, david.wagner@free-electrons.com, lkml <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

On Thursday 25 August 2011, Artem Bityutskiy wrote:
> On Wed, 2011-08-24 at 18:23 +0200, Arnd Bergmann wrote:
> > That should  be fine, yes. I would probably put them into the same
> > header file though if they are in the same number space even
> > when you use them on distinct devices.
> > 
> > It does feel a little clumsy to have yet another character device
> > to manage the block devices though. What do you think about one
> > of these alternative approaches:
> > 
> > * When the ubi block device driver gets loaded, create one block
> >   device per volume and let the user deal with permissions for
> >   the devices instead of having to first create them as well.
> 
> I think this wasteful. Why should I have block devices which I do not
> need? If I have 4 UBI volumes, and need only one ubiblk, why should I
> waste my resources for 3 more of them (e.g., I do not want to waste
> memory for struct inode for each sysfs entry which these useless block
> devices will add). Also, will this mean 3 more block devices registered?
> 
> I think it is much uglier to have 3 "dummy" block devices and confuse
> users than have one nice control character device. For the sake of not
> having a separate control chardev?

The cost of a block device node in the kernel is rather low. Nowadays,
sysfs does not even permanently use inodes for entries, it has a much
more compact internal representation IIRC.

The main advantage of this approach is not having to set up the 
block device at all, it would just be there, which e.g. makes it
possible to put a root file system on it or do something else without
requiring a user space tool to issue an ioctl.

Evidently you can do everything you need even with that user space
tool, but IMHO the complexity of doing that is way bigger than
just creating the block devices right away.

> > * Use the existing UBI control device for the block devices as
> >   well and just add two more ioctls to create the devices.
> >   You can add a logical bus_type for this so that the ubi block
> >   driver gets automatically loaded matched with the device when
> >   one is created using the control device.
> 
> This sounds  better IMHO, but I am still not sure that adding another
> dummy bus and exposing it in sysfs and more complexity in the ubiblk
> code is more elegant and less wasteful than just creating a separate
> chardev...

It's not a dummy bus, in this approach it would be a the bus that gets
used by all ubiblk devices, which is a very common concept by itself.
It's more like the classic understanding of a 'device class' that Greg
wants to see get replaced by bus_types in the kernel.

	Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
