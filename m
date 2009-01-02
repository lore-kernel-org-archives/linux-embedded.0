From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/3]: Convert mkcapflags.pl to mkcapflags.sh
Date: Fri, 2 Jan 2009 10:12:36 +0100
Message-ID: <20090102091236.GC3057@uranus.ravnborg.org>
References: <200901020207.30359.rob@landley.net> <200901020215.37223.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200901020215.37223.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>

On Fri, Jan 02, 2009 at 02:15:36AM -0600, Rob Landley wrote:
> From: Rob Landley <rob@landley.net>
> 
> Convert kernel/cpu/mkcapflags.pl to kernel/cpu/mkcapflags.sh.
> 
> This script generates kernel/cpu/capflags.c from include/asm/cpufeature.h.
OK

> Peter Anvin added this perl to 2.6.28.
Drop it.

Implementation looks OK.

	Sam
