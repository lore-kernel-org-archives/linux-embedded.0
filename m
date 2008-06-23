From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Mon, 23 Jun 2008 19:22:10 +0200
Message-ID: <200806231922.10864.vda.linux@googlemail.com>
References: <1209577322.25560.402.camel@pmac.infradead.org> <87bq3rgq40.fsf@basil.nowhere.org> <1209582709.25560.441.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=lOEfB6cFafu3ujmMXW1JC3PKIfo+SXW0CkfD4dLxewI=;
        b=d+SS0Mxm7IqZgiRs5x7qj6ncHh9xItKoQh5Ht4fdNoVBx+V/nCNln/t1l/D/7QsXNQ
         k7d92hc3aEZzs9b6QPiyorFvLnuKYF/g2F5QifRcV04W+hkhaJgsXEAD3CBslsGuhOD7
         J6SvB8XFWh/U/Yq9+rcpxNnrpYGH57cWkDuBs=
In-Reply-To: <1209582709.25560.441.camel@pmac.infradead.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>

On Wednesday 30 April 2008 21:11, David Woodhouse wrote:
> On Wed, 2008-04-30 at 20:22 +0200, Andi Kleen wrote:
> > David Woodhouse <dwmw2@infradead.org> writes:
> > 
> > > Andrew Morton has been saying recently that we need an 'embedded
> > > maintainer', to take responsibility for 'embedded issues' in the core
> > > kernel, as well as trying to improve our relationship with those using
> > > the Linux kernel for 'embedded' devices -- who have a reputation of
> > > not working with us very closely; to their detriment as well as our
> > > own.
> > 
> > I hope your job description doesn't include adding more and more
> > CONFIGs though.
> > 
> > I am sure there are lots of low hanging fruit where memory can be
> > saved and it's a good thing someone cares about that, but please don't
> > focus on the code size only. Or if you work on that don't do it 
> > using CONFIG or when you really add a new one find some other 
> > that is pointless and remove it first. 
> > 
> > There are simply already far too many of them and they make the 
> > kernel harder and harder to change.
> 
> I agree. And if we do want to pay attention to pure code size, there are
> other approaches -- like --gc-sections

I have some patches in this area too. Were submitted to Sam
but he was too busy it seems.
--
vda
