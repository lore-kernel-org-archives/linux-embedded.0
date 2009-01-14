From: Jamie Lokier <jamie@shareable.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Wed, 14 Jan 2009 02:51:16 +0000
Message-ID: <20090114025115.GB22154@shareable.org>
References: <495FEEAF.5020005@zytor.com> <200901032006.47652.rob@landley.net> <20090104030619.GA21466@linux-sh.org> <c384c5ea0901040223l6e53f041s9f7cdea20c9d1d8d@mail.gmail.com> <1231677939.3517.5.camel@gimli.at.home> <31014a580901111928u586e2246uccf370ff941c8a01@mail.gmail.com> <20090112053552.GA9061@uranus.ravnborg.org> <31014a580901112150x57cd715aj5f42ee19bc28c701@mail.gmail.com> <20090112101803.GB10086@uranus.ravnborg.org> <20090112103820.GF28564@linux-sh.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090112103820.GF28564@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mundt <lethal@linux-sh.org>, Sam Ravnborg <sam@ravnborg.org>, "Mark A. Miller" <mark@mirell.org>, Bernd Petrovitsch <bernd@firmix.at>, Leon Woestenberg <leon.woestenberg@gmail.co>

Paul Mundt wrote:
> This happens in a lot of places, like embedded gentoo ports, where almost
> all of the work is sent across distcc to a cross-compilation machine. In
> systems that use package management, it is done on the host through
> emulation, or painfully cross-compiled.

Ah yes, I remember using embedded Gentoo.

95% of the time in ./configure scripts, 5% in compilations.

And this is on x86!  I dread to think how slow it gets on something
slow.

-- Jamie
