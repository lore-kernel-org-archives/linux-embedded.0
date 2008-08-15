From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/1] [x86] Configuration options to compile out x86 CPU
 support code
Date: Fri, 15 Aug 2008 13:36:12 -0700
Message-ID: <48A5E8BC.6060601@zytor.com>
References: <1217929519-10527-1-git-send-email-thomas.petazzoni@free-electrons.com> <20080815141855.GB12954@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080815141855.GB12954@elte.hu>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, michael@free-electrons.com

Ingo Molnar wrote:
> * Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
>> This patch adds some configuration options that allow to compile out 
>> CPU vendor-specific code in x86 kernels (in arch/x86/kernel/cpu). The 
>> new configuration options are only visible when CONFIG_EMBEDDED is 
>> selected, as they are mostly interesting for space savings reasons.
>>
>> An example of size saving, on x86 with only Intel CPU support:
>>
>>    text	   data	    bss	    dec	    hex	filename
>> 1125479	 118760	 212992	1457231	 163c4f	vmlinux.old
>> 1121355	 116536	 212992	1450883	 162383	vmlinux
>>   -4124   -2224       0   -6348   -18CC +/-
>>
>> However, I'm not exactly sure that the Kconfig wording is correct with 
>> regard to !64BIT / 64BIT.
> 
> applied to tip/x86/cpu, thanks Thomas. (I've done a trivial cleanup: 
> converted the macro to an inline.)
> 
> Peter, do you like this version of the patch or would you like further 
> improvements?
> 

I'm fine with it.

I think there might still be cross-dependencies, but it doesn't break 
anything old, so we can deal with that via bug reports.

The other thing that probably should be done is breaking out the 
Intel-specific versus generic parts of intel_cacheinfo.c.

	-hpa
