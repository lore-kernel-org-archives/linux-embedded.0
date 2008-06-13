From: Shaz <shazalive@gmail.com>
Subject: Re: Cross Compiler and loads of issues
Date: Fri, 13 Jun 2008 17:00:34 +0500
Message-ID: <7b740b700806130500u17bf3adel3b2139e50d7b029f@mail.gmail.com>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
	 <20080613092449.GO27937@knossos.aleph1.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=KGPWD5WKEa0BineH/9hzxlGwUThWmsUkoeJIRI9imtA=;
        b=vZ0o+fC3DC6ZR7kvGPc3TiUg56OuraDQAIB4KWwvsFqnX/6H7l6woRr3FJb+TK7A9Q
         3oN1xXquuUq26l6EIYWeN7BoLi7XhpKr04MekMHN3ofHst9PS14MG90piI7Ltk48P2FS
         9FSuPSB6n0gzfDKDIOg+ZNsaZgqhoPy5TlmGE=
In-Reply-To: <20080613092449.GO27937@knossos.aleph1.co.uk>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded <linux-embedded@vger.kernel.org>

It's nice to see we have so many options and related people and pros
to it are available around.

IMO there should be some sort of effort to standardize the tool-chains
and build environments coherently with the kernel. I think its a prime
time to work around all the possibilities and standardize so that a
collaborative effort similar to Linux kernel can be set ahead. I think
thats the objective of this list too. Any plans yet sorted out?

On Fri, Jun 13, 2008 at 2:24 PM, Wookey <wookey@wookware.org> wrote:
>
> On 2008-06-12 22:52 +0500, Shaz wrote:
> > Hi,
> >
> > I have been following "Re: [PATCH 0/1] Embedded Maintainer(s)" and
> > felt like asking that is there one good way to get a cross compiler
> > work. I tried buildroot, scratchbox and even openMoko with
> > openEmbedded but all of them had lots of issues and don't know which
> > will be the best alternative.
>
> 'issues' are generally par for the course. It's a difficult problem.
> I've generally found buildroot the least-painful of the above, largely
> because it targets a relatively small section of the problem-space.
>
> For completeness I should also mention that Embedded Debian provides
> yet another option. I will not claim that it will have fewer issues
> than the above. http://www.emdebian.org/emdebian/intro.html
>
> I'm not sure if you are really asking about toolchains or build-systems?
> The former is fairly reliably solved. For a debian-based box just
> install pre-built cross toolchians from emdebian:
> http://www.emdebian.org/tools/crosstools.html
> (from i386, amd64, powerpc; to: nearly all debian-supported
> architectures, gcc3.3, 3.4, 4.1, 4.2, 4.3)
> http://www.emdebian.org/toolchains/search.php?section=devel gives more
> details.
>
> emdebian-tools also provides the debian equivalent of crosstool
> ('emchain' to build your own version of current current toolchain,
> should a suitable pre-built one not exist.
>
> For non-debian boxes other people seem to have listed the options so I
> won't repeat (and it's not my area of expertise).
>
> Wookey (Emdebian 'Chief bullshitter' - bias alert. The toolchains are
> great though, really.)
> --
> Principal hats:  Balloonz - Toby Churchill - Aleph One - Debian
> http://wookware.org/



--
Shaz
