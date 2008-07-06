From: Shaz <shazalive@gmail.com>
Subject: Re: Incompatible CFLAGS for kernel module
Date: Sun, 6 Jul 2008 12:35:24 +0500
Message-ID: <7b740b700807060035y66bdc54byc8a5ad87b6e3d50d@mail.gmail.com>
References: <7b740b700807041034m1df5ad54x4b1112d74905dc7c@mail.gmail.com>
	 <20080704203255.GB19110@uranus.ravnborg.org>
	 <7b740b700807042233q77336ba0taaae06f36e80f216@mail.gmail.com>
	 <20080705063306.GB23124@uranus.ravnborg.org>
	 <7b740b700807052234p49a50c22g290d9a76e04d373f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=vXUBjxgns/3AtOxnGZSqRXSmujwTyO4lFUzfgD9cBr0=;
        b=cMe37UE4D0Qxf9bBl6ezSsFx7omNVKk9ctbBY2Acpi2Ae/Z8dkuZ3EzyjB9oL8QFr9
         py/HnEE3/gwuxHZUCJuvYEmJAdAIpGPptUGfqcC7PwWhvdXnunAbceluwhKYEESmcwfJ
         HgYWvFEGqNP7eHYJjTSfm0Kk8IRg4czTXW2Co=
In-Reply-To: <7b740b700807052234p49a50c22g290d9a76e04d373f@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, ray.sunjae.lee@gmail.com, tpm-emulator-user@lists.berlios.de, tpm-emulator-devel@lists.berlios.de, Security Engineering Archive <groupsecurityengineering@gmail.com>

On Sun, Jul 6, 2008 at 10:34 AM, Shaz <shazalive@gmail.com> wrote:
> On Sat, Jul 5, 2008 at 11:33 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
>> On Sat, Jul 05, 2008 at 10:33:28AM +0500, Shaz wrote:
>>> On Sat, Jul 5, 2008 at 1:32 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
>>> > On Fri, Jul 04, 2008 at 10:34:56PM +0500, Shaz wrote:
>>> >> Hi,
>>> >>
>>> >> I am porting tpm emulator to versatilepb, which is an arm platform. I
>>> >> have some problem with CFLAGS from /arch/arm/Makefile when building
>>> >> the kernel module for this software. I cannot figure out what to do in
>>> >> this case. Following is the error:
>>> >>
>>> >> [root@develbox tpm_emulator-0.5]# make
>>> >> Making all in tpmd
>>> >> make[1]: Entering directory `/embedded/tpm_emulator-0.5/tpmd'
>>> >> make[1]: Nothing to be done for `all'.
>>> >> make[1]: Leaving directory `/embedded/tpm_emulator-0.5/tpmd'
>>> >> Making all in tpmd_dev
>>> >> make[1]: Entering directory `/embedded/tpm_emulator-0.5/tpmd_dev'
>>> >>   CC [M]  /embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.o
>>> >> cc1: error: unrecognized command line option "-mlittle-endian"
>>> >> cc1: error: unrecognized command line option "-mapcs"
>>> >> cc1: error: unrecognized command line option "-mno-sched-prolog"
>>> >> cc1: error: unrecognized command line option "-mabi=aapcs-linux"
>>> >> cc1: error: unrecognized command line option "-mno-thumb-interwork"
>>> >> /embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.c:1: error: bad value
>>> >> (armv4t) for -march= switch
>>> >> /embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.c:1: error: bad value
>>> >> (arm9tdmi) for -mtune= switch
>>> >> make[3]: *** [/embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.o] Error 1
>>> >> make[2]: *** [_module_/embedded/tpm_emulator-0.5/tpmd_dev] Error 2
>>> >> make[1]: *** [all] Error 2
>>> >> make[1]: Leaving directory `/embedded/tpm_emulator-0.5/tpmd_dev'
>>> >> make: *** [all-recursive] Error 255
>>> >>
>>> >> kindly help me understand the core issue here and point out some solutions.
>>> >
>>> > A quick guess is that you use your host gcc and not your target gcc.
>>> > You most likely have to set CROSS_COMPILE=...
>>> >
>>> > Try with "make V=1" to see the exact gcc command line.
>>> >
>>> > If you continue to rn into trouble please post your Makefile.
>>> I tried make V=1 but the loads of info was given for the things that
>>> went right but nothing noticeable where the error is.
>> What is interesting is the gcc commandline for a good case and
>> a bad case. If they do not look the same we are on the right track.
I've noticed some issues in my rootfs and on to it but plz do look at
the Makefile. i might be missing something there instead.
>>
>>> I've attached my arch/arm/Makefile. My build, host and target are on
>>> same system. i am emulating the board with Qemu. The process is very
>>> conventional. I've mounted my rootfs with -o loop and kernel and extra
>>> modules go there with INSTALL_MOD_PATH and INSTALL_MOD_DIR. ARCH=arm
>>> and CROSS_COMPILE=arm-linux-
>>
>> But you do some kind of "external module" build judging from the output
>> above. So the Makefile of interest is the one(s) that is special for
>> your module. At lest the one you have in /embedded/tpm_emulator-0.5/tpmd_dev
> Yes am building tpm emulator. Its nature is generic but successfully
> runs on PC and might have some porting issues which I am figuring out.
> Thanx for sufficient attention. I am attaching the emulator's source
> archive which I've altered. The main change that I've done is add
> PREFIXDIR in all Makefiles. It includes the required Makefile in
> tpmd_dev. I am separately also attaching the required makefile so to
> make it easier.
>>
>>        Sam
>>
>
>
>
> --
> Shaz
>



-- 
Shaz
