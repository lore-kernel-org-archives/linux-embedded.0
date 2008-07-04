From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Incompatible CFLAGS for kernel module
Date: Fri, 4 Jul 2008 22:32:55 +0200
Message-ID: <20080704203255.GB19110@uranus.ravnborg.org>
References: <7b740b700807041034m1df5ad54x4b1112d74905dc7c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7b740b700807041034m1df5ad54x4b1112d74905dc7c@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaz <shazalive@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, ray.sunjae.lee@gmail.com, tpm-emulator-user@lists.berlios.de, tpm-emulator-devel@lists.berlios.de, Security Engineering Archive <groupsecurityengineering@gmail.com>

On Fri, Jul 04, 2008 at 10:34:56PM +0500, Shaz wrote:
> Hi,
> 
> I am porting tpm emulator to versatilepb, which is an arm platform. I
> have some problem with CFLAGS from /arch/arm/Makefile when building
> the kernel module for this software. I cannot figure out what to do in
> this case. Following is the error:
> 
> [root@develbox tpm_emulator-0.5]# make
> Making all in tpmd
> make[1]: Entering directory `/embedded/tpm_emulator-0.5/tpmd'
> make[1]: Nothing to be done for `all'.
> make[1]: Leaving directory `/embedded/tpm_emulator-0.5/tpmd'
> Making all in tpmd_dev
> make[1]: Entering directory `/embedded/tpm_emulator-0.5/tpmd_dev'
>   CC [M]  /embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.o
> cc1: error: unrecognized command line option "-mlittle-endian"
> cc1: error: unrecognized command line option "-mapcs"
> cc1: error: unrecognized command line option "-mno-sched-prolog"
> cc1: error: unrecognized command line option "-mabi=aapcs-linux"
> cc1: error: unrecognized command line option "-mno-thumb-interwork"
> /embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.c:1: error: bad value
> (armv4t) for -march= switch
> /embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.c:1: error: bad value
> (arm9tdmi) for -mtune= switch
> make[3]: *** [/embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.o] Error 1
> make[2]: *** [_module_/embedded/tpm_emulator-0.5/tpmd_dev] Error 2
> make[1]: *** [all] Error 2
> make[1]: Leaving directory `/embedded/tpm_emulator-0.5/tpmd_dev'
> make: *** [all-recursive] Error 255
> 
> kindly help me understand the core issue here and point out some solutions.

A quick guess is that you use your host gcc and not your target gcc.
You most likely have to set CROSS_COMPILE=...

Try with "make V=1" to see the exact gcc command line.

If you continue to rn into trouble please post your Makefile.

	Sam
