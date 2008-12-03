From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: LZMA inclusion
Date: Wed, 3 Dec 2008 22:43:54 +0100
Message-ID: <20081203214354.GA8115@uranus.ravnborg.org>
References: <492BA3FA.9010204@openwrt.org> <4936DFCD.2010204@am.sony.com> <20081203195852.GB8563@mx.loc> <20081203202009.GA6790@uranus.ravnborg.org> <20081203204540.GD8563@mx.loc> <20081203211617.GB7255@uranus.ravnborg.org> <20081203212812.GG8563@mx.loc>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081203212812.GG8563@mx.loc>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Tim Bird <tim.bird@am.sony.com>, lasse.collin@tukaani.org, glp@openwrt.org, linux-embedded@vger.kernel.org

> >> two into a simple "make ... archprepare headers_install":
> >
> >Which architectures needs this archprepare?
> 
> At least cris tripped this IIRC, at least before or around the time
> when cris's subarch handling was fixed (the asm-cris/arch-v10 vs.
> arch-v32 linking issue).

>>It would be good to get rid of the dependency.
> 
> nod
> 
> >PS. I consider archprepare an internal target.
> >If some preparation is needed the recommended target is 'prepare'.
> >The day no targets has any special things they need to do archprepare will die.
> 
> The proper solution would perhaps be to do have prepare or archprepare
> as a prerequisite of headers_install as long as those are needed, i guess.

We need to run as little arch specific stuff as possible for
headers_install so adding this prerequisite would just hide the real
issue that the arch has some latent bug to be fixed.
For cris we fixed it when we moved the headers (Jesper did - I was not involved).

So if you could check it out and see if other archs need it I would be glad.
If there are others I will try to get these fixed so they do not need archprepare
for headers_isntall.

	Sam
