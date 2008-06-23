From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Mon, 23 Jun 2008 20:57:28 +0200
Message-ID: <20080623185728.GB30550@uranus.ravnborg.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <87bq3rgq40.fsf@basil.nowhere.org> <1209582709.25560.441.camel@pmac.infradead.org> <200806231922.10864.vda.linux@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806231922.10864.vda.linux@googlemail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>

On Mon, Jun 23, 2008 at 07:22:10PM +0200, Denys Vlasenko wrote:
> On Wednesday 30 April 2008 21:11, David Woodhouse wrote:
> > On Wed, 2008-04-30 at 20:22 +0200, Andi Kleen wrote:
> > > David Woodhouse <dwmw2@infradead.org> writes:
> > > 
> > > > Andrew Morton has been saying recently that we need an 'embedded
> > > > maintainer', to take responsibility for 'embedded issues' in the core
> > > > kernel, as well as trying to improve our relationship with those using
> > > > the Linux kernel for 'embedded' devices -- who have a reputation of
> > > > not working with us very closely; to their detriment as well as our
> > > > own.
> > > 
> > > I hope your job description doesn't include adding more and more
> > > CONFIGs though.
> > > 
> > > I am sure there are lots of low hanging fruit where memory can be
> > > saved and it's a good thing someone cares about that, but please don't
> > > focus on the code size only. Or if you work on that don't do it 
> > > using CONFIG or when you really add a new one find some other 
> > > that is pointless and remove it first. 
> > > 
> > > There are simply already far too many of them and they make the 
> > > kernel harder and harder to change.
> > 
> > I agree. And if we do want to pay attention to pure code size, there are
> > other approaches -- like --gc-sections
> 
> I have some patches in this area too. Were submitted to Sam
> but he was too busy it seems.
They were not trivial to apply and so went down on the TODO list.
We could try to push the generic and x86 specific .lds stuff via
the arch maintainers?

	Sam
