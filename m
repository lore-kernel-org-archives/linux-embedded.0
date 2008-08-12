From: "Mihaela Grigore" <grigore.mihaela@gmail.com>
Subject: ppc linux cpu features fixups
Date: Tue, 12 Aug 2008 20:49:37 +0300
Message-ID: <78ef7ce10808121049s178a7be5m6cd2c2a5d6b8dd42@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=Boa4LEyAvnZP6Wf1GSxN6NxMh/XO+r6Bz0CeYnQJuRs=;
        b=dZD/9SsEm0nYfKf9FTGn67O4bldjd3rSRYDH/t0DjwuMqMrEVcHkKJU4gwY5Ii5NOW
         oY2ZSHevfKiNBTB9HUcaBA27NNWmpkLzUYe3VnTbNcxlXsUwFH4KwYE1qBO7JHuquGlN
         sb72FaS1G5FrpHIN7etzzBYBcKGR380FrRUcg=
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hello,

There is a piece of code in the early initialization of the 2.6 kernel
that identifies the cpu type and then tries to eliminate code that
does not apply to the current cpu. This is done by writing nop's over
sections of code that are not needed (do_cpu_ftr_fixups in
arch/ppc/kernel/misc.S)

When I try to run the kernel in a ppc emulator, I get a segmentation
fault in do_cpu_ftr_fixups. From examining the section headers of the
vmlinux, the text section is marked as readonly. The piece of code
above mentioned is trying to write a nop to memory location inside the
text section.

Since the kernel does run on boards with ppc cpu's, can somebody
explain how come this is actually working ? Or if/where I am mistaking
with my assumptions ?

Thank you and please ass me in cc in a reply to this message
