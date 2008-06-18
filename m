From: "Amol Lad" <amol.lad@gmail.com>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Wed, 18 Jun 2008 18:08:10 +0530
Message-ID: <8c675e9b0806180538m1dc594b3h1db104ed1afaf65d@mail.gmail.com>
References: <48580116.9070504@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=3/EMN6UrHflyGqEBlTr7X6LnYQlNJ94muUmwAPPHWWA=;
        b=ftdiS0nirXhKv/uBtyaTG0e66xUMXjz5BVH4Pdz/lB8OLT9y+4sFMoo/q2RPi69rra
         canyPMGP7qY+1Tjq6s+Q5v9w7/o9BmbkHaeQ9KMdMwaCX8lxox96zOEiquG3KZihTWNT
         vfJDR12TZbu7dfzjPdnAj0GSWoIieK1kxpHhM=
In-Reply-To: <48580116.9070504@am.sony.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

>
> I am working with a product team on bootup time issues.  One technique
> that we are forward-porting from an old kernel (and that I thought I
> might work on mainlining) is to compile modules statically into the kernel,
> but defer their initialization until after boot time.


I landed in same problem sometime back with USB and tried two approaches

1. Dirty approach of deferring loading of all usb modules till you see
application startup "from user point of view" is done. I then just
call into a script which loads all the usb modules "in parallel" with
rest of app initialization

2. The usb modules that I load are usbcore, host controller driver,
scsi_mod, sd_mod and usb_storage. I noted that it's actually scsi
enumeration that takes a long time; usb enumeration was much faster. I
compiled usbcore and host controller driver statically in the kernel,
enabled CONFIG_HOTPLUG and did rest of the module loading in a script
invoked from /sbin/hotplug.

Amol
