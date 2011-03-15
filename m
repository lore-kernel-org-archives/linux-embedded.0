From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: SPI controller laying around...
Date: Tue, 15 Mar 2011 15:09:46 -0400
Message-ID: <AANLkTik-kwS=0qMaeLJi72bRT_ZsP9iH7O703OzVOFen@mail.gmail.com>
References: <1300202610.8754.40.camel@jfddesk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=kY3zznPIPpKtp/lbBC21h/qyxpoONmNVQnfsI3GT+1Q=;
        b=mg8A0Ol79ej+88kgjB3rV8FqfcFx844846ucWRQ44j7xOnOiSuGLANi9zVbuqnqGGM
         OC52s9u06xnrgdnGGyMukdgeyG6SnAE1TFBhUBWHeurNDzhox/R4PI+6lgR4T9FvvLAg
         dC3R/RHLkVcaqvShlZ4W8y//4tIbnwR+esGrg=
In-Reply-To: <1300202610.8754.40.camel@jfddesk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Tue, Mar 15, 2011 at 11:23, Jean-Francois Dagenais wrote:
> I need to perform some tests and I am in need of any SPI controller I
> could use through the standard SPI master framework of the kernel.
>
> I could perhaps hack the BIOS SPI for example (fool around with the chip
> select and solder some wires to export to a bread board. Or I am sure my
> workstation has one on the motherboard (dell vostro 430) for some odd
> functionnality... but it's not enumerated and probed as an SPI master.
>
> Or maybe even old ethernet cards I have lying around which could be
> hacked?
>
> Or a simple USB-SPI dongle? Anyone knows one that will just plain works
> with the kernel?
>
> Any thoughts?

if you have just 4 GPIOs, you can use the SPI bit banging bus
-mike
