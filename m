From: Tony Ibbs <tibs@tonyibbs.co.uk>
Subject: Re: [PATCH 5/5] KBUS source file
Date: Mon, 28 Feb 2011 22:25:41 +0000
Message-ID: <1425A0A7-D946-48BF-9CE0-C54D2FBF8C49@tonyibbs.co.uk>
References: <cover.1298829754.git.tibs@tonyibbs.co.uk> <3CEFF9DA-16D6-43E1-A8A5-658EB1D426C7@tonyibbs.co.uk> <20110228192312.GA1832@merkur.ravnborg.org>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110228192312.GA1832@merkur.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>, Grant Likely <grant.likely@secretlab.ca>


On 28 Feb 2011, at 19:23, Sam Ravnborg wrote:

> You are using /proc/* to something that is not process related.
> At lkml you will be requested to use something else.

OK. That's mainly through ignorance of what I *should* be using
instead (and perhaps poor reading of Linux Device Drivers). Do you
have an opinion on where such information should be going?

> You can conisder splitting this up in another file so you
> in the Makefile can use it conditionally.

That makes sense.

>> If there is a better way for me to submit this, please let me know.
> 
> One way you would not like....
> Let the first patches introduce core-functionality and add features
> in later patches - touching the same file many times.

Hmm. That's very sensible. Assuming I can figure out a sensible way
to do it (which I assume is what you expected me to object).

It would certainly be interesting to do (sort of reverse archaeology),
but would take a while, and it would, of course, also mean rewriting
all of my tests to only test whatever is still there (I'm assuming a
source file is only interesting if it actually *works*).

It would, of course, also have the advantage of presenting the
"simplest possible" idea of KBUS, followed by "but it appears also to
be necessary to do this" patches. Which is presumably why you suggest
it.

> Also please submit the Makefile/Kconfig stuff in the _last_ mail.
> Otherwise you would ruin bisect because we cannot build kbus until
> you have the last files included.

Ah. Not something I have experience of. I shall make it so.

Thank you,
Tibs
