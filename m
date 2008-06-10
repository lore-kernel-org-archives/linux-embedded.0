From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 12:50:34 +0200
Message-ID: <20080610105034.GB1900@uranus.ravnborg.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806092253.11897.rob@landley.net> <20080610043020.GA31765@uranus.ravnborg.org> <200806100155.31904.rob@landley.net> <20080610075432.GB776@uranus.ravnborg.org> <20080610102018.GB25910@shareable.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080610102018.GB25910@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

> 
> When did this policy change, so that it's now acceptable to depend on
> Perl, which is roughly equivalent as a tool dependency?

We have perl as a mandatory part of the kernel build in several places
for various architectures.
And I do not recall anyone submitting a bug that they could not build
a kernel due to the perl dependency.
But I am obviously well aware of that we use it for the time stuff.

For the headers_* targets I will shortly introduce yet another
perl dependency - but only if these targets are used - so less of an issue.

o We shall try to keep the dependencies low for the common things
o but for the more exoctic things a wides dependency is OK.

Which is also why I'm happy to apply a patch that remove
the mandatory dependency of perl we have today - if and only if
that patch meet normal patch acceptance criterias.

Rob's initial patch had some issues and neither Rob nor I have
fixed these and therefore it has not been applied.

Rob seems to put much more into this (private reply accustions etc)
for reasons unknown to me. And doing so does not help to get me interested.

So try to get the facts correct here - there is noone against removing
the mandatory perl dependency. But it is lower on my priority list
than many other things which explain why I do not do it myself.
But if someone submit a patch to do so then if the patch is OK it
will be applied.

And if we have a policy that say no-go to perl then it is new to me.
I hope one day to rewrite part of kbuild and perl seems to be the
best candidate around. But that day may never come.

	Sam
