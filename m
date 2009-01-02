From: Wookey <wookey@wookware.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 17:25:41 +0000
Message-ID: <20090102172540.GE8858@knossos.aleph1.co.uk>
References: <200901020207.30359.rob@landley.net> <20090102095023.GA28078@linux-sh.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090102095023.GA28078@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>
Cc: Paul Mundt <lethal@linux-sh.org>, Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On 2009-01-02 18:50 +0900, Paul Mundt wrote:
> Your main reasons against inclusion of perl seem to be that there is no
> realistic expectation for target systems that will be self-hosting will
> have perl included, or the inherent complexity in maintaining a coherent
> cross compiling environment. Both of these things are issues with your
> own environment, and in no way are these representative of the embedded
> development community at large.

It may well be true that most embedded people cross-build kernels and
use native perl on a fat build box, but there are plenty of situations
where being able to build kernels without perl is useful. Given the
simplicitly of these patches I can't see any reason not to put them
in, and appreciate Rob's work on this.

And if cross-building perl is really easy, as some in this thread
claim, can someone fix the Debian packages to do it, because that
would be really useful (it appears to be of similar complexity to
cross-building gcc, requiring a 2-stage self-referential build). 

Wookey
-- 
Principal hats:  Balloonz - Toby Churchill - Aleph One - Debian
http://wookware.org/
