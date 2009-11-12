From: Matt Mackall <mpm@selenic.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Thu, 12 Nov 2009 12:06:51 -0600
Message-ID: <1258049211.10621.40.camel@calx>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753961AbZKLSIR@vger.kernel.org>
In-Reply-To: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, paul.gortmaker@windriver.com

On Wed, 2009-11-11 at 21:13 -0500, David VomLehn wrote:
> Allows annotation of panics to include platform information. It's no big
> deal to collect information, but way helpful when you are collecting
> failure reports from a eventual base of millions of systems deployed in
> other people's homes.

I'd like to hear a bit more use case motivation on this feature. Also,
why do you want more than a page?

-- 
http://selenic.com : development and support for Mercurial and Linux

