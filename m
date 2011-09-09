From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Fri, 09 Sep 2011 15:02:45 +0300
Message-ID: <1315569770.7905.45.camel@sauron>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	 <1315280704.19067.14.camel@sauron> <1315282208.19067.24.camel@sauron>
	 <201109081726.00769.arnd@arndb.de> <1315569206.7905.41.camel@sauron>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:reply-to:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:message-id
         :mime-version;
        bh=2fMxKb05SrwADfNT0eEBnpEiH8/21JudEDqBRkOHTbY=;
        b=uxe3u2T6a7qcUirVz6OwNbdmWnHM0dhzwvMGl4M2rkWMV/yAuJl5/9xskTjBekCRTD
         lZsPngh92gY+zPH4pwmATRR9rEIJFZ/R5WJhIfeghCeIdhahDMriwgHyNdMoWvkZlIA0
         0C+t8SncxlSdSyfV3U5pLr6HdW1IEGrpnql9s=
In-Reply-To: <1315569206.7905.41.camel@sauron>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david.wagner@free-electrons.com
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>, Arnd Bergmann <arnd@arndb.de>

On Fri, 2011-09-09 at 14:53 +0300, Artem Bityutskiy wrote:
> David, I am really busy and now, I suggest you to think about this. I'd
> so far stick to the own ubiblk cdev approach, and would
> analyse/prototype the approach of using UBI cdev for this. I provided
> some concerns above. Also, think about race conditions like:
> 
> 1. Someone

Sorry, I wonted to talk about situations when someone opens an ubiblk
device while the underlying UBI volume is being removed, but then though
this is trivial and forgot to erase the last sentence.

Anyway, I suggest the following algorithm:

1. Stick with the own cdev approach - the driver becomes very simple
   in this case - we review it.
2. Once it is ready, or in parallel, you can play with the second
   approach and if you find it solid/nice, you can then provide a
   new version and/or the delta.

The idea is that on step 1 we review/deal with other things, without
being blocked by the ioctl stuff.

-- 
Best Regards,
Artem Bityutskiy
