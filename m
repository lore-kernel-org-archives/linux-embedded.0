From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Mon, 12 Jan 2009 11:44:15 +0100
Message-ID: <200901121144.16255.neundorf@eit.uni-kl.de>
References: <200901020207.30359.rob@landley.net> <20090112101803.GB10086@uranus.ravnborg.org> <31014a580901120222s747d9641o641b2991baa5f8f8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <31014a580901120222s747d9641o641b2991baa5f8f8@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Mark A. Miller" <mark@mirell.org>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

On Monday 12 January 2009 11:22:47 you wrote:
...
> entire environment, QEMU allows it nicely with distcc at a reasonable
> speed. (Albeit there is no distconfigure, but that's entirely an
> unrelated tanget of muck and despair and rants against configure, but
> we're not going there...)

I'd be interested in hearing your issues with configure for cross compiling 
right ? 
I added cross compiling support to cmake, so I'm interested to see whether we 
did it better :-)

Alex
