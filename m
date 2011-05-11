From: Alessio Igor Bogani <abogani@kernel.org>
Subject: Re: [PATCH 0/4] Speed up the symbols' resolution process V4
Date: Wed, 11 May 2011 11:19:22 +0200
Message-ID: <BANLkTinDiGCaKPtS+ZpKf2swJpParJ4eew@mail.gmail.com>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org>
	<BANLkTi=y60Jt3-OMzbxQJzGkvzCzNJfJtA@mail.gmail.com>
	<BANLkTimfFEv+vZ8dYvhG0oj2Q4g+KnG4aA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=LD2dw0ZSXbsM6EXm/RIZC1o9pY9C/opu1YAH343f88E=;
        b=TuQC/hWgvaywW5Gv0MwQV1EghMS6+ILX1K5NN5yNicNUQOu6I8o66WjOkg8p4alUQF
         jq0r/TPv4iFpBjJOJUtqp3VDfSWgbAJonGxk/KJMjm1TF1S/1lRqvOtzIpp9WRtCWlCe
         e2rHINkPUKLlv9yRsZdevBhzLgpyMsBlBIzOQ=
In-Reply-To: <BANLkTimfFEv+vZ8dYvhG0oj2Q4g+KnG4aA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Dear Mr. Frysinger,

2011/5/11 Alessio Igor Bogani <abogani@kernel.org>:
> 2011/5/11 Mike Frysinger <vapier.adi@gmail.com>:
>> this breaks symbol prefixed arches (like Blackfin):
>> =C2=A0CC =C2=A0 =C2=A0 =C2=A0kernel/softirq.o
>> /tmp/ccp3A6LU.s: Assembler messages:
>> /tmp/ccp3A6LU.s:3734: Error: symbol `___ksymtab__local_bh_enable' is
>> already defined
>> make[1]: *** [kernel/softirq.o] Error 1
>
> Could you provide the preprocessed file and details about the toolcha=
in used?

Please ignore this now I can reproduce the problem on my machine.

>> name.  so rather than "__", use "+".

Sorry I don't think that is a good choice from a long term point of
view. What do you think to add MODULE_SYMBOL_PREFIX to section names
instead? In this way symbol and section names should always be
different also on symbol prefixed archs (which are blackfin and
h8300).

Thank you very much!

Ciao,
Alessio
