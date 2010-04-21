From: Roger Quadros <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Wed, 21 Apr 2010 10:07:48 +0300
Message-ID: <4BCEA444.20307@nokia.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>	 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>	 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>	 <20100419162611.GA15131@nokia.com>	 <p2p63386a3d1004191223jb650984ft37372276e4870e87@mail.gmail.com>	 <l2s4a5ff6bc1004191403nfe758331h3b70cdfd40568338@mail.gmail.com>	 <u2s63386a3d1004191610va4b2aba3lc84c8b666f19a9e9@mail.gmail.com>	 <4BCD619B.2000907@nokia.com> <i2x63386a3d1004201644g685b8ddeo609c6eaa8c07ed1f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <i2x63386a3d1004201644g685b8ddeo609c6eaa8c07ed1f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ext Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Steve Calfee <stevecalfee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Balbi Felipe (Nokia-D/Helsinki)" <felipe.balbi-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, linux-embedded <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, "libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <libmtp-discuss-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>

ext Linus Walleij wrote:
> 2010/4/20 Roger Quadros <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>:
> 
>>> http://libmtp.cvs.sourceforge.net/viewvc/*checkout*/libmtp/libmtp/src/libusb-glue.c?revision=1.284
>> Do you know if these older Windows OSes request the OS descriptor when the
>> device uses a standard USB class code?
> 
> I haven't tested, but I think Windows will attempt to always use the OS
> descriptor first and foremost.
> 
>> AFAIK the MTP device device should use PTP Class, Subclass and protocol
>> codes (i.e. 6:1:1). In this case Windows XP treats it as a PTP device (even
>> if the device implements OS descriptors).
>>
>> I'm sure all MTP devices in the market that implement OS descriptors use
>> Vendor Specific class (i.e. 0xff:0:0) which is not the right thing to do
>> after MTP has been standardized by usb.if.
> 
> Yes they should, but still very few devices, if any, use the PTP class code.
> 
> The reason behind, and the reason to why they use the OS descriptor at all,
> if I understood correctly, was that Microsoft actually *wanted* to use the PTP
> class for MTP devices, but to do that the MTP extensions had to pass
> through the USB IF standardization process which took some three years or
> so. In the meantime USB IF forbade them to use the PTP class code for
> something that was not officially a PTP extension.
> 
> So these devices all are class 0xff  "vendor specific" or 0x00 "defined at
> interface level". (One device mistakedly use class code 111 decimal!)
> I haven't however looked at what they're using as bInterfaceClass really,
> perhaps there are MTP devices out there that define themselves as PTP,
> I've never heard of one, other than the experimental device that was used
> to implement the proper detection algorithm in libmtp.
> 
> I think Windows only knows they are MTP devices by either
> probing the OS descriptor or having a built-in table of MTP-compliant
> vendor/device ID pairs. Probably both, because some of the very earliest
> "PMC" (Portable Media Center) models didn't even have OS descriptors.
> 
> I guess Felipe may have first-hand experience with using the PTP class
> code only? Maybe this works in the latest Windowses, post-USB IF
> standardization? No idea.
> 
> Maybe tagging a device with the PTP class  and subclass 0x01 will make
> it always fall back to PTP mode only under Windows, MTP features disabled,
> this would not surprise me one bit.
> 
I can confirm this. Using PTP class code for an MTP device and no OS 
descriptors, falls back to PTP mode on Windows XP. On Windows 7 it works as MTP 
device. Need to confirm on Vista though.

On Linux (Ubuntu 9.04) it works as PTP device.

-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
