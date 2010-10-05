From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH] pramfs: Persistent and protected RAM filesystem
Date: Tue, 5 Oct 2010 13:39:14 +0200
Message-ID: <AANLkTik34ZKasZMMpx4wD71k+RPccGLvAi1Cwe5UwZpj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:cc:content-type;
        bh=UjkEXiGMEgbr5TThiVG1REMlvJZxSgaost6iYEVEcJ4=;
        b=n9VjjStn3OxHvM18epDlY3PJfpRENzKq6iePauaCQrS5T4QuJY/Xu1TIRH1lyaxwNP
         TGRs1nFx2bp2cIyevpVE/M1aasKEui3fY1U6hxrtl1tVOR0x8RfLWU7P0hCJviqbUIcw
         wNO8oIwWjBNUvmkE4ay+N8qfYT/XBz8Os9mYg=
Sender: owner-linux-mm@kvack.org
List-Id: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>, linux-mm@kvack.org

Hi all,

after a lot of improvement, test, bug fix and new features, it's the
moment for third round with the kernel community to submit PRAMFS for
mainline. First of all, I have to say thanks to Tim Bird and CELF to
actively support the project.

Since the last review (June 2009) a lot of things are changed:

- removed any reference of BKL
- fixed the endianess for the fs layout
- added support for extended attributes, ACLs and security labels
- moved out any pte manipulations from fs and inserted them in mm
- implemented the new truncate convention
- fixed problems with 64bit archs

...and much more. Complete "story" in the ChangeLog inserted in the
documentation file.

Since the patch is long, you can download and review the patch from
the project site: http:\\pramfs.sourceforge.net. The patch version is
1.2.1 for kernel 2.6.36.
In addition, in the web site tech page, you can find a lot of
information about implementation, technical details, benchemarking and
so on.

Regards,

Marco

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

