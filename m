From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Mon, 16 May 2011 14:08:23 -0700
Message-ID: <1305580103.2503.21.camel@Joe-Laptop>
References: <BANLkTi=2jW5PHB6QCaddHeZH0P=9PKWosw@mail.gmail.com>
	 <1305577420-3685-1-git-send-email-abogani@kernel.org>
	 <1305579694.2503.18.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1305579694.2503.18.camel@Joe-Laptop>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>

On Mon, 2011-05-16 at 14:01 -0700, Joe Perches wrote:
> On Mon, 2011-05-16 at 22:23 +0200, Alessio Igor Bogani wrote:
> > Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>
> > diff --git a/kernel/module.c b/kernel/module.c
> > @@ -2055,10 +2055,8 @@ static const struct kernel_symbol *lookup_symbol(const char *name,
> >  	const struct kernel_symbol *stop)
> >  {
> >  	const struct kernel_symbol *ks = start;
> > -	for (; ks < stop; ks++)
> > -		if (strcmp(ks->name, name) == 0)
> > -			return ks;
> > -	return NULL;
> > +	return bsearch(name, start, stop - start,
> > +			sizeof(struct kernel_symbol), cmp_name);
[]
> why cmp_name and not strcmp?

Nevermind, cmp_name is obviously correct.
