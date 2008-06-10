From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 06:30:20 +0200
Message-ID: <20080610043020.GA31765@uranus.ravnborg.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200805281652.47558.rob@landley.net> <c384c5ea0806091427k3bd29168wbe55f6920054d44a@mail.gmail.com> <200806092253.11897.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806092253.11897.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

On Mon, Jun 09, 2008 at 10:53:11PM -0500, Rob Landley wrote:
> On Monday 09 June 2008 16:27:29 Leon Woestenberg wrote:
> > > I submitted a patch to remove the use of perl to build the linux kernel
> > > (which HPA added in 2.6.25) not because it affected the result, but
> > > because it unnecessarily complicates the build system.  (And perl tends
> > > to metasticize.
> >
> > Thanks, I hope it is or gets accepted.
> 
> Nope, Peter Anvin shot it down (saying what I was doing was a strange, purely 
> academic exercise), and Sam Ravnborg announced his vague intention to rewrite 
> large chunks of kbuild in perl in the future.  (Because nothing 
> says "maintainability" like perl...)
> 
> For some reason they wanted to mail me about it off-list rather than cc:ing 
> the list about this plan.
Rob - please reread the mails. It was your broken mailer or something
that caused it to be off-list.
When I hit reply-to-all in mutt I expect it to be sent to the list -
and in your case it did not not hit the list.

> 
> A number of embedded people emailed me about it off list, but nobody ever 
> replied to my post _on_ the list to say I wasn't alone in this, or acked the 
> patch to say it worked for them, or anything like that.  So there was a 
> perception of zero support, and I gave up trying to follow up on it for 
> 2.6.25.  I've got it working for me, and if more perl shows up I'll come up 
> with more patches to remove it for my own personal build environment.
> 
> I might try to submit again in a few months
Then please try to address the comments first.

	Sam
