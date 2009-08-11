From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 4/6] Add support for LZO-compressed kernels for ARM
Date: Tue, 11 Aug 2009 09:03:14 -0700
Message-ID: <4A819642.10700@zytor.com>
References: <20090806224055.GH31579@n2100.arm.linux.org.uk> <20090807092423.GA4455@laptop> <4A7BF5B8.4030907@knaff.lu> <20090807102117.GB4455@laptop> <4A7C14EB.1060701@parrot.com> <20090807130130.GE4455@laptop> <4A7C2BA4.7030408@parrot.com> <20090807135524.GF4455@laptop> <20090807200001.GE31543@n2100.arm.linux.org.uk> <20090807210816.GA29797@merkur.ravnborg.org> <20090811094418.GI9704@pc-ras4041.res.insa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753855AbZHKQJt@vger.kernel.org>
In-Reply-To: <20090811094418.GI9704@pc-ras4041.res.insa>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Matthieu CASTET <matthieu.castet@parrot.com>, Alain Knaff <alain@knaff.lu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

On 08/11/2009 02:44 AM, Albin Tonnerre wrote:
> Hi Sam,
> 
> On Fri, Aug 07, 2009 at 11:08:16PM +0200, Sam Ravnborg wrote :
>> We could add libgcc as a prerequisite.
>> Untested patch below.
> 
> When compiling with this patch applied, I get the following error:
> 
>   Kernel: arch/arm/boot/Image is ready
>     LD      arch/arm/boot/compressed/vmlinux
> /home/albin/x-tools/arm-unknown-linux-uclibcgnueabi/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.2/libgcc.a(_dvmd_lnx.o):
> In function `__div0':
> /home/albin/devel/free-electrons/toolchain/targets/src/gcc-4.3.2/libgcc/../gcc/config/arm/lib1funcs.asm:1079:
> undefined reference to `raise'
> make[2]: *** [arch/arm/boot/compressed/vmlinux] Error 1
> make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
> 
> I've got no idea where this symbol is defined, though. Has anyone an idea on
> this ?
> 

raise() gets called by libgcc to handle division by zero.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
