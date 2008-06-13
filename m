From: "Bart Van Assche" <bart.vanassche@gmail.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 13:22:25 +0200
Message-ID: <e2e108260806130422n28a1445y4d35ba22a2ec8577@mail.gmail.com>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>
	 <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com>
	 <1213285831.26255.152.camel@pmac.infradead.org>
	 <8bd0f97a0806120905u532ce5f9sf231e185173de791@mail.gmail.com>
	 <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=WO8KHUHtcEyrzTQYS6u/VSnIBr1cO45Utd6puWWZHCc=;
        b=rihUiNH6Q1WRluJPY9l8zHPUmxXqtJWl1Cnf+K0MXg3qZQkzvFcZpHHsBPdXYnIQz8
         lrCGE2OGZvGGLJGhtQAyQUdeouiWbHp5DPe14JDCT4OO7kTJStx/p7xo8szvmQ8qZ8cR
         GQudg2N2RPvWbI+fLYGYnfZWuPQTcE/JoV1CM=
In-Reply-To: <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Mike Frysinger <vapier.adi@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Thu, Jun 12, 2008 at 6:12 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
...
> meooowww!  :-)  but at the risk of dragging this even further
> off-topic, i am *constantly* asked by people how to set up makefiles
> for their software project, and what would be nice is a small
> collection of examples of a makefile (or makefiles) done *right*.  as
> in, properly recursive, supports cross-compiling without having to
> remove your left nad, etc, etc.
...

Please read the essay "Recursive Make Considered Harmful"
(http://miller.emu.id.au/pmiller/books/rmch/).

Bart.
