From: Robin Getz <rgetz@blackfin.uclinux.org>
Subject: Re: RFC - size tool for kernel build system
Date: Mon, 13 Oct 2008 00:17:32 -0400
Message-ID: <200810130017.32413.rgetz@blackfin.uclinux.org>
References: <48EBD268.50208@am.sony.com> <20081009152151.GB17013@cs181140183.pp.htv.fi> <48EE9A1C.8040301@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48EE9A1C.8040301@am.sony.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Adrian Bunk <bunk@kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Thu 9 Oct 2008 19:56, Tim Bird pondered:
> Adrian Bunk wrote:
> > The building blocks that would be useful are IMHO:
> > - a make target that generates a report for one kernel
> >   (like the checkstack or export_report targets)
> > - a script that compares two such reports and outputs the
> >   size differences
> > 
> > That's also easy to do, and if that's what's wanted I can send a patch 
> > that does it.
> 
> I took a stab at this with the attached two scripts.  These are
> not quite ready for prime time, but show the basic idea.
> I only have a partial list of subsystems, and am skipping the
> runtime data collection, for now.
> 
> I have only made the scripts, not any make targets for them.
> 
> I record all data into a flat namespace, which makes it easier to compare
> later.
> 
> > Everything else is IMHO overdesigned.
> One element of this design is the ability to configure
> the diff-size-report tool to watch only certain values, and to
> return a non-zero exit code under certain conditions.  This makes
> it possible to use the tool with git-bisect to find the source of
> a size regression. I believe Linus asked for something like this
> at the last kernel summit.
> 
> Without the use of the config file, diff-size-report is very
> to bloat-o-meter, but provides info about additional
> aggregate items (like subsystems and the full kernel).
> 
> Feedback is welcome.

This seems to still only look at the text section (only uses nm)? not data or 
other section sizes increasing?
