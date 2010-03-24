From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: RFC: direct MTD support for SquashFS
Date: Wed, 24 Mar 2010 12:35:21 +0100
Message-ID: <87ljdihs06.fsf@macbook.be.48ers.dk>
References: <87vdcwv139.fsf@tac.ki.iif.hu>
	<87ljdsibqe.fsf@macbook.be.48ers.dk> <87r5nhziss.fsf@tac.ki.iif.hu>
	<bffbecbb1003181440kc78f4dbvd25d4e2ea17b52e5@mail.gmail.com>
	<8739zqpxxw.fsf@tac.ki.iif.hu> <4BA9A1BB.4000105@lougher.demon.co.uk>
	<87y6hii5wq.fsf@macbook.be.48ers.dk> <871vfam00k.fsf@tac.ki.iif.hu>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:from:to:cc
         :subject:references:date:in-reply-to:message-id:user-agent
         :mime-version:content-type;
        bh=PPz4OF8c/AUasJR7bNfTEfOcExRA3yC3zFFSVV00iao=;
        b=KD7Tbz7b6sCU7Jr+kWP+cjtx3Q0KU7eFMoTC8PjwdN5Uag0KOQ8QNjA627Ir7YC4zL
         mTAk/o2jtPpv6ckWxmYkkUj/NiOsqvCD7XboO/sT+rl7iTMJpqjP3oesV/wU3Okon75p
         EwIqT+VCLE0Xdyv4v4LW8TxmDv0IcFaNiQ5Yk=
In-Reply-To: <871vfam00k.fsf@tac.ki.iif.hu> (Ferenc Wagner's message of "Wed,
	24 Mar 2010 12:28:43 +0100")
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ferenc Wagner <wferi@niif.hu>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

>>>>> "Ferenc" == Ferenc Wagner <wferi@niif.hu> writes:

Hi,

 >> Again, what kind of size reduction can we expect from getting rid of
 >> the block layer?

 Ferenc> My size-optimized OpenWRT vmlinux shrank ~170 kB after disabling
 Ferenc> CONFIG_BLOCK.  Similarly for the memory consumption.

Neat, thanks - That sounds worthwhile.

-- 
Bye, Peter Korsgaard
