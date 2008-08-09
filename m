From: Bodo Eggert <7eggert@gmx.de>
Subject: Re: [PATCH 1/1] [x86] Configuration options to compile out x86 CPU support code
Date: Sat, 09 Aug 2008 16:08:57 +0200
Message-ID: <E1KRp7q-0001pd-61@be1.7eggert.dyndns.org>
References: <20030410181011$6d15@gated-at.bofh.it> <aXrl4-2FX-1@gated-at.bofh.it>
Reply-To: 7eggert@gmx.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754020AbYHIOEU@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, tglx@linu

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> This patch adds some configuration options that allow to compile out
> CPU vendor-specific code in x86 kernels (in arch/x86/kernel/cpu). The
> new configuration options are only visible when CONFIG_EMBEDDED is
> selected, as they are mostly interesting for space savings reasons.

> +menuconfig PROCESSOR_SELECT
> +     default y
> +     bool "Supported processor vendors" if EMBEDDED
> +     help
> +       This lets you choose what x86 vendor support code your kernel
> +       will include.
> +
> +config CPU_SUP_INTEL_32
> +     default y
> +     bool "Support Intel processors" if PROCESSOR_SELECT
> +     depends on !64BIT
> +     help
> +       This enables extended support for Intel processors
> +

I don't think having a generic kernel for only Intel CPUs makes much sense,
and OTOH, if you optimize for e.g. Athlon CPUs, you're likely to not need
Intel code on that machine - even on desktop systems.

What about an option to "Include code for CPUs from all supported vendors",
invisible and y for generic kernels?
