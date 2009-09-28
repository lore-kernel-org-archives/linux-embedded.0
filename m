From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: GPIO driver for MPC8313.
Date: Mon, 28 Sep 2009 07:16:55 +0200
Message-ID: <87vdj3sl6g.fsf@macbook.be.48ers.dk>
References: <cb9ecdfa0909222055x1d691698sb516b5b8f5f81d@mail.gmail.com>
	<87y6o6rvvc.fsf@macbook.be.48ers.dk>
	<cb9ecdfa0909230352w77a37f59h3c7f1e146121f9f6@mail.gmail.com>
	<87r5txrkfz.fsf@macbook.be.48ers.dk>
	<cb9ecdfa0909230820k6ebbd589o409e58e2d9b6740c@mail.gmail.com>
	<cb9ecdfa0909271943o6133f5c8r9b25a25140e7842f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:to:cc:subject
         :references:from:date:in-reply-to:message-id:user-agent:mime-version
         :content-type;
        bh=YlcNQfDlkX85w4WIPyvOIpW7dp3KaHixMTeeb1O4NAo=;
        b=qi/ex3NSpSGyxGsDBSSCcIMfHKgGPiGknV0moz3qXDzqSuesvZ2HmsPTl0w942CmP7
         VHj6jIoC441nYCb1Y6L3TzYeoHAUjTici2jJu2gSDxFomRUjnhefC5RMF3zc5pW0uVWL
         Ij+HBALqjpfxxfw7+WgfpvjduydKfzbe5YCMk=
In-Reply-To: <cb9ecdfa0909271943o6133f5c8r9b25a25140e7842f@mail.gmail.com> (Johnny Hung's message of "Mon\, 28 Sep 2009 10\:43\:00 +0800")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-embedded@vger.kernel.org

>>>>> "Johnny" == Johnny Hung <johnny.hacking@gmail.com> writes:

 Johnny> The kerne source I used now is 2.6.23 with MPC8313-erdb
 Johnny> pached. I think I should port 2.6.28 gpio function back to
 Johnny> 2.6.23. Is it a common way to implement it in the kernel I used
 Johnny> or I should port MPC8313-erdb pached to 2.6.28 opposite?

It shouldn't be that hard to back port, but I would certainly go for
2.6.28 (or rather 2.6.31) unless something keeps you at 2.6.23.

-- 
Bye, Peter Korsgaard
