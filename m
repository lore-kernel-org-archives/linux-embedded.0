From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: New fast(?)-boot results on ARM
Date: Tue, 18 Aug 2009 12:06:48 +0200
Message-ID: <4A8A7D38.5020201@gmail.com>
References: <20090814170228.GM13320@pengutronix.de> <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com> <20090814204305.GA31727@pengutronix.de> <20090815103532.GA5596@sig21.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758488AbZHRKL2@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=qbNMD3uMP1jUPM9FJ9odjfQH8LUAozjc8mJqh6KGceo=;
        b=CC8uqUeKn70AqvjmBcxel+JAcWqKJ+JVMaH2aizwSpoTy7mXBHgVyceKmVJdTQVlpA
         zjqzRZA8YlTvhxArX+O7Fgq5ixaZlBYbDqtmcQGm3xUQCqoPBs6A/c3n127Vg80Tnq5c
         fIG9LJDXlFwUgeBYPXocsyeJ2z4krxuVaAbg4=
In-Reply-To: <20090815103532.GA5596@sig21.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Johannes Stezenbach <js@sig21.net>, Denys Vlasenko <vda.linux@googlemail.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

Johannes Stezenbach wrote:
> On Fri, Aug 14, 2009 at 10:43:05PM +0200, Robert Schwebel wrote:
>> On Fri, Aug 14, 2009 at 10:04:57PM +0200, Denys Vlasenko wrote:
>>>> rsc@thebe:~$ microcom | ptx_ts "U-Boot 2.0.0-rc9"
> 
>>>> [  7.137924] <  0.059316> starting udev
>>>> [  7.147925] <  0.010001> mounting tmpfs at /dev
>>>> [  7.182299] <  0.034374> creating static nodes
>>>> [  7.410613] <  0.228314> starting udevd...done
>>>> [  8.811097] <  1.400484> waiting for devices...done
> 
> And suddenly devtmpfs sounds like a good idea ;-)
> 
> We use static device nodes during boot, and later
> setup busybox mdev for hotplug.
> 
> 
> Johannes
> 

Yeah, I agree, do you really need udevd, device file creation at every
start-up in /dev? Usually static devices nodes and mdev for hotplug are
enough or at least you could use a simple script to create only once
time the devices file (mdev -s). About the fs, do you really need a
rootfs with ubifs? I mean, you could "split" your fs. You could use a
read-only fs (SquashFS for example) for your root-fs, ubifs for
permanent storage data (mounted under /data for example) and a ram fs
for volatile data.

Marco
