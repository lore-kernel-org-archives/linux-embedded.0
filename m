From: "Linus Walleij" <linus.ml.walleij@gmail.com>
Subject: Re: building Rootfs
Date: Wed, 9 Jul 2008 01:53:46 +0200
Message-ID: <63386a3d0807081653t5e19cae2vd35c03de4bec7fa8@mail.gmail.com>
References: <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com>
	 <20080708140034.B2B7424681@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=mvxYy2e8Hb/IwHZIlhsLJggoGcpWS9oVxXPPAZlVJzA=;
        b=dsg5iT8GWJRlGqQBI39Cf6vvbvYDNRJODDumyO6qX5DaJU7qfv4oiX/EMfTLGzowyS
         Zmyy38he3q22ZW1WD9G4U6HuQtoidUfAWoncEmlrmnThRFaDI2ie7JkfQ1DOQ7ZB+a7h
         jwZBg923jY4s2wfvNGv8AxnpdpG8eDRU9X0V8=
In-Reply-To: <20080708140034.B2B7424681@gemini.denx.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

2008/7/8 Wolfgang Denk <wd@denx.de>:

>> 3. Getting files into the filesystem when the development
>> system does not allow root access.

> 3. is a non-issue for most common file systems.

The only one thing I ever ran into trouble with was device nodes,
these cannot be reproduced any way, not even with fakeroot
environments, just in scratchbox, which in turn needs you to be root.

initramfs etc can handle it with special description files. But if
you want to cook up say a .tar file of your rootfs, you're pretty
much lost AFAIK.

The good thing is that you don't need the device nodes
if you have udev, I think the kernel wants /dev/console
and a few more at boot but actually it survives just fine
without them.

The rest is possible to create with fakeroot and clever
scripting if I'm not mistaken.

If you know some way of sneaking a device node into a
.tar file created ENTIRELY running as a regular user,
tell me!

Linus
