From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Wed, 18 Nov 2009 10:16:28 -0800
Message-ID: <m1iqd77l6r.fsf@fess.ebiederm.org>
References: <1258463404.27437.103.camel@localhost>
	<m1pr7hf93s.fsf@fess.ebiederm.org>
	<20091117235627.GA13469@dvomlehn-lnx2.corp.sa.net>
	<m1iqd8ptg9.fsf@fess.ebiederm.org> <1258505777.3081.4.camel@calx>
	<m1vdh7byva.fsf@fess.ebiederm.org> <4B043467.8000708@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B043467.8000708@am.sony.com> (Tim Bird's message of "Wed\, 18 Nov 2009 09\:52\:39 -0800")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Matt Mackall <mpm@selenic.com>, David VomLehn <dvomlehn@cisco.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, Marco Stornelli <marco.stornelli@gmail.com>, Simon Kagstrom <simon.kagstrom@netinsight.net>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "dwm2@infradead.org" <dwm2@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>

Tim Bird <tim.bird@am.sony.com> writes:

> Eric W. Biederman wrote:
>> Matt Mackall <mpm@selenic.com> writes:
>> 
>>> As much as I like kexec, it loses on memory footprint by about 100x.
>>> It's not appropriate for all use cases, especially things like
>>> consumer-grade wireless access points and phones.
>> 
>> In general I agree.  The cost of a second kernel and initrd can be
>> prohibitive in the smallest systems, and if you do a crash capture
>> with using a standalone app that is reinventing the wheel.
>> 
>> That said.  I can happily run kdump with only 16M-20M reserved.
>> So on many systems the cost is affordable.
>
> Understood.  On some of my systems, the memory budget for the
> entire system is 10M.  On most systems I work with, it is a
> struggle to reserve even 64K for this feature.

crash_kexec is really a glorified jump.  It is possible to do a lot in
64K with a standalone application.  If reliable capture of kernel
crashes is desirable to an embedded NAND device I expect a semi-general
purpose dedicated application for capturing at least dmesg from the
crashed kernel and write it to a file on a NAND filesystem could be
worth someones time.

On general purpose hardware we use a kernel and an initrd simply to
reduce the development work of supporting everything and the kitchen
sink.  My impression is that embedded systems can afford a little more
setup time, and a custom compilation, and that the hardware you would like
to store things too is much more common.

Eric
