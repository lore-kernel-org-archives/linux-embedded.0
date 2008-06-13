From: Samuel Robb <sam@oneparticularharbor.net>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Fri, 13 Jun 2008 09:14:55 -0400
Message-ID: <1213362895.13136.14.camel@samuelr.hq.netapp.com>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>
	 <200806111941.51221.rob@landley.net> <20080612182529.GB7423@nibiru.local>
	 <485190E8.80705@cisco.com> <48519837.1090902@katalix.com>
	 <8bd0f97a0806121446i68af3b96sbe51cc510f7d4fb6@mail.gmail.com>
	 <20080612220246.GB27513@sovereign.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080612220246.GB27513@sovereign.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Thu, 2008-06-12 at 16:02 -0600, Jim Freeman wrote:
> Most vendors these days have finally gotten the clue that sources/changes
> have to be made available to downstream requesters, but far fewer
> are sufficiently self-enlightened to figure out that changes need to
> be accepted upstream for them to keep flowing back.  And to make that
> happen, vendors have to take on substantially higher overhead to win
> acceptance of patches/changes upstream, an undertaking often sadly
> fraught with hassle, uncertainty, and even peril.  So they mostly
> don't bother.  To their (and their customers, and our) long-term
> detriment.

So - how do you reduce that overhead, then?  Keep in mind that while
pushing kernel changes upstream is significant, there are other projects
as well.  Most embedded developers are working not just with the kernel,
but with a constellation of packages related to their projects.  In
order to "push changes upstream", they may end up having to work with
several different communities... each with their own model of
interaction, their own model of patch submission, and their own release
schedules.  Figuring out how to deal with just one community (kernel)
doesn't help them in dealing with another (say, samba).

When you have a one- or two-line fix, and face Yet Another round of
finding the right mailing list, identifying the right maintainers,
figuring out the right way to submit a bug and a patch, and then have to
spend the next 3 weeks explaining how no, you're not interested in being
the PPC maintainer for libfoo... is it any wonder that developers (not
to mention their management) eventually just gives up on the idea of
"giving back to the community?"

One possible solution would be to provide a clearing house for these
sorts of changes, maybe under the auspices of CELF or a similar
organization.  Instead of submitting patches to individual projects,
submit them to the clearing house, and let interested individuals either
gather together and push related patches upstream in individual
projects, or give project maintainers a place to go and find embedded
systems patches related to their projects.

-Samrobb


