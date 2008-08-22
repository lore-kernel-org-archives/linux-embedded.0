From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: kernel dump solutions
Date: Thu, 21 Aug 2008 22:54:59 -0400
Message-ID: <1219373699.26429.71.camel@jdub.homelinux.org>
References: <1218656903.10489.50.camel@localhost.localdomain>
	 <21f828e90808211853r6e92f6b9ta4bf9252ed63eccd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=OnpAjlKC9M1rl5Fm7WQ75/J2QGlpxzHCauPW36aeDOw=;
        b=GTVSUiMdWlHIjaYMSinp/SOE5vS1Al5I06HFni18+ZCg0h1UoHBgRXcDhr2PfBgojq
         nGWh/YD1VI4cYH/42PgXBVDqo5z3XzLbJdmHic0sM6V5oX4fuN52mhOPnj9pAd4IdN+x
         H93OliF8G3DgTwvP09w5KGpH/ExkkkkdsopKw=
In-Reply-To: <21f828e90808211853r6e92f6b9ta4bf9252ed63eccd@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Randy MacLeod <rwmacleod@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Thu, 2008-08-21 at 21:53 -0400, Randy MacLeod wrote:
> On Wed, Aug 13, 2008 at 3:48 PM, Josh Boyer <jwboyer@gmail.com> wrote:
> > Hi All,
> >
> > I'm curious what people are using for a kernel dump solution on embedded
> 
> Create a region of memory that pesist across resets.
> Put kernel panic info, exceptiions and scheduling events into said memory.
> Profit!

I've done that many times.  It works well enough, but it's not a dump.
I've actually used some dumps to debug some rather difficult kernel
problems in the past, but there are increasingly fewer options these
days.

> If only more manufactures would support this in the bios...
> Intel and BIOS writter folks are you listening?

BIOS... yeah... I don't have a BIOS.  That's the best way to deal with
that.

josh
