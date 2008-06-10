From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 11:09:24 +0200
Message-ID: <20080610090924.150D9248AC@gemini.denx.de>
References: <20080610075432.GB776@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: Your message of "Tue, 10 Jun 2008 09:54:32 +0200."
             <20080610075432.GB776@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

In message <20080610075432.GB776@uranus.ravnborg.org> you wrote:
> > (Maybe I _am_ the only person who still cares about 
> > building on a host without perl.  If I wasn't, somebody else would have acked 
> > the patch...)
> 
> perl is pretty standard and I fail to see the benefits of avoiding it.
> For embedded development I see even less benefits as I assume
> any sane embedded development environment are based on a
> cross-toolchain so you do the build on a high perfomance box.
> 
> Building everything for my arm board on the arm board would be a disater
> for example.

Well, compiling the Linux kernel on the native system with the root
file system mounted over NFS has always been a really good regression
test for us. It exercises a *lot* of kernel code - tasks, memory,
network, ...

Being unable to do this just because we now also would need a  native
Perl is indeed a PITA...

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
You don't have to worry about me. I might have been born yesterday...
but I stayed up all night.
