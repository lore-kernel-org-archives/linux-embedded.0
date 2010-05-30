From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: omap nand driver problem with beagle board
Date: Sun, 30 May 2010 11:54:03 +0200
Message-ID: <4C0235BB.8020408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=IL5F8qAFd8GCKM5Naw+V8ElzOY2PFoCxwbVTOQfAj7w=;
        b=OpcFnXszy4Sq0S5Myd30Z0l/agJfg/r8QDYV6ihFz0+hNPRQlFBEWfBdL00fbT01ou
         e8iyRg0a/skIob6QV+BpHlNathqhB3YOqBkwfcpv5lzH7lcd/cfSU7+DlVme9N9QtQ6N
         425jeiU0Gdm2eewyuDS+jUqtiVnk4iW4ocaek=
Sender: linux-omap-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tony@atomide.com, linux-omap@vger.kernel.org
Cc: Linux Embedded <linux-embedded@vger.kernel.org>

Hi,

I'm using the kernel 2.6.34 with beagle board rev. c4. The omap nand
driver fails the probe because the field phys_base in the
omap_nand_platform_data struct is never set in the board specific code.
Indeed, the driver fails because the read address is 0x0. Is it a
regression? Has someone the same problem? What is phys address of nand
in this board to fix the problem?

Thanks.

Regards,

Marco
