From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 01:55:31 -0500
Message-ID: <200806100155.31904.rob@landley.net>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806092253.11897.rob@landley.net> <20080610043020.GA31765@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080610043020.GA31765@uranus.ravnborg.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

On Monday 09 June 2008 23:30:20 Sam Ravnborg wrote:
> Rob - please reread the mails. It was your broken mailer or something
> that caused it to be off-list.
> When I hit reply-to-all in mutt I expect it to be sent to the list -
> and in your case it did not not hit the list.

Could easily be the case.  Kmail's gotten increasingly weird ever since 
Kontact ate it, and I do tend to break stuff anyway...

> > A number of embedded people emailed me about it off list, but nobody ever
> > replied to my post _on_ the list to say I wasn't alone in this, or acked
> > the patch to say it worked for them, or anything like that.  So there was
> > a perception of zero support, and I gave up trying to follow up on it for
> > 2.6.25.  I've got it working for me, and if more perl shows up I'll come
> > up with more patches to remove it for my own personal build environment.
> >
> > I might try to submit again in a few months
>
> Then please try to address the comments first.

The comments I remember (it's been a while) were that it was futile to fight 
against the addition of perl because A) nobody else was bothered by it, B) 
plans were in place to add more perl to the build in future so it was only a 
matter of time anyway, C) some out of tree patch might add an architecture 
variant that wanted to define arbitrary clock values.  My response to C 
was "I can't find this patch, show me", my response to B) was "I'll address 
that when it happens", and my response to A) was "yeah, everybody else who 
seemed to care about this has decided to shut up and bog off, haven't they?"

I keep meaning to write a much improved patch that records a comment at the 
start of the .h file with the complete command line the perl thing was run 
as, so re-running the header generator is a question of cut and paste and 
then adding the extra value you want before hitting enter.  And then ripping 
all the logic out of the makefile that tries to rebuild the thing itself 
because only a patch to Kconfig files can ever require a new value, and that 
patch should change the .h file so it can build the result.  If they forget 
to check in the .h file, the build should fail noisily.

The result is simpler, has many fewer lines, and doesn't need perl to compile 
(just to add new clock values during development), but since nobody else in 
the embedded community cared to speak up for it, I kind of lost interest in 
trying to get it merged.  (Maybe I _am_ the only person who still cares about 
building on a host without perl.  If I wasn't, somebody else would have acked 
the patch...)

*shrug*  If I go back to revisit this issue I'll dig up the old thread and 
reread it, but at the moment I have no immediate plans to.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
