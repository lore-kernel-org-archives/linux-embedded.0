From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Sun, 14 Jun 2009 09:15:50 +0200
Message-ID: <4A34A3A6.3080604@gmail.com>
References: <4A33A7EC.6070008@gmail.com> <20090613140459.GC30053@uranus.ravnborg.org> <200906140059.57362.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=1RChvx+XY1yLRD6OtZhW4cr0toe99VndGrJTtbtsQYs=;
        b=gszWV/296WC9Do/BuVj119X7y7L2PPJJJb0/mJwpKHcIxZD6iCKlzmhRYCTRql/v6t
         DkmxHT3TkrBq+dKtTHCKjkwYeLnNKGw/Tr5S7VUNVK8Bhgft8uOCJHcDGKVlC7XRnrWw
         zBpi+eloXylnVEHestDbPBCC8meCAjx+Y3NBI=
In-Reply-To: <200906140059.57362.arnd@arndb.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Arnd Bergmann wrote:
> On Saturday 13 June 2009, Sam Ravnborg wrote:
>>> +     union {
>>> +             struct {
>>> +                     /*
>>> +                      * ptr to row block of 2D block pointer array,
>>> +                      * file block #'s 0 to (blocksize/4)^2 - 1.
>>> +                      */
>>> +                     off_t row_block;
>> It is my understanding that we shall use: __kernel_off_t
>> in exported headers.
> 
> That is a correct understanding in general, however this case is
> different, because it describes an on-disk data structure,
> not a kernel to user space interface. Here, __kernel_off_t is just
> as wrong as off_t, because it will differ between 32 and 64 bit
> architectures, making the fs layout incompatible. I'd suggest
> simply defining this as __u64.
> 
> Moreover, file system layout should be described in terms of
> big-endian or little-endian types (e.g. __be64 or __le64),
> together with the right accessor functions.
> 
> 	Arnd <><
> 

Yep, you're right. I have to change the definition to be compatible
between 32 and 64 bit archs.

Marco
