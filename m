From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Wed, 11 Jun 2008 14:28:59 +0900
Message-ID: <20080611052859.GB27488@linux-sh.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806092253.11897.rob@landley.net> <20080610043020.GA31765@uranus.ravnborg.org> <200806100155.31904.rob@landley.net> <20080610075432.GB776@uranus.ravnborg.org> <20080610102018.GB25910@shareable.org> <20080610105034.GB1900@uranus.ravnborg.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080610105034.GB1900@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Jamie Lokier <jamie@shareable.org>, Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

On Tue, Jun 10, 2008 at 12:50:34PM +0200, Sam Ravnborg wrote:
> > 
> > When did this policy change, so that it's now acceptable to depend on
> > Perl, which is roughly equivalent as a tool dependency?
> 
> We have perl as a mandatory part of the kernel build in several places
> for various architectures.
> And I do not recall anyone submitting a bug that they could not build
> a kernel due to the perl dependency.
> But I am obviously well aware of that we use it for the time stuff.
> 
And plenty of places in scripts/ have dependencies on either perl or
python already (and have for some time). Both are pretty ubiquitous these
days, whether people like it or not. There's not much point in trying to
keep the build limping along for people who don't want to set up these
tools on their platforms, since they're going to lose out on half of the
functionality anyways (checkstack, bloat-o-meter, etc.).

Building natively is a good stress tester, and does find a lot of bugs.
For that same reason, if you can build the kernel, you can build python
and perl natively on your platform, too. Some of us have already been
doing this for ages and have no idea what the fuss is about.
