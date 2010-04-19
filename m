From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Tue, 20 Apr 2010 01:10:19 +0200
Message-ID: <u2s63386a3d1004191610va4b2aba3lc84c8b666f19a9e9@mail.gmail.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>
	 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>
	 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>
	 <20100419162611.GA15131@nokia.com>
	 <p2p63386a3d1004191223jb650984ft37372276e4870e87@mail.gmail.com>
	 <l2s4a5ff6bc1004191403nfe758331h3b70cdfd40568338@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=AXK1eWIMFbw8KdgQJ7W9wgaojjsOv8nOnDCb1JWOCzs=;
        b=DEYQD0PDMgDg1dkKEzVbUEmHS8Wr+NKOlQgUjqf5uIcIeoGrZOynf7L4EA6gk8a63Z
         41Rscs9l4Z5P5sAC2gwDriRvub49JVxXqFFy8iOrHNH2VbOcGqRukEbRVhXl221WFiO4
         Hb69L/hpj3E3VmxZTAqZ5plxaGhHIct/Ajsss=
In-Reply-To: <l2s4a5ff6bc1004191403nfe758331h3b70cdfd40568338@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Calfee <stevecalfee@gmail.com>
Cc: felipe.balbi@nokia.com, Linux USB Mailing List <linux-usb@vger.kernel.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus@nokia.com>, "Quadros Roger (Nokia-D/Helsinki)" <roger.quadros@nokia.com>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta@nokia.com>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy@nokia.com>, Greg KH <greg@kroah.com>, David Brownell <david-b@pacbell.net>, linux-embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, "libmtp-discuss@lists.sourceforge.net" <libmtp-discuss@lists.sourceforge.net>

2010/4/19 Steve Calfee <stevecalfee@gmail.com>:

> For 6 months, a while ago, I was working on virtual USB stuff for a
> company. I did analyser traces of many devices including many MS
> devices (mice, webcam, keyboard, joystick), and never found any device
> from MS or anyone that supported that command. All devices that I saw
> just replied (properly) with a STALL - and Winxp would just continue
> on and handle the device.

I don't think they add it to that kind of devices. Only MTP players
for what I've seen. Maybe some weirdo RNDIS stuff use it too?

But as you see Windows issues this command to absolutely everything
you plug in, I've been thinking about how we could emulate the same
behaviour in Linux but actually I think it's a bit insane and only take
extra time to send that command to whatever you plug in.

Still it would be nice to know directly from userspace if a device that
was plugged in was MTP or not, especially we need this for udev
rules (or HAL, DeviceKit etc, whatever) that want to make the device
read/writable for the console user when it's plugged in.

> When you say "older windowses", which one; the only earlier ones with
> USB was 98 and descendants and somewhat 95.

Especially the Win98 and Win2000 stuff that comes with the Windows
Media Player has to respond to it.

Actually Windows probably has some internal list of devices and
specific quirks it has to use for them to work properly, but I'm not
sure. (I asked them about it I think, but didn't get any replies.)

> Also have you found a device that actually responds to the "get
> osdescriptor" request?

Almost all MTP devices out there does, check the logs here:
http://libmtp.cvs.sourceforge.net/viewvc/libmtp/libmtp/logs/

If the device responds with something sane for command 0xee
the MTP stack will go on to issue special commands, you can find
our code for this here:
http://libmtp.cvs.sourceforge.net/viewvc/*checkout*/libmtp/libmtp/src/libusb-glue.c?revision=1.284

Basically it's a simple libusb command we issue:

/* Read the special descriptor */
ret = usb_get_descriptor(devh, 0x03, 0xee, buf, sizeof(buf));

// Dump it, if requested
if (dumpfile != NULL && ret > 0) {
  fprintf(dumpfile, "Microsoft device descriptor 0xee:\n");
  data_dump_ascii(dumpfile, buf, ret, 16);
}

It typically looks like this:

Microsoft device descriptor 0xee:
        0000: 1203 4d00 5300 4600 5400 3100 3000 3000   ..M.S.F.T.1.0.0.
        0010: 1c00                                      ..
Microsoft device response to control message 1, CMD 0x1c:
        0000: 2800 0000 0001 0400 0100 0000 0000 0000   (...............
        0010: 0001 4d54 5000 0000 0000 3030 0000 0000   ..MTP.....00....
        0020: 0000 0000 0000 0000                       ........
Potential MTP Device with VendorID:22b8 and ProductID:6415 responded
to control message 2 with a response that was too short. Problems may
arrise but continuing
Device info:

But Ziilabs Egg actually reply properly to the second control message:

Microsoft device descriptor 0xee:
	0000: 1203 4d00 5300 4600 5400 3100 3000 3000	..M.S.F.T.1.0.0.
	0010: 0100                                   	..
Microsoft device response to control message 1, CMD 0x01:
	0000: 2800 0000 0001 0400 0100 0000 0000 0000	(...............
	0010: 0001 4d54 5000 0000 0000 0000 0000 0000	..MTP...........
	0020: 0000 0000 0000 0000                    	........
Microsoft device response to control message 2, CMD 0x01:
	0000: 0c00 0000 0001 0500 0000 0000          	............

A special oddity is devices that *require* you to probe the
device descriptor and won't even work if you don't:
ZiiLabs Egg, several SanDisk Sansas, and some LGE phones
display this behaviour.

Since the devices are only ever tested with Windows nobody notice
that they don't work properly without the probing...

There are some more generic USB misbehaviour displayed by these
devices I can list if you're interested.

Yours,
Linus Walleij
