From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [RFC] Remove more code when IP_MULTICAST=n
Date: Tue, 26 Aug 2008 12:33:46 +0900
Message-ID: <20080826033345.GA30587@linux-sh.org>
References: <20080819150047.38f09acf@surf> <Pine.LNX.4.64.0808191618190.25348@vixen.sonytel.be> <20080825084826.19923151@surf>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080825084826.19923151@surf>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, linux-embedded@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

On Mon, Aug 25, 2008 at 08:48:25AM +0200, Thomas Petazzoni wrote:
> Le Tue, 19 Aug 2008 16:18:38 +0200 (CEST),
> Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> a ??crit :
> 
> > On Tue, 19 Aug 2008, Thomas Petazzoni wrote:
> > > [RFC] Remove more code when IP_MULTICAST=n
> > 
> > Probably you wanted to cc netdev@vger.kernel.org?
> 
> Not necessarly at the beginning: I first wanted to get the feedback of
> embedded-concerned developers, who might have a better understanding
> than me of the networking stack. Last time I submitted a size-reduction
> patch to Dave Miller concerning IGMP, the answer was:
> 
> ??
> I'm not applying this.
> 
> This removes core parts of the BSD socket API from applications.
> Like TCP and UDP, multicast capabilities are something applications
> can always depend upon being available.
> 
> If you want a broken networking implementation, you have the source
> code, so you can do it in your own tree.
> ??
> 
> So, I'd prefer to send a good patch from the beginning.
> 
Out of that bit of criticism, it's the validity of the approach in
particular that's being called in to question, rather than the patch
itself. How to clean up the patch itself is irrelevant if the idea itself
is being shot down by the folks that will merge it. This is something
that needs to be resolved first, and lists outside of the scope of netdev
are really the wrong place to do this.

This is generally the way a lot of the size reduction work seems to be
going these days. Now that most of the low-hanging fruit is out of the
way, it's mostly down to micro-optimizations aimed at things perceived to
be core functionality by others. Expect to continue running in to these
sorts of problems if you choose to continue down this path.
