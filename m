From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 03 Jan 2009 12:50:43 -0800
Message-ID: <495FCFA3.4030000@zytor.com>
References: <200901020207.30359.rob@landley.net> <200901020513.19593.rob@landley.net> <495E3AF8.6000006@parrot.com> <200901031346.01325.rob@landley.net> <20090103201059.GA4875@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090103201059.GA4875@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Landley <rob@landley.net>, Matthieu CASTET <matthieu.castet@parrot.com>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Sam Ravnborg wrote:
> With respect to your three patches the plan is to:
> - add the updated timeconst patch to kbuild-next

If you add this, you take the responsibility for the breakages that will
occur.  The reason his patch is "simpler" is because he removes the
arbitrary-precision arithmetic, and simply hopes that the system
utilities that he uses uses an integer size which happens to be big enough.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
