From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Mon, 9 Jun 2008 22:53:11 -0500
Message-ID: <200806092253.11897.rob@landley.net>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200805281652.47558.rob@landley.net> <c384c5ea0806091427k3bd29168wbe55f6920054d44a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <c384c5ea0806091427k3bd29168wbe55f6920054d44a@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

On Monday 09 June 2008 16:27:29 Leon Woestenberg wrote:
> > I submitted a patch to remove the use of perl to build the linux kernel
> > (which HPA added in 2.6.25) not because it affected the result, but
> > because it unnecessarily complicates the build system.  (And perl tends
> > to metasticize.
>
> Thanks, I hope it is or gets accepted.

Nope, Peter Anvin shot it down (saying what I was doing was a strange, purely 
academic exercise), and Sam Ravnborg announced his vague intention to rewrite 
large chunks of kbuild in perl in the future.  (Because nothing 
says "maintainability" like perl...)

For some reason they wanted to mail me about it off-list rather than cc:ing 
the list about this plan.

A number of embedded people emailed me about it off list, but nobody ever 
replied to my post _on_ the list to say I wasn't alone in this, or acked the 
patch to say it worked for them, or anything like that.  So there was a 
perception of zero support, and I gave up trying to follow up on it for 
2.6.25.  I've got it working for me, and if more perl shows up I'll come up 
with more patches to remove it for my own personal build environment.

I might try to submit again in a few months, but in the meantime my patches 
are at
http://landley.net/hg/firmware/file/tip/sources/patches/ (see the 
linux-*noperl*.patch one).

Maybe I'll try linux-kernel again.  I submitted my miniconfig patches 
something like three times.  But if the guys on the list didn't want it, and 
the guys in the embedded world poking me to do something about it weren't 
willing to even ack the darn patch on the list, and the people who want 
changes made to it aren't willing to change it from what I'm happy with to 
what they want and expect me to do it for them when I'm already happy with 
it...

My todo list is long.  This goes somewhere after resorting the contents of my 
bookshelves.

I've found that posting to linux-kernel tends to attract "belling the cat" 
ideas.  For example, I use kconfig in toybox and I posted patches to make it 
easier to use kconfig in other, non-kernel projects.  The resulting thread 
turned into a grandiose plan about a separate kconfig that would be 
maintained as a spearate project and get installed on your system ala make, 
for use by any source package that wants that functionality.  To which my 
response was "feel free, I have no interest in doing that, did you want my 
patches or not?"  Improvements in the UI to use miniconfigs were held up by 
people objecting to how they were generated, which is separate from how 
they're used.  And one of peter's objections to the perl removal patch (which 
basically checked the precalculated header file into the tree) was that some 
out of tree mips patch that never got merged might want to let you enter the 
clock speed as an input field, so you can't possibly just rely on 
precalculated values and people who want to check in code using a new value 
checking in an updated header with that value.  (Even though that makes every 
existing architecture happy, last I checked.)

I'm a hobbyist.  I made it work for me.  If nobody else is interested in what 
I did, I'm ok with that...

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
