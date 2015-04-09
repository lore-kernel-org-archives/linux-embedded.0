From: Tim Bird <tim.bird@sonymobile.com>
Subject: Re: [PATCH 1/3] kernel: Add a new config option to remove command
 line parsing
Date: Thu, 9 Apr 2015 07:44:36 -0700
Message-ID: <55269054.6030703@sonymobile.com>
References: <1427898893-8257-1-git-send-email-iulia.manda21@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427898893-8257-1-git-send-email-iulia.manda21@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Iulia Manda <iulia.manda21@gmail.com>, "josh@joshtriplett.org" <josh@joshtriplett.org>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "paulmck@linux.vnet.ibm.com" <paulmck@linux.vnet.ibm.com>, "dvhart@linux.intel.com" <dvhart@linux.intel.com>, "peterz@infradead.org" <peterz@infradead.org>, "mihai.caraman@freescale.com" <mihai.caraman@freescale.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



On 04/01/2015 07:34 AM, Iulia Manda wrote:
> This patch introduces CONFIG_CMDLINE_PARSE option which conditionally compiles
> the support for parsing kernel command line arguments. The corresponding
> functions that actually do the parsing will be compiled out. 
> 
> This is used when no parameters will be specified neither at compile time nor at
> boot time.
> 
> Bloat-o-meter output (compared to the preivous version in which builtin cmdline
> was also set to 'Y'):
> 
> add/remove: 0/8 grow/shrink: 0/6 up/down: 0/-3669 (-3669)

I think this is great stuff.  (Of course, having research something like this
previously, I'm a bit biased.)

It's very nice to have the Bloat-o-meter output for these kernel size shrinking
patches.

The patch itself looks very straightforward, and I don't see any problems
in a visual inspection.

You can add a Reviewed-by: Tim Bird <tim.bird@sonymobile.com> to this patch.

I'd like to be able to point people to this on the mailing list.  In the future
can you make sure to CC: <linux-kernel@vger.kernel.org>, so there's a reference
on lkml.org I can point people to?

Thanks for this great work!
 -- Tim
