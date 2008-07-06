From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Incompatible CFLAGS for kernel module
Date: Sun, 6 Jul 2008 22:00:56 +0200
Message-ID: <20080706200056.GA27406@uranus.ravnborg.org>
References: <7b740b700807041034m1df5ad54x4b1112d74905dc7c@mail.gmail.com> <20080704203255.GB19110@uranus.ravnborg.org> <7b740b700807042233q77336ba0taaae06f36e80f216@mail.gmail.com> <20080705063306.GB23124@uranus.ravnborg.org> <7b740b700807052234p49a50c22g290d9a76e04d373f@mail.gmail.com> <7b740b700807060035y66bdc54byc8a5ad87b6e3d50d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7b740b700807060035y66bdc54byc8a5ad87b6e3d50d@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaz <shazalive@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, ray.sunjae.lee@gmail.com, tpm-emulator-user@lists.berlios.de, tpm-emulator-devel@lists.berlios.de, Security Engineering Archive <groupsecurityengineering@gmail.com>

> >>> >> this case. Following is the error:
> >>> >>
> >>> >> [root@develbox tpm_emulator-0.5]# make
> >>> >> Making all in tpmd
> >>> >> make[1]: Entering directory `/embedded/tpm_emulator-0.5/tpmd'
> >>> >> make[1]: Nothing to be done for `all'.
> >>> >> make[1]: Leaving directory `/embedded/tpm_emulator-0.5/tpmd'
> >>> >> Making all in tpmd_dev
> >>> >> make[1]: Entering directory `/embedded/tpm_emulator-0.5/tpmd_dev'
> >>> >>   CC [M]  /embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.o
> >>> >> cc1: error: unrecognized command line option "-mlittle-endian"
> >>> >> cc1: error: unrecognized command line option "-mapcs"
> >>> >> cc1: error: unrecognized command line option "-mno-sched-prolog"
> >>> >> cc1: error: unrecognized command line option "-mabi=aapcs-linux"
> >>> >> cc1: error: unrecognized command line option "-mno-thumb-interwork"

This all looks like you are using the wrong gcc.
And the "make V=1" option should tell you that.

> I've noticed some issues in my rootfs and on to it but plz do look at
> the Makefile. i might be missing something there instead.

The Makefile looks ok.

	Sam
