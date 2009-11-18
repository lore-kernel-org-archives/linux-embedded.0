From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Tue, 17 Nov 2009 16:28:22 -0800
Message-ID: <m1iqd8ptg9.fsf@fess.ebiederm.org>
References: <1258463404.27437.103.camel@localhost>
	<m1pr7hf93s.fsf@fess.ebiederm.org>
	<20091117235627.GA13469@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20091117235627.GA13469@dvomlehn-lnx2.corp.sa.net> (David VomLehn's message of "Tue\, 17 Nov 2009 18\:56\:27 -0500")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David VomLehn <dvomlehn@cisco.com>
Cc: dedekind1@gmail.com, Marco Stornelli <marco.stornelli@gmail.com>, Simon Kagstrom <simon.kagstrom@netinsight.net>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

David VomLehn <dvomlehn@cisco.com> writes:

> On Tue, Nov 17, 2009 at 10:45:43AM -0500, Eric W. Biederman wrote:
> ...
>> Why not use the kdump hook?  If you handle a kernel panic that way
>> you get enhanced reliability and full user space support.  All in a hook
>> that is already present and already works.
>
> I'm a big fan of avoiding reinvention of the wheel--if I can use something
> already present, I will. However, I'm not clear about how much of the problem
> I'm addressing will be solved by using a kdump hook. If I understand
> correctly, you'd still need a pseudo-file somewhere to actually get the data
> from user space to kernel space. *Then* you could use a kdump hook to
> transfer the data to flash or some memory area that will be retained across
> boots. Is this the approach to which you were referring? If so, I have a
> couple more questions:
>
> 1. In what ways would this be better than, say, a panic_notifier?

A couple of ways. 

- You are doing the work in a known good kernel instead of the kernel
  that just paniced for some unknown reason.
- All of the control logic is in user space (not the kernel) so you can
  potentially do something as simple as "date >> logfile" to get the
  date.

> 2. Where would you suggest tying in? (Particularly since not all architectures
>    currently support kdump)

No changes are needed kernel side.  You just need an appropriate kernel and
initrd for your purpose.

All of the interesting architectures support kexec, and if an
architecture doesn't it isn't hard to add.  The architecture specific
part is very simple.  A pain to debug initially but very simple.

Eric
