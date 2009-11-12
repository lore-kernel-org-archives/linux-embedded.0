From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Thu, 12 Nov 2009 16:58:40 -0500
Message-ID: <20091112215840.GB28349@dvomlehn-lnx2.corp.sa.net>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net> <1258049211.10621.40.camel@calx>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1258049211.10621.40.camel@calx>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>
Cc: linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, paul.gortmaker@windriver.com

On Thu, Nov 12, 2009 at 01:06:51PM -0500, Matt Mackall wrote:
> On Wed, 2009-11-11 at 21:13 -0500, David VomLehn wrote:
> > Allows annotation of panics to include platform information. It's no big
> > deal to collect information, but way helpful when you are collecting
> > failure reports from a eventual base of millions of systems deployed in
> > other people's homes.
> 
> I'd like to hear a bit more use case motivation on this feature. Also,
> why do you want more than a page?

Hopefully, I have addressed the first question in my previous email. As
for the second, I doubt there is a need for more than a page. I just picked
a value to start developing with. This is still a work in progress...

> http://selenic.com : development and support for Mercurial and Linux

David VL
