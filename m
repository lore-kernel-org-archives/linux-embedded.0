From: Markus Brunner <super.firetwister@googlemail.com>
Subject: Re: UIO not working on ppc405 onchip registers
Date: Fri, 5 Sep 2008 08:18:58 +0200
Message-ID: <200809050818.59425.super.firetwister@gmail.com>
References: <200807212152.16080.super.firetwister@gmail.com> <200807220948.51053.super.firetwister@gmail.com> <1216713170.4004.243.camel@moss.renham>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:to:subject:date:user-agent:cc
         :references:in-reply-to:mime-version:content-disposition
         :content-type:content-transfer-encoding:message-id:from;
        bh=D38/oaFCdbadDMNvMyEmc63MlbA+MsIH/JFk342Je60=;
        b=Cuefg3I5SBu5NycYSD576+PTeSTvzQKmvKWi/vforfm1KchXh16BdtMLMRKjDSHkWz
         mbuqJ0vSCfd27E3RWnn1kASypB7OEP8Jmx5fxSBoPZH3BvUeY2A4s60UnAcizrYQzPki
         HufrDw4WNq7x/qIaNVgYtPeXeB22QM1h9zpi0=
In-Reply-To: <1216713170.4004.243.camel@moss.renham>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ben Nizette <bn@niasdigital.com>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Tuesday 22 July 2008, Ben Nizette wrote:

> But I'll let you get back to solving the UIO problem at hand :-D

I already surrendered and created (hacked) a read/write driver, which let me 
use the old userspace drivers I'm trying to port (with some changes of 
course). This was way faster than understanding all the involved APIs and 
creating glue code between them. And the amount of time it needs was easy to 
estimate.

However accidently I ran over the "old school" userland mmap code 
with /dev/mem. I already knew mapping with /dev/mem is possible but I haven't 
thought this could make a difference.

http://ozlabs.org/pipermail/linuxppc-embedded/2006-August/023811.html

Also I was wrong with my assumption that uio worked well on the peripherals. 
It worked (very) well on the leds, just to fool me!!! But it returned crap on 
some version registers.

With a working and a non working version of mmap it should be rather easy to 
trace this bug. Unfortunately I was already short of time before running into 
this (and other) problems and it didn't get any better. 
So I would need some help from someone with more experience to fix this. 
Any instructions?

Markus
