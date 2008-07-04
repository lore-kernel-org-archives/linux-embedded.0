From: Shaz <shazalive@gmail.com>
Subject: Incompatible CFLAGS for kernel module
Date: Fri, 4 Jul 2008 22:34:56 +0500
Message-ID: <7b740b700807041034m1df5ad54x4b1112d74905dc7c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=fsb48x/rhfQvaYlS8kh5QXIkuCeqcN5vYEaKB4/3M+g=;
        b=k/fnnrYx+EAjh81KMsPPB9gonAotl3dS1o7jaBI7SP9cXNPeGRY3lRKFX25+nWo0b0
         dQ53LX5MUpI03KORtQx26gcBnJoJqsCvHaW6ihlX7QN/W1VI7HGc/2V5u90BvO6z6Jn1
         tWKLl3Yc4HgxmhVAAIpXLe1Ve803/ir3s1h84=
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded <linux-embedded@vger.kernel.org>
Cc: ray.sunjae.lee@gmail.com, tpm-emulator-user@lists.berlios.de, tpm-emulator-devel@lists.berlios.de, Security Engineering Archive <groupsecurityengineering@gmail.com>

Hi,

I am porting tpm emulator to versatilepb, which is an arm platform. I
have some problem with CFLAGS from /arch/arm/Makefile when building
the kernel module for this software. I cannot figure out what to do in
this case. Following is the error:

[root@develbox tpm_emulator-0.5]# make
Making all in tpmd
make[1]: Entering directory `/embedded/tpm_emulator-0.5/tpmd'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/embedded/tpm_emulator-0.5/tpmd'
Making all in tpmd_dev
make[1]: Entering directory `/embedded/tpm_emulator-0.5/tpmd_dev'
  CC [M]  /embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.o
cc1: error: unrecognized command line option "-mlittle-endian"
cc1: error: unrecognized command line option "-mapcs"
cc1: error: unrecognized command line option "-mno-sched-prolog"
cc1: error: unrecognized command line option "-mabi=aapcs-linux"
cc1: error: unrecognized command line option "-mno-thumb-interwork"
/embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.c:1: error: bad value
(armv4t) for -march= switch
/embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.c:1: error: bad value
(arm9tdmi) for -mtune= switch
make[3]: *** [/embedded/tpm_emulator-0.5/tpmd_dev/tpmd_dev.o] Error 1
make[2]: *** [_module_/embedded/tpm_emulator-0.5/tpmd_dev] Error 2
make[1]: *** [all] Error 2
make[1]: Leaving directory `/embedded/tpm_emulator-0.5/tpmd_dev'
make: *** [all-recursive] Error 255

kindly help me understand the core issue here and point out some solutions.

-- 
Shaz
