From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Thu, 12 Nov 2009 17:09:25 -0500
Message-ID: <20091112220925.GC28349@dvomlehn-lnx2.corp.sa.net>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net> <4AFC6711.1090405@windriver.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4AFC6711.1090405@windriver.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com

On Thu, Nov 12, 2009 at 02:50:41PM -0500, Paul Gortmaker wrote:
> David VomLehn wrote:
>> Allows annotation of panics to include platform information. It's no big
>> deal to collect information, but way helpful when you are collecting
>> failure reports from a eventual base of millions of systems deployed in
>> other people's homes.
...
> Why hook into panic() directly like this, vs. using the panic
> notifier list? If you use that, and then put the data handling
> magic that you need into your own kernel module that knows how
> to interface with the reporting apps that you have, you can
> do the whole thing without having to alter existing code, I think.

I agree--a panic notifier list is probably a better approach.

David VL
