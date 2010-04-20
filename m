From: Roger Quadros <roger.quadros@nokia.com>
Subject: Re: [RFC/PATCH 0/2] u_char.c and mtp.c patches
Date: Tue, 20 Apr 2010 11:11:07 +0300
Message-ID: <4BCD619B.2000907@nokia.com>
References: <1268123742-22968-1-git-send-email-felipe.balbi@nokia.com>	 <x2m63386a3d1004180824u30bea481t3a11ed889c26b293@mail.gmail.com>	 <z2w63386a3d1004190910o3698ad39w1167d81c12537e98@mail.gmail.com>	 <20100419162611.GA15131@nokia.com>	 <p2p63386a3d1004191223jb650984ft37372276e4870e87@mail.gmail.com>	 <l2s4a5ff6bc1004191403nfe758331h3b70cdfd40568338@mail.gmail.com> <u2s63386a3d1004191610va4b2aba3lc84c8b666f19a9e9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <u2s63386a3d1004191610va4b2aba3lc84c8b666f19a9e9@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ext Linus Walleij <linus.ml.walleij@gmail.com>
Cc: Steve Calfee <stevecalfee@gmail.com>, "Balbi Felipe (Nokia-D/Helsinki)" <felipe.balbi@nokia.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, "Krogerus Heikki (EXT-Teleca/Helsinki)" <ext-heikki.krogerus@nokia.com>, "Kaliuta Yauheni (Nokia-D/Helsinki)" <Yauheni.Kaliuta@nokia.com>, "Mandy Arnaud.2 (EXT-Teleca/Helsinki)" <ext-arnaud.2.mandy@nokia.com>, Greg KH <greg@kroah.com>, David Brownell <david-b@pacbell.net>, linux-embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, "libmtp-discuss@lists.sourceforge.net" <libmtp-discuss@lists.sourceforge.net>

ext Linus Walleij wrote:
> 2010/4/19 Steve Calfee <stevecalfee@gmail.com>:
> 
>> For 6 months, a while ago, I was working on virtual USB stuff for a
>> company. I did analyser traces of many devices including many MS
>> devices (mice, webcam, keyboard, joystick), and never found any device
>> from MS or anyone that supported that command. All devices that I saw
>> just replied (properly) with a STALL - and Winxp would just continue
>> on and handle the device.
> 
> I don't think they add it to that kind of devices. Only MTP players
> for what I've seen. Maybe some weirdo RNDIS stuff use it too?
> 
> But as you see Windows issues this command to absolutely everything
> you plug in, I've been thinking about how we could emulate the same
> behaviour in Linux but actually I think it's a bit insane and only take
> extra time to send that command to whatever you plug in.
> 
> Still it would be nice to know directly from userspace if a device that
> was plugged in was MTP or not, especially we need this for udev
> rules (or HAL, DeviceKit etc, whatever) that want to make the device
> read/writable for the console user when it's plugged in.
> 
>> When you say "older windowses", which one; the only earlier ones with
>> USB was 98 and descendants and somewhat 95.
> 
> Especially the Win98 and Win2000 stuff that comes with the Windows
> Media Player has to respond to it.
> 
> Actually Windows probably has some internal list of devices and
> specific quirks it has to use for them to work properly, but I'm not
> sure. (I asked them about it I think, but didn't get any replies.)
> 
>> Also have you found a device that actually responds to the "get
>> osdescriptor" request?
> 
> Almost all MTP devices out there does, check the logs here:
> http://libmtp.cvs.sourceforge.net/viewvc/libmtp/libmtp/logs/
> 
> If the device responds with something sane for command 0xee
> the MTP stack will go on to issue special commands, you can find
> our code for this here:
> http://libmtp.cvs.sourceforge.net/viewvc/*checkout*/libmtp/libmtp/src/libusb-glue.c?revision=1.284
> 

Do you know if these older Windows OSes request the OS descriptor when the 
device uses a standard USB class code?

AFAIK the MTP device device should use PTP Class, Subclass and protocol codes 
(i.e. 6:1:1). In this case Windows XP treats it as a PTP device (even if the 
device implements OS descriptors).
I'm sure all MTP devices in the market that implement OS descriptors use Vendor 
Specific class (i.e. 0xff:0:0) which is not the right thing to do after MTP has 
been standardized by usb.if.

cheers,
-roger
