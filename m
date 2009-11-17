From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Tue, 17 Nov 2009 18:56:27 -0500
Message-ID: <20091117235627.GA13469@dvomlehn-lnx2.corp.sa.net>
References: <1258463404.27437.103.camel@localhost> <m1pr7hf93s.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <m1pr7hf93s.fsf@fess.ebiederm.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: dedekind1@gmail.com, Marco Stornelli <marco.stornelli@gmail.com>, Simon Kagstrom <simon.kagstrom@netinsight.net>, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

On Tue, Nov 17, 2009 at 10:45:43AM -0500, Eric W. Biederman wrote:
...
> Why not use the kdump hook?  If you handle a kernel panic that way
> you get enhanced reliability and full user space support.  All in a hook
> that is already present and already works.

I'm a big fan of avoiding reinvention of the wheel--if I can use something
already present, I will. However, I'm not clear about how much of the problem
I'm addressing will be solved by using a kdump hook. If I understand
correctly, you'd still need a pseudo-file somewhere to actually get the data
from user space to kernel space. *Then* you could use a kdump hook to
transfer the data to flash or some memory area that will be retained across
boots. Is this the approach to which you were referring? If so, I have a
couple more questions:

1. In what ways would this be better than, say, a panic_notifier?
2. Where would you suggest tying in? (Particularly since not all architectures
   currently support kdump)

> Eric

David VL
