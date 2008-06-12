From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Thu, 12 Jun 2008 16:50:31 +0100
Message-ID: <1213285831.26255.152.camel@pmac.infradead.org>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>
	 <200806111941.51221.rob@landley.net>  <48513F5A.6010008@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48513F5A.6010008@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thu, 2008-06-12 at 08:23 -0700, Tim Bird wrote:
> Rob Landley wrote:
> > However, having one or more full-time engineers devoted to debugging 
> > cross-compile issues is quite a high price to pay too.  Moore's law really 
> > doesn't help that one.
> > 
> > I'm not saying either solution is perfect, I'm just saying the "build under 
> > emulation" approach is a viable alternative that gets more attractive as time 
> > passes, both because of ongoing development on emulators and because of 
> > Moore's law on the hardware.
> 
> I agree with much that you have said, Rob, and I understand the argument
> for getting the most gain from the least resources, but I have a philosophical
> problem with working around the cross-compilation problems instead of fixing
> them in the upstream packages (or in the autoconf system itself).
> 
> Once someone fixes the cross-compilation issues for a package, they usually
> stay fixed, if the fixes are mainlined.

I don't think that's true, unfortunately. Autoconf makes it _easy_ to do
the wrong thing, and people will often introduce new problems.

If we just made people write portable code and proper Makefiles, it
would be less of an issue :)

-- 
dwmw2

