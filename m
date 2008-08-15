From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/1] [x86] Configuration options to compile out x86 CPU
	support code
Date: Fri, 15 Aug 2008 16:38:43 +0200
Message-ID: <20080815143843.GA519@elte.hu>
References: <1217929519-10527-1-git-send-email-thomas.petazzoni@free-electrons.com> <20080815141855.GB12954@elte.hu>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080815141855.GB12954@elte.hu>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, michael@free-electrons.com


-tip testing found a couple of build failures:

  LD      .tmp_vmlinux1
arch/x86/lib/lib.a(usercopy_32.o): In function `__copy_to_user_ll':
(.text+0x11e): undefined reference to `movsl_mask'
arch/x86/lib/lib.a(usercopy_32.o): In function `__copy_from_user_ll':
(.text+0x1fa): undefined reference to `movsl_mask'
arch/x86/lib/lib.a(usercopy_32.o): In function 
`__copy_from_user_ll_nozero':
(.text+0x2d6): undefined reference to `movsl_mask'
arch/x86/lib/lib.a(usercopy_32.o): In function `copy_from_user':
(.text+0x5ac): undefined reference to `movsl_mask'
arch/x86/lib/lib.a(usercopy_32.o): In function `copy_to_user':
(.text+0x6bf): undefined reference to `movsl_mask'
make: *** [.tmp_vmlinux1] Error 1

with:

  http://redhat.com/~mingo/misc/config-Fri_Aug_15_16_35_03_CEST_2008.bad

and:

arch/x86/kvm/built-in.o: In function `paging64_cmpxchg_gpte':
mmu.c:(.text+0xa80d): undefined reference to `cmpxchg_486_u64'

with:

  http://redhat.com/~mingo/misc/config-Fri_Aug_15_16_27_47_CEST_2008.bad

reverting your change solved both of them.

i still have the commit in tip/x86/cpu so please send a delta fix ontop 
of your previous patch once you figure out the problem. Thanks,

	Ingo
