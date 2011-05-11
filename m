From: Alessio Igor Bogani <abogani@kernel.org>
Subject: Re: [PATCH 0/4] Speed up the symbols' resolution process V4
Date: Wed, 11 May 2011 09:04:20 +0200
Message-ID: <BANLkTimfFEv+vZ8dYvhG0oj2Q4g+KnG4aA@mail.gmail.com>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org>
	<BANLkTi=y60Jt3-OMzbxQJzGkvzCzNJfJtA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=0DmHDbmXAFHnQJgmJv9iUtG6peh04L3DvcRqlwxvVlA=;
        b=b741AN7ZS6OYbFW7CKa8D209uQt+101GVlluzI/ak+nPFNiNPlskEduf5IWQGCQLIz
         utKWx+biLSTNwOK5/Jjzrk/eBLjI9I/AK5F253Zl1efTf+0+W7tcF8+m4qCUUGbuQpH8
         7gNZD1L7F9dx9Mj4rez1ZFXkUdybAjyHud4K0=
In-Reply-To: <BANLkTi=y60Jt3-OMzbxQJzGkvzCzNJfJtA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Dear Mr. Frysinger,

2011/5/11 Mike Frysinger <vapier.adi@gmail.com>:
> this breaks symbol prefixed arches (like Blackfin):
> =C2=A0CC =C2=A0 =C2=A0 =C2=A0kernel/softirq.o
> /tmp/ccp3A6LU.s: Assembler messages:
> /tmp/ccp3A6LU.s:3734: Error: symbol `___ksymtab__local_bh_enable' is
> already defined
> make[1]: *** [kernel/softirq.o] Error 1

Could you provide the preprocessed file and details about the toolchain=
 used?

Thanks!

Ciao,
Alessio
