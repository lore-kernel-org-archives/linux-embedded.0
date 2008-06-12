From: Tim Bird <tim.bird@am.sony.com>
Subject: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Thu, 12 Jun 2008 08:23:06 -0700
Message-ID: <48513F5A.6010008@am.sony.com>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806111941.51221.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

Rob Landley wrote:
> However, having one or more full-time engineers devoted to debugging 
> cross-compile issues is quite a high price to pay too.  Moore's law really 
> doesn't help that one.
> 
> I'm not saying either solution is perfect, I'm just saying the "build under 
> emulation" approach is a viable alternative that gets more attractive as time 
> passes, both because of ongoing development on emulators and because of 
> Moore's law on the hardware.

I agree with much that you have said, Rob, and I understand the argument
for getting the most gain from the least resources, but I have a philosophical
problem with working around the cross-compilation problems instead of fixing
them in the upstream packages (or in the autoconf system itself).

Once someone fixes the cross-compilation issues for a package, they usually
stay fixed, if the fixes are mainlined.
 -- Tim


=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

