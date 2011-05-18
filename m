From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Wed, 18 May 2011 10:40:15 +0930
Message-ID: <87ipt8n79k.fsf@rustcorp.com.au>
References: <BANLkTi=2jW5PHB6QCaddHeZH0P=9PKWosw@mail.gmail.com> <1305577420-3685-1-git-send-email-abogani@kernel.org> <878vu6nftw.fsf@rustcorp.com.au> <4DD2CA02.9040707@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4DD2CA02.9040707@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Behme <dirk.behme@googlemail.com>
Cc: Alessio Igor Bogani <abogani@kernel.org>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>

On Tue, 17 May 2011 21:18:26 +0200, Dirk Behme <dirk.behme@googlemail.com> wrote:
> On 17.05.2011 05:52, Rusty Russell wrote:
> > On Mon, 16 May 2011 22:23:40 +0200, Alessio Igor Bogani<abogani@kernel.org>  wrote:
> >> This work was supported by a hardware donation from the CE Linux Forum.
> >>
> >> Signed-off-by: Alessio Igor Bogani<abogani@kernel.org>
> >> ---
> >>   kernel/module.c |    6 ++----
> >>   1 files changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/kernel/module.c b/kernel/module.c
> >> index 6a34337..54355c5 100644
> >> --- a/kernel/module.c
> >> +++ b/kernel/module.c
> >> @@ -2055,10 +2055,8 @@ static const struct kernel_symbol *lookup_symbol(const char *name,
> >>   	const struct kernel_symbol *stop)
> >>   {
> >>   	const struct kernel_symbol *ks = start;
> >> -	for (; ks<  stop; ks++)
> >> -		if (strcmp(ks->name, name) == 0)
> >> -			return ks;
> >> -	return NULL;
> >> +	return bsearch(name, start, stop - start,
> >> +			sizeof(struct kernel_symbol), cmp_name);
> >>   }
> >>
> >>   static int is_exported(const char *name, unsigned long value,
> >
> > Applied.
> 
> Sorry, but where have you applied it?

The -rr tree which goes to linux-next.

> With the version above we should get a warning
> 
> kernel/module.c: In function 'lookup_symbol':
> kernel/module.c:1809: warning: unused variable 'ks'

Yep, fixed that up too, thanks.

Cheers,
Rusty.
