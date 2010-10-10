From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 00/16] pramfs: persistent and protected RAM Filesystem
Date: Sun, 10 Oct 2010 18:26:59 +0200
Message-ID: <4CB1E953.9070407@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=rXzp6pshdiTK2aVCnheQKycs8r1HpTdYnf2Nj1uQYGo=;
        b=vTP9Qi69bl/ocUpAAmfzBWrCP/Lb4uo5TRqQrdMFmZgkXtt3mz4xFKvCMwlKTJScVk
         20l002h+xW9svgxDhvpUze62UnOYstFVXtqI+w4Ktdtq2Zb1usvkLYkUST+RQz4wbF8D
         UECadMUiQBmFxtUzM6Dvf7PAyWxo4irtO2qtU=
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>

Hi all,

after a lot of improvement, test, bug fix and new features, it's the
moment for third round with the kernel community to submit PRAMFS for
mainline.

Since the last review (June 2009) a lot of things are changed:

- removed any reference of BKL
- fixed the endianess for the fs layout
- added support for extended attributes, ACLs and security labels
- moved out any pte manipulations from fs and inserted them in mm
- implemented the new truncate convention
- fixed problems with 64bit archs

...and much more. Complete "story" in the ChangeLog inserted in the
documentation file.

In addition, in the web site tech page (http:\\pramfs.sourceforge.net),
you can find a lot of information about implementation, technical
details, benchmarking and so on.

All the work to mainline this feature is sponsored by the CE Linux Forum.

Regards,
Marco
