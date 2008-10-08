From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: RFC - size tool for kernel build system
Date: Wed, 8 Oct 2008 12:32:11 -0700
Message-ID: <48ED0ABB.2040607@am.sony.com>
References: <48EBD268.50208@am.sony.com> <48ED0575.4060005@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48ED0575.4060005@redhat.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Snook <csnook@redhat.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Chris Snook wrote:
> The kernel build system is supposed to be stateless, and integrating
> this with make would mess that up.

> If your goal is to get more people
> to use Bloatwatch
Not really.  Bloatwatch is a means to an end.  It's
only the end I care about, which is more visibility
into kernel size growth over time.

> so they don't make your job quite as difficult, it
> would probably be more appropriate to put a size analysis script in
> scripts/ (like checkpatch.pl) that looks at only the kernel you just
> built and generates thorough statistics in a format readable by both
> humans and Bloatwatch, preferably something easily diffed.

The intent would be to do as you describe (although I don't
really care if the format is readable by Bloatwatch).  I'm a
Bloatwatch proponent (I'm not the author), but this suggestion
doesn't really have anything to do with Bloatwatch.  Maybe I should
have avoided mentioning it in my initial post.

Having a make target to run the script is just
a method of making it as easy as possible to run it.
(Kind of like 'make checkstack' or 'make cscope')
checkpatch.pl is different in that it operates on something
not in the tree yet.  It doesn't make sense as a make target
so I don't think it's comparable.

Maybe it would be simpler to omit the baseline comparison
capability at first, and just focus on a canonical size
report (script and report format) for the kernel.

> Then
> developers could use that output in mailing list discussions without
> having to use Bloatwatch, but embedded developers who care about this
> enough to use Bloatwatch can be confident that they're working with the
> same numbers that the rest of us are discussing with the plain text on
> the lists.

Discussing the number with the plain text on the lists is
the ultimate goal.  My thinking is that I'd like it to
be used kind of like 'powertop' (except not as a runtime tool
but as a development-time tool).  The main intent is just
to give developers more information about how their changes
affect the kernel size.

Thanks for the feedback.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
