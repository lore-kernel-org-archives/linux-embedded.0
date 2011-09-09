From: David Wagner <david.wagner@free-electrons.com>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Fri, 09 Sep 2011 16:41:53 +0200
Message-ID: <4E6A25B1.8070400@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>	
	<1315280704.19067.14.camel@sauron>
	<1315282208.19067.24.camel@sauron>	
	<201109081726.00769.arnd@arndb.de>
	<1315569206.7905.41.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1315569206.7905.41.camel@sauron>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

On 09/09/2011 01:53 PM, Artem Bityutskiy wrote:
> On Thu, 2011-09-08 at 17:26 +0200, Arnd Bergmann wrote:
>> On Tuesday 06 September 2011, Artem Bityutskiy wrote:
>>> Not sure about the bus approach - David, could you take a look at it
>>> please? If we can handle errors there - then we could indeed re-use the
>>> UBI control device. We could even re-use the ioctl data structures for
>>> UBI volumes creation/removal - we have plenty of space there reserved
>>> for future extensions.
>>

@Arnd:
> * Use the existing UBI control device for the block devices as
>   well and just add two more ioctls to create the devices.
>   You can add a logical bus_type for this so that the ubi block
>   driver gets automatically loaded matched with the device when
>   one is created using the control device.

I certainly miss some background, I'm not sure I understand how this
works: bus_type seems suitable for pluggable devices that possess a
device ID which matches against a driver that will then get loaded.  But
ubiblk devices are created by ubiblk.
So, are you suggesting to move ubiblk_create() to UBI and add a
MODULE_ALIAS to ubiblk (actually, I don't know what it would contain) ?

(I just saw that you sent an email while I was writing this one ;
however, I still understand. I'll try and read how scsi does that).


@Artem:
> Sorry, I wonted to talk about situations when someone opens an ubiblk
> device while the underlying UBI volume is being removed, but then though
> this is trivial and forgot to erase the last sentence.

Ah, yes, I guess we need to hold a vol_lock in ubiblk_remove() ?


> Anyway, I suggest the following algorithm:
> 
> 1. Stick with the own cdev approach - the driver becomes very simple
>    in this case - we review it.

This is the way it's implemented in v4, right ?

BTW, those are the changes made so far since v4:
 * Add missing headers (they are included by other headers but it seems
   to be good practice not to rely on that).

 * Remove an macro rendered useless with the linked lists

 * correct some formatting in kerneldoc comments

 * introduce refcounting to avoid multiple opens or closing a UBI
   volume while still in use

 * make checkpatch happy about assignation inside a condition

 * use DEFINE_MUTEX for devlist_lock


	Best Regards,
	David

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
