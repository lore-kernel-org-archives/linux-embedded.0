From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [RFC 0/6] Proposal for a Generic PWM Device API
Date: Fri, 10 Oct 2008 18:36:42 +0900
Message-ID: <20081010093642.GA10579@linux-sh.org>
References: <cover.1223482372.git.bgat@billgatliff.com> <1223608819.8157.127.camel@pasglop> <48EED4D1.2040506@billgatliff.com> <Pine.LNX.4.64.0810101054140.12257@vixen.sonytel.be>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0810101054140.12257@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Bill Gatliff <bgat@billgatliff.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-embedded@vger.kernel.org

On Fri, Oct 10, 2008 at 11:00:09AM +0200, Geert Uytterhoeven wrote:
> On Thu, 9 Oct 2008, Bill Gatliff wrote:
> > Benjamin Herrenschmidt wrote:
> > > On Wed, 2008-10-08 at 11:43 -0500, Bill Gatliff wrote:
> > >> This series proposes a "generic PWM" driver API.
> > >>
> > >> This proposed API is motivated by the author's need to support
> > >> pluggable devices; a secondary objective is to consolidate the
> > >> existing PWM implementations behind an agreeable, consistent,
> > >> redundancy-reducing interface.
> > > 
> > >  .../...
> > > 
> > > You should send your patches to the main linux kernel list !
> > 
> > Perhaps.  But it seemed more relevant to this crowd, and the linux-embedded
> > crowd, and the linux-arm-kernel crowd.
> 
> Were did you actually sent them to?  Apparently you sent them to each mailing
> list (at least linux-embedded and linuxppc-dev) _separately_ (or using bcc).
> 
> Hence different people may give the same comments without knowing about each
> other, and you may have to explain everything multiple times.
> 
> I would go for lkml and linux-embedded, _together_.
> 
This is likely because some of those lists are subscribers only, so cross
posting is poor form. It makes sense to keep the discussion in one place,
and to send notification messages with a pointer to the list archives to
the other lists so folks can jump in if they really care. Splitting it
out doesn't help matters in the least, but unfortunately this is what
seems to happen the most when subscribers only lists are involved.
