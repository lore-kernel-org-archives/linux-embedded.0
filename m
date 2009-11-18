From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Wed, 18 Nov 2009 08:07:21 -0800
Message-ID: <m1vdh7byva.fsf@fess.ebiederm.org>
References: <1258463404.27437.103.camel@localhost>
	<m1pr7hf93s.fsf@fess.ebiederm.org>
	<20091117235627.GA13469@dvomlehn-lnx2.corp.sa.net>
	<m1iqd8ptg9.fsf@fess.ebiederm.org> <1258505777.3081.4.camel@calx>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1258505777.3081.4.camel@calx> (Matt Mackall's message of "Tue\, 17 Nov 2009 18\:56\:17 -0600")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>
Cc: David VomLehn <dvomlehn@cisco.com>, dedekind1@gmail.com, Marco Stornelli <marco.stornelli@gmail.com>, Simon Kagstrom <simon.kagstrom@netinsight.net>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, paul.gortmaker@windriver.com

Matt Mackall <mpm@selenic.com> writes:

> As much as I like kexec, it loses on memory footprint by about 100x.
> It's not appropriate for all use cases, especially things like
> consumer-grade wireless access points and phones.

In general I agree.  The cost of a second kernel and initrd can be
prohibitive in the smallest systems, and if you do a crash capture
with using a standalone app that is reinventing the wheel.

That said.  I can happily run kdump with only 16M-20M reserved.
So on many systems the cost is affordable.

Eric
