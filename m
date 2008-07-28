From: Jamie Lokier <jamie@shareable.org>
Subject: Re: prevalence of C++ in embedded linux?
Date: Mon, 28 Jul 2008 16:55:38 +0100
Message-ID: <20080728155538.GD13000@shareable.org>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

Robert P. J. Day wrote:
>   just curious -- how many folks are working in C++ in their embedded
> linux work?

I'm avoiding it, because of reports of occasional elf2flt relocation
errors when using C++ a few months ago, on this list.

However, some of the libraries I'm using have some C++ in them, and a
C API wrapped around the C++ core!  I'm glad they use a C wrapper, as
they only supply binaries build with GCC 2.95.3, I have the impression
the C++ ABI has changed between that and GCC 4.x.  But I haven't checked.

All systems using Qt (such as Qtopia) will use C++ a lot, so it is
well supported.

-- Jamie
