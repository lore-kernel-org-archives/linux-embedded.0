From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Incompatible CFLAGS for kernel module
Date: Sat, 5 Jul 2008 08:33:06 +0200
Message-ID: <20080705063306.GB23124@uranus.ravnborg.org>
References: <7b740b700807041034m1df5ad54x4b1112d74905dc7c@mail.gmail.com> <20080704203255.GB19110@uranus.ravnborg.org> <7b740b700807042233q77336ba0taaae06f36e80f216@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7b740b700807042233q77336ba0taaae06f36e80f216@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaz <shazalive@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, ray.sunjae.lee@gmail.com, tpm-emulator-user@lists.berlios.de, tpm-emulator-devel@lists.berlios.de, Security Engineering Archive <groupsecurityengineering@gmail.com>

On Sat, Jul 05, 2008 at 10:33:28AM +0500, Shaz wrote:
> On Sat, Jul 5, 2008 at 1:32 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Fri, Jul 04, 2008 at 10:34:56PM +0500, Shaz wrote:
> >> Hi,
> >>
> >> I am porting tpm emulator to versatilepb, which is an arm platform. I
> >> have some problem with CFLAGS from /arch/arm/Makefile when building
> >> the kernel module for this software. I cannot figure out what to do in
> >> this case. Following is the error:
> >>
> >> [root@develbox tpm_emulator-0.5]# make
> >> Making all in tpmd
> >> make[1]: Entering directory `/embedded/tpm_emulator-0.5/tpmd'
> >> make[1]: Nothing to be done for `all'.
> >> make[1]: Leaving directory `/embedded/tpm_emulator-0.5/tpmd'
> >> Making all in tpmd_dev
> >> make[1]: Entering directory `/embedded/tpm_emulator-0.5/tpmd_dev'
> >>   CC [M]  /embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.o
> >> cc1: error: unrecognized command line option "-mlittle-endian"
> >> cc1: error: unrecognized command line option "-mapcs"
> >> cc1: error: unrecognized command line option "-mno-sched-prolog"
> >> cc1: error: unrecognized command line option "-mabi=aapcs-linux"
> >> cc1: error: unrecognized command line option "-mno-thumb-interwork"
> >> /embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.c:1: error: bad value
> >> (armv4t) for -march= switch
> >> /embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.c:1: error: bad value
> >> (arm9tdmi) for -mtune= switch
> >> make[3]: *** [/embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.o] Error 1
> >> make[2]: *** [_module_/embedded/tpm_emulator-0.5/tpmd_dev] Error 2
> >> make[1]: *** [all] Error 2
> >> make[1]: Leaving directory `/embedded/tpm_emulator-0.5/tpmd_dev'
> >> make: *** [all-recursive] Error 255
> >>
> >> kindly help me understand the core issue here and point out some solutions.
> >
> > A quick guess is that you use your host gcc and not your target gcc.
> > You most likely have to set CROSS_COMPILE=...
> >
> > Try with "make V=1" to see the exact gcc command line.
> >
> > If you continue to rn into trouble please post your Makefile.
> I tried make V=1 but the loads of info was given for the things that
> went right but nothing noticeable where the error is.
What is interesting is the gcc commandline for a good case and
a bad case. If they do not look the same we are on the right track.

> I've attached my arch/arm/Makefile. My build, host and target are on
> same system. i am emulating the board with Qemu. The process is very
> conventional. I've mounted my rootfs with -o loop and kernel and extra
> modules go there with INSTALL_MOD_PATH and INSTALL_MOD_DIR. ARCH=arm
> and CROSS_COMPILE=arm-linux-

But you do some kind of "external module" build judging from the output
above. So the Makefile of interest is the one(s) that is special for
your module. At lest the one you have in /embedded/tpm_emulator-0.5/tpmd_dev

	Sam
