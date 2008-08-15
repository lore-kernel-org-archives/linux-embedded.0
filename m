From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/1] [x86] Configuration options to compile out x86 CPU
	support code
Date: Fri, 15 Aug 2008 16:18:55 +0200
Message-ID: <20080815141855.GB12954@elte.hu>
References: <1217929519-10527-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1217929519-10527-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, michael@free-electrons.com


* Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> This patch adds some configuration options that allow to compile out 
> CPU vendor-specific code in x86 kernels (in arch/x86/kernel/cpu). The 
> new configuration options are only visible when CONFIG_EMBEDDED is 
> selected, as they are mostly interesting for space savings reasons.
> 
> An example of size saving, on x86 with only Intel CPU support:
> 
>    text	   data	    bss	    dec	    hex	filename
> 1125479	 118760	 212992	1457231	 163c4f	vmlinux.old
> 1121355	 116536	 212992	1450883	 162383	vmlinux
>   -4124   -2224       0   -6348   -18CC +/-
> 
> However, I'm not exactly sure that the Kconfig wording is correct with 
> regard to !64BIT / 64BIT.

applied to tip/x86/cpu, thanks Thomas. (I've done a trivial cleanup: 
converted the macro to an inline.)

Peter, do you like this version of the patch or would you like further 
improvements?

	Ingo
