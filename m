From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Mon, 23 Jun 2008 19:28:09 +0200
Message-ID: <200806231928.09458.vda.linux@googlemail.com>
References: <1209577322.25560.402.camel@pmac.infradead.org> <1209636171.25560.508.camel@pmac.infradead.org> <20080501104158.GM20451@one.firstfloor.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=AzT3tcM05CsDIN5XtFMvdDYFpLizw+V8XZrKZO2L+uw=;
        b=ZkslH4XELwShKeKQZrhVpA/dOdfDZlLALjHXcNVvNrRJAZGyUGN9LY+WqQRJz6q6DR
         jnwjMtY0nbRVZVVOklG373U9tKUDP1/ERr9sQD20C6oJDXCfUs6iGVogXqgxKDOjUSdI
         5syKRPVMxVvWugHGXWH3Y9rdlhBJDdua+y3aE=
In-Reply-To: <20080501104158.GM20451@one.firstfloor.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <andi@firstfloor.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 01 May 2008 12:41, Andi Kleen wrote:
> > To a large extent, I agree. I certainly don't want to focus solely on
> > code size; there's a lot more to embedded Linux than that. But it _is_
> 
> Not only code size, far more important is dynamic memory consumption.
> [admittedly we right now lack a good instrumentation framework for this]
> 
> > There are some cases where we really _do_ want to have CONFIG options,
> > but I agree that we should keep them to a minimum. And when we _do_ have
> > CONFIG options, they don't have to litter the actual code with ifdefs.
> 
> The problem I see is more that really nobody can even compile not 
> alone test all these combinations anymore. Hidding the problem in inlines
> does not solve that. And no randconfig is not the solution either.

Because we allowed kernel to be developed without the requirement that
random config should be buildable for release kernels.

Had it been a requirement, keeping it in shape wouldn't be
too difficult.

Sure enough, _now_ fixing kernel to pass such a test on i386
would take several weeks of work at least. But it is doable.

I would even volunteer to do it if there are some
reasonable chances resulting patches would be viewed
as worthwhile for inclusion. I am somewhat tired
of killing weeks of my time only to find that my work
is deemed "not important enough for inclusion".
--
vda
