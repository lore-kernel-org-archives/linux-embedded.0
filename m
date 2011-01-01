From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Renaming of CONFIG_EMBEDDED to CONFIG_EXPERT
Date: Sat, 1 Jan 2011 00:30:51 -0500
Message-ID: <AANLkTik90vOtkBKDiU5O_gtyWYHd-_VSeYCqRwn2Vcim@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=iHxtQv92MUGa1rXTKebJDmhhx+V9sYMSGndfYpm1fi8=;
        b=gEAJMIcK6fBLbtiyfrUrBUZsBlDwLRJm3xOwienjv2yWdSAqV2rLUZwzkZLeCNg/Dg
         4OChKWnduLuWiQsTZaE3g+5cV3LkOS+bUwkY9B3shvxqErWY2k5tjYf7QNwax4T2mXAn
         E+NgJDQYGksKdDavPzDtkifZdrQEXyXnV/jLg=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

Given the high traffic on LKML, some folks probably haven't seen this
thread, which proposes to rename the CONFIG_EMBEDDED option to
CONFIG_EXPERT.

https://patchwork.kernel.org/patch/438671/

Paul.
