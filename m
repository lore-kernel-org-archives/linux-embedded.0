From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: jffs2_gcd_mtdx thread and umount problem.
Date: Mon, 18 Jan 2010 16:26:26 +0800
Message-ID: <cb9ecdfa1001180026q5856b170t3f4c71191a7b99d8@mail.gmail.com>
References: <cb9ecdfa1001172304q132d5324qa963d0d5cdfb7806@mail.gmail.com>
	 <OF593A1F75.3C3C7D18-ONC12576AF.002B1239-C12576AF.002BB30A@transmode.se>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=AEwsUati6czvjtxdK7uYDTtzHT2xsMSRN3WftGf3s0w=;
        b=jmHxGxRHuOKQLTnHxKm1feOHdnGlBNxVwF84GWobQbl1wUTNU44sR53iGW/BH5/v2u
         aaWbi/SK/WTkoRRyNANBcPfvNg8NfURrT2xi9xe47BHemMlCG52PBzbrtARn7NUla8Pq
         x+VBEknesxorBueUYbbWGGFSPARWBPQgqoUJ4=
In-Reply-To: <OF593A1F75.3C3C7D18-ONC12576AF.002B1239-C12576AF.002BB30A@transmode.se>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
content-type: text/plain
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: linux-embedded@vger.kernel.org, linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org

Yes, umount / reboot command doesn't hang after first boot + wait for
20 minutes. The jffs2_gcd_mtdx will re-erase empty blocks but how do I
know it is finished?

BTW, why jffs2_gcd_mtd need to re-erase empty blocks and it will cause
some command cannot work if erase block is necessary. I mean many
pepple could meet this problem if it is need to erase empty block and
how do they overcome or workaround it.

Thank you so much, Jocke
BRs, H. Johnny

> I guess this is the first reboot after mounting a new JFFS2 FS?
> Then JFFS2 is reerasing empty blocks and you will have to wait
> until it is done.
>
> I posted a patch long ago for this, but it was racy w.r.t JFSS2 modul=
e unload so
> it didn't make it into the repo. Search the list for
> "[JFFS2] Stop erasing blocks when rebooting." to find my old patch
>
> =A0Jocke
>
>
