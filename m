From: Wookey <wookey@wookware.org>
Subject: Re: Cross Compiler and loads of issues
Date: Fri, 13 Jun 2008 10:24:49 +0100
Message-ID: <20080613092449.GO27937@knossos.aleph1.co.uk>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaz <shazalive@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On 2008-06-12 22:52 +0500, Shaz wrote:
> Hi,
> 
> I have been following "Re: [PATCH 0/1] Embedded Maintainer(s)" and
> felt like asking that is there one good way to get a cross compiler
> work. I tried buildroot, scratchbox and even openMoko with
> openEmbedded but all of them had lots of issues and don't know which
> will be the best alternative.

'issues' are generally par for the course. It's a difficult problem.
I've generally found buildroot the least-painful of the above, largely
because it targets a relatively small section of the problem-space. 

For completeness I should also mention that Embedded Debian provides
yet another option. I will not claim that it will have fewer issues
than the above. http://www.emdebian.org/emdebian/intro.html

I'm not sure if you are really asking about toolchains or build-systems?
The former is fairly reliably solved. For a debian-based box just
install pre-built cross toolchians from emdebian:
http://www.emdebian.org/tools/crosstools.html
(from i386, amd64, powerpc; to: nearly all debian-supported
architectures, gcc3.3, 3.4, 4.1, 4.2, 4.3)
http://www.emdebian.org/toolchains/search.php?section=devel gives more
details.

emdebian-tools also provides the debian equivalent of crosstool
('emchain' to build your own version of current current toolchain,
should a suitable pre-built one not exist.

For non-debian boxes other people seem to have listed the options so I
won't repeat (and it's not my area of expertise).

Wookey (Emdebian 'Chief bullshitter' - bias alert. The toolchains are
great though, really.)
-- 
Principal hats:  Balloonz - Toby Churchill - Aleph One - Debian
http://wookware.org/
