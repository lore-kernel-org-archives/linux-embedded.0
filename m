From: Aras Vaichas <arasv@magtech.com.au>
Subject: Re: ramfs/tmpfs for application partition
Date: Mon, 09 Mar 2009 17:00:46 +1100
Message-ID: <49B4B08E.4090805@magtech.com.au>
References: <FF584854D6FFE547AB2F7515A798AC3A045716A1B4@venus.imagineil.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <FF584854D6FFE547AB2F7515A798AC3A045716A1B4@venus.imagineil.tv>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jacob Avraham <jacob@imaginecommunications.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Jacob Avraham wrote:
> Hi,
>
> I have a system with 128M RAM and a flash partitioned so that 10M is dedicated to initramfs image,
> 6M to application partition. And another 6M for JFFS2.
> As I have plenty of RAM, I'd like to have my application directory mounted on RAM, from a pre-populated
> filesystem that resides in the 6M application partition.
> So basically I want to use the same mechanism as initramfs, but mounted on /my/app/partition instead of root.
> Does it make sense? How do I go about and do that?
What about unionfs or Aufs?

I think you'd need to have your "original" as a proper filing system. 
Then you'd mount the unionfs over the top of it, but it would be in RAM. 
From the user's point of view, they'd had full read/write access to the 
whole filing system, but unionfs/Aufs would save the changes into RAM, 
not Flash.

This is how Linux Live CDs work. They allow you to "write" to the filing 
system on the CD using UnionsFS, but it's only temporary.

This should be be faster than uncompressing a compressed image into RAM, 
and the kernel will only cache the data that it needs as it accesses it. 
Since all write-backs will occur in RAM then this should be very fast.

Aras




______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
