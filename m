From: Adrian Bunk <adrian.bunk@movial.fi>
Subject: Re: [PATCH] console - Add configurable support for console charset
	translation
Date: Wed, 4 Jun 2008 13:33:53 +0300
Message-ID: <20080604103353.GC27335@cs181133002.pp.htv.fi>
References: <48447615.5050806@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48447615.5050806@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Mon, Jun 02, 2008 at 03:37:09PM -0700, Tim Bird wrote:
> With CONSOLE_TRANSLATIONS turned off, this saves about 6K
> on my kernel configured for an ARM development board (OMAP
> 5912 OSK).  In embedded products I'm familiar with,
> console translations are not needed.
>
> This was taken from the Linux-tiny project and updated slightly
> for 2.6.25.
>...

It seems to be always me who asks the controversial questions...:

Does the linux-tiny approach of adding a kconfig variable for each 5kB 
of code actually make sense? I'm asking since an exploding amount of 
kconfig variables and their interdependencies have a not so small 
maintainance impact in the long term.

And I'm wondering whether it's the best approach for reaching 
measurable results. E.g. my small patch that removed 
-maccumulate-outgoing-args on 32-bit x86 reduced the kernel size
there for the CONFIG_CC_OPTIMIZE_FOR_SIZE=y case by at about 2.5% (sic)
without adding any kconfig variables or #ifdef's.

Can you take a reasonable (best-case) .config for an existing device and 
get the following numbers:
- Ignoring patches that came from linux-tiny, by how many percent did 
  the size of the kernel increase or decrease between 2.6.16 and 2.6.26?
- By how many percent did the kernel size decrease due to patches from
  the linux-tiny project that added such kconfig options for a few kB 
  of code in the same timeframe?

My gut feeling is that the influence of this kind of linux-tiny patches 
is hardly noticably compared to the overall code size development, but 
if you have numbers that prove me wrong just point me to them and I'll 
stand corrected.

cu
Adrian

BTW: I'm not insisting on "between 2.6.16 and 2.6.26", that's just some
     timeframe big enough for showing general trends.

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

