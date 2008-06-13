From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded  
    Maintainer(s)...)
Date: Fri, 13 Jun 2008 11:44:54 -0700
Message-ID: <4852C026.8060203@am.sony.com>
References: <1209577322.25560.402.camel@pmac.infradead.org>    <8bd0f97a0806120905u532ce5f9sf231e185173de791@mail.gmail.com>    <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain>    <200806121925.35883.rob@landley.net>    <1213340652.26255.224.camel@pmac.infradead.org>    <20080613100231.btmn0xgmqog884cs@localhost>    <1213376457.26255.281.camel@pmac.infradead.org> <2a5b3cfbb9eccd7885735ea46b115541.squirrel@www.geekisp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <2a5b3cfbb9eccd7885735ea46b115541.squirrel@www.geekisp.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Traynor <wmat@naoi.ca>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-embedded-owner@reliableembeddedsystems.com, Rob Landley <rob@landley.net>, "Robert P. J. Day" <rpjday@crashcourse.ca>, Mike Frysinger <vapier.adi@gmail.com>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

Bill Traynor wrote:
>>> Do you wanna set some breakpoints and inspect variables in makefiles?
>>> Have a look at a simple makefile debugger (written in make):
> http://www.embedded.com/columns/technicalinsights/197003517?printable=true

The article above shows some macros you can add to your Makefile to show
you the values of certain things.  It is helpful, but not an interactive
debugger.

However, the guy who wrote that article did indeed write a full
Makefile debugger.  I took it for a spin, and found that it worked as
advertised on a simple Makefile.  I tried it on the kernel Makefile, but
without success (but I didn't try very hard).

YMMV.  I put some of the resources and info I found at:
http://elinux.org/Debugging_Makefiles

The link from the package's README doesn't work, but here's a link
I found to an article about the debugger:
http://www.cmcrossroads.com/content/view/6479/120/

 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

