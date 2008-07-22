From: super.firetwister@googlemail.com
Subject: Re: UIO not working on ppc405 onchip registers
Date: Tue, 22 Jul 2008 09:48:49 +0200
Message-ID: <200807220948.51053.super.firetwister@gmail.com>
References: <200807212152.16080.super.firetwister@gmail.com> <20080722061730.GB12576@digi.com> <1216708967.4004.238.camel@moss.renham>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:to:subject:date:user-agent:cc
         :references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id:from;
        bh=KXW8D1HYBiOIzfSUwZ6+lWk1RwEZOIt1C2WkQDESOBI=;
        b=S41XaONnF8rJl/5QjLWALxDe6WJQ8OusSD7oet+PhGLMPyAZWYpcbkOlzgqXJz4eqI
         QoYY4O3XPoLFr1sAiLFhEnwTMh/GAayyQUGpI/ZahbOv/+6zFdRkX4/3N8CDDOmaiYns
         ZsIhtzrjpUDsuc0AnaD79UrKm3K2HOIa7QSwY=
In-Reply-To: <1216708967.4004.238.camel@moss.renham>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ben Nizette <bn@niasdigital.com>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Tuesday 22 July 2008, Ben Nizette wrote:

> As an aside, you sure you want to do this anyway?  

No ;)


> I'd suggest that you 
> just do a gpio chip driver for this, tie it in to gpiolib and use the
> gpiolib user interface (which IIRC has only made it as far as -mm but is
> on the way up).  This gives kernel internals nice access to the pins as
> well through the standard gpio framework.

This was just an example to make it others easier to reproduce my problem. My 
goal is to have a soft spi driver in userspace, which would probably be 
slower if it uses gpiolib. This driver is integrated in the application I 
want to port to Linux. 

Thanks

Markus
