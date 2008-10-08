From: Chris Snook <csnook@redhat.com>
Subject: Re: RFC - size tool for kernel build system
Date: Wed, 08 Oct 2008 15:09:41 -0400
Message-ID: <48ED0575.4060005@redhat.com>
References: <48EBD268.50208@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48EBD268.50208@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Tim Bird wrote:
> I've been thinking about a tool that might be useful
> to track kernel size changes.  I'm posting this
> Request For Comments to get feedback, and determine
> if this is something that would be worthwhile to
> pursue.
> 
> What I envision is some new kernel build targets, specifically
> related to gathering size information and generating a size
> comparison report.  Some small helper scripts would be written
> to gather the necessary information, and generate the report.
> 
> A kernel developer would type:
> 
> 1) make size-baseline
> 
> And kernel size information would be recorded for the
> current kernel (after a build, if needed).
> I envision this saving off the .config and System.map, the
> result of 'size vmlinux' and several of the 'size */builtin.o'
> results.
> 
> Additionally (and optionally), a program could
> be run to acquire some size information from a running
> system (e.g. a newly booted system, or a system under
> a particular load), to include in the baseline report.
> 
> All of the gathered information would be stored
> as the "size baseline".
> 
> -------
> 
> After making some modifications, either to the source
> or the configuration, the developer could type:
> 
> 2) make size-report
> 
> The kernel size information would be recorded again, and
> compared with the size-baseline results.  A report of
> differences (e.g. from bloat-o-meter and other comparison
> tools) would be produced. Any differences exceeding some
> threshhold (specified in a size-watch config file?)
> could be highlighted.  The git commit IDs would be recorded,
> as well as differences between the configs used
> (e.g. diffconfig output).
> 
> If some designated size difference exceeds
> a threshold (specified in the size-watch configuration)
> then the make could return an error, while still producing
> the report.  This would mean that this could be used
> for git bisection to find a size regression.
> 
> Another way to look at this, would be that a developer
> could pick a specific size value to monitor (for example,
> the static size of the network sub-system, or the
> size of a particular slab in the dynamic memory of a
> newly booted kernel). They would specify that in the
> size-watch config, and could monitor that size over time
> and under various configurations.
> 
> I envision a couple of usages:
>  1) A developer could use this to be able to see a
>  report about the total size increases caused by a patch
>  they are about to submit
> 
>  2) A developer could compare kernel versions for overall
>  size changes
> 
>  3) A maintainer could examine the affect of a patch on the
>  size of their subsystem.
> 
>  4) A developer could compare different kernel configs to
>  see the impact of configuration option choices.
> 
>  5) An automated tool could generate size values to associate
>  with different config option choices (at least, starting from
>  a consistent config set).
> 
>  6) An automated tool could generate size values for each
>  kernel version (this is what Bloatwatch does now).
> 
> Bloatwatch generates information on the static size information
> for various kernel versions.  This would have a similar purpose,
> but the intent would be to integrate it into the kernel build
> system, to allow any developer to measure the size information,
> and highlight and track the information of their choice.
> 
> Any comments?
>  -- Tim

The kernel build system is supposed to be stateless, and integrating this with 
make would mess that up.  If your goal is to get more people to use Bloatwatch 
so they don't make your job quite as difficult, it would probably be more 
appropriate to put a size analysis script in scripts/ (like checkpatch.pl) that 
looks at only the kernel you just built and generates thorough statistics in a 
format readable by both humans and Bloatwatch, preferably something easily 
diffed.  Then developers could use that output in mailing list discussions 
without having to use Bloatwatch, but embedded developers who care about this 
enough to use Bloatwatch can be confident that they're working with the same 
numbers that the rest of us are discussing with the plain text on the lists.

-- Chris
