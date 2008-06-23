From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Mon, 23 Jun 2008 21:12:30 +0200
Message-ID: <200806232112.30393.vda.linux@googlemail.com>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806231922.10864.vda.linux@googlemail.com> <20080623185728.GB30550@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=7edWihYmoQDHxfV4aK86nOO6PwKNet13uDTlHVOzc+M=;
        b=TXqPFb3NaDO3nO81m2gffFXLJV3rjs6HklFLq8oHT0it7ZPa7rX2h27k1EBRKuZ7H0
         nHXkVdb0nXSqWIAPGt1JV9q+SBns+zelpQAg2rjTxZJ4FC8sTZt7yw4uNMdCLamD8CI2
         3mel07yLiy2IkLreI81XRIAlAhJRAOVyWFKRw=
In-Reply-To: <20080623185728.GB30550@uranus.ravnborg.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>

On Monday 23 June 2008 20:57, Sam Ravnborg wrote:
> > > I agree. And if we do want to pay attention to pure code size, there are
> > > other approaches -- like --gc-sections
> > 
> > I have some patches in this area too. Were submitted to Sam
> > but he was too busy it seems.
>
> They were not trivial to apply and so went down on the TODO list.

I realize that they were not trivial to review, but that
was unavoidable. They were even more not trivial to create.

> We could try to push the generic and x86 specific .lds stuff via
> the arch maintainers?

IIRC I splitted the entire GC collection patch in a way
that first patches were doing exactly this easier first part
and I hoped that at least these first patches
will be taken. They were big, but somewhat trivial,
from "it's obviously safe" department.

Had they been applied, now making --gc-sections to work
would be easier.
--
vda
