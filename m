From: David Wagner <david.wagner@free-electrons.com>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Thu, 01 Sep 2011 14:55:12 +0200
Message-ID: <4E5F80B0.9060908@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>	<201108241823.20904.arnd@arndb.de>	<1314256010.18988.18.camel@sauron>
	<201108251712.40894.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <201108251712.40894.arnd@arndb.de>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, dedekind1@gmail.com, lkml <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

On 08/25/2011 05:12 PM, Arnd Bergmann wrote:
> The cost of a block device node in the kernel is rather low. Nowadays,
> sysfs does not even permanently use inodes for entries, it has a much
> more compact internal representation IIRC.
> 
> The main advantage of this approach is not having to set up the 
> block device at all, it would just be there, which e.g. makes it
> possible to put a root file system on it or do something else without
> requiring a user space tool to issue an ioctl.

Before patch v3, every existing and new UBI volumes were "proxyfied" by
ubiblk and it was, indeed, one of our goal to be able to have a rootfs
on it.  Patch v3 hinders that goal but it could still be achievable by
adding a module parameter that would explicitly create a ubiblk device
for a UBI volume at boot time.

I for one am fine with both solutions (keep the ioctl + add a kernel
parameter and throwing the ioctl away and go back "automatically create
a ubiblk for each UBI volume").  However, I agree that it doesn't make
sense to create a ubiblk device on top of UBI volumes containing, for
instance, a ubifs.

	Best Regards,
	David.

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
