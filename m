From: Robin Getz <rgetz@blackfin.uclinux.org>
Subject: Re: RFC - size tool for kernel build system
Date: Thu, 9 Oct 2008 14:34:35 -0400
Message-ID: <200810091434.35783.rgetz@blackfin.uclinux.org>
References: <48EBD268.50208@am.sony.com> <20081009152151.GB17013@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081009152151.GB17013@cs181140183.pp.htv.fi>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk@kernel.org>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Thu 9 Oct 2008 11:21, Adrian Bunk pondered:
> On Tue, Oct 07, 2008 at 02:19:36PM -0700, Tim Bird wrote:
> > I've been thinking about a tool that might be useful
> > to track kernel size changes.  I'm posting this
> > Request For Comments to get feedback, and determine
> > if this is something that would be worthwhile to
> > pursue.
> > 
> > What I envision is some new kernel build targets, specifically
> > related to gathering size information and generating a size
> > comparison report.  Some small helper scripts would be written
> > to gather the necessary information, and generate the report.
> >...
> > Any comments?
> 
> The building blocks that would be useful are IMHO:
> - a make target that generates a report for one kernel
>   (like the checkstack or export_report targets)

and the report includes sizes of more than just the text section? Which is my 
biggest pet peeve with bloat-o-meter today, since it uses nm, not readelf - 
and saving data is just as important as saving instruction.

> - a script that compares two such reports and outputs the
>   size differences
> 
> That's also easy to do, and if that's what's wanted I can send a patch 
> that does it.
> 
> Everything else is IMHO overdesigned.

I understand the desire though - make it easier to compare two setups.

capturing a make target into a file, (make size_report > config1.size) and 
running a compare on two outputs seems like a more "standard" way of doing 
things...
