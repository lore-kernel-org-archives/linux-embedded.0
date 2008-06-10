From: Tim Bird <tim.bird@am.sony.com>
Subject: execute bit on scripts (was Re: [PATCH] add diffconfig utility)
Date: Tue, 10 Jun 2008 14:33:23 -0700
Message-ID: <484EF323.7000809@am.sony.com>
References: <484ED902.9040000@am.sony.com> <20080610210217.GA2432@logfs.org> <20080610211841.GA23855@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080610211841.GA23855@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Sam Ravnborg wrote:
> I will merge it if the feedabck is positive and eventual feedback
> is dealt with. (And Tim reminds me to do so in a week or so).

Thanks.

> I take most of the random scripts in scripts/ via kbuild.git.

OK - sounds like you're the right person to ask a question
that has been nagging me.

Is there a proper way to get the execute bit set in the git tree
on  patches that contain scripts?  I think patches
produced by git have something that sets the file permissions?
Is this something that can (or should) be hand-added to
a non-git patch? (I use quilt).

I put that blurb in the patch description about doing a
'chmod a+x', but that doesn't seem reliable.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

