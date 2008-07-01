From: Rob Landley <rob@landley.net>
Subject: Re: selecting initramfs support without initrd?
Date: Mon, 30 Jun 2008 23:46:38 -0500
Message-ID: <200806302346.38954.rob@landley.net>
References: <alpine.LFD.1.10.0806241805390.5000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.1.10.0806241805390.5000@localhost.localdomain>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: linux-embedded@vger.kernel.org

On Tuesday 24 June 2008 17:11:01 Robert P. J. Day wrote:
>   i'm not sure if this is the proper forum for this, but while
> perusing the early boot code, i noticed that selecting the config
> variable BLK_DEV_INITRD gives you support for both initramfs, and an
> initrd image.

It gives you support for an _external_ initramfs.  (I.E. the bootloader can 
load an external blob into memory and feed the physical address into the 
kernel via the ramdisk_start=12345 command line option.  If this blob gunzips 
to a cpio image, it's extracted into rootfs.  If it gunzips to a recognized 
filesystem type, it's used as an initrd.)

The one built into the kernel is always used and can't be disabled, that I am 
aware of.  If you have files in the static cpio archive and files in an 
internally supplied cpio archive, the file in the external one replaces the 
corresponding file in the internal one.

>   based on a quick inspection of the source under init/, it would seem
> that you could whack out sizable chunks of code if you had no need for
> initrd, but i could be wrong.

If you disable BLK_DEV_INITRD you'll still have a cpio image built into your 
kernel:

make allnoconfig
make -j 3

It's possible that inclusion of the external image loading logic should be 
based on a symbol other than BLK_DEV_INITRD, since initramfs can use that 
logic when you never use a ram disk block device.  It's a question of 
untangling stuff and figuring out how much config granularity you want...

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
