From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Fri, 09 Sep 2011 14:53:20 +0300
Message-ID: <1315569206.7905.41.camel@sauron>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	 <1315280704.19067.14.camel@sauron> <1315282208.19067.24.camel@sauron>
	 <201109081726.00769.arnd@arndb.de>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:reply-to:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:message-id
         :mime-version;
        bh=SyS7JcTd09Gj95RGPoLOGy05uwMJrgbAkpIQH0Pkab0=;
        b=mS14184g61cLRTr0XSooNLBUG8PNr14rBr1fgVMnd31W5A+bW1r0AqJRppfDEnt5Zx
         AIDYczMsIEtB3Kz3ai8Ds1wjUl6XgKOdUWKfUKkjoThYYh2lL0fDX2l8/I7QGHRGg1EC
         HURwmv/tkYEwlpd0oUaBc4L32Up62f8IjEs0g=
In-Reply-To: <201109081726.00769.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: david.wagner@free-electrons.com, linux-mtd <linux-mtd@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

On Thu, 2011-09-08 at 17:26 +0200, Arnd Bergmann wrote:
> On Tuesday 06 September 2011, Artem Bityutskiy wrote:
> > Not sure about the bus approach - David, could you take a look at it
> > please? If we can handle errors there - then we could indeed re-use the
> > UBI control device. We could even re-use the ioctl data structures for
> > UBI volumes creation/removal - we have plenty of space there reserved
> > for future extensions.
> 
> I would generally recommend using new ioctl commands. ioctl numbers
> are cheap, but complexity in data structures is not, because every
> user who wants to deal with the data structures has to understand
> them. Also, changing the ABI is always tricky since you have to
> provide backward and forwards compatibility with existing kernels
> and with existing user space.

Hmm, what do we do if ubiblk module is not loaded, and UBI would have
to return an error (because the block device cannot be created), how
will UBI know that ubiblk is not there? Any direct call to ubiblk from
UBI would be a direct dependency and would require ubiblk to be always
loaded, which is bad.

IOW, we need a blocking mechanism to call the upper layer's function
(ubiblk) from the lower layer (UBI) which can return an error, and which
allows to check if a ubiblk exists at all. Do we have such mechanism?

Actually the fact of invoking upper layers from lower makes me worry.

And yes, the "bus"<->"devices" model does not look suitable in our case.
We have more like hierarchy: ubiblk uses ubi which usese mtd device.

David, I am really busy and now, I suggest you to think about this. I'd
so far stick to the own ubiblk cdev approach, and would
analyse/prototype the approach of using UBI cdev for this. I provided
some concerns above. Also, think about race conditions like:

1. Someone

-- 
Best Regards,
Artem Bityutskiy
