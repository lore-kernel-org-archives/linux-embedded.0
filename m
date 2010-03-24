From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: RFC: direct MTD support for SquashFS
Date: Wed, 24 Mar 2010 07:35:01 +0100
Message-ID: <87y6hii5wq.fsf@macbook.be.48ers.dk>
References: <87vdcwv139.fsf@tac.ki.iif.hu>
	<87ljdsibqe.fsf@macbook.be.48ers.dk> <87r5nhziss.fsf@tac.ki.iif.hu>
	<bffbecbb1003181440kc78f4dbvd25d4e2ea17b52e5@mail.gmail.com>
	<8739zqpxxw.fsf@tac.ki.iif.hu> <4BA9A1BB.4000105@lougher.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:from:to:cc
         :subject:references:date:in-reply-to:message-id:user-agent
         :mime-version:content-type;
        bh=rRItenQfFW5srdQSy6QBxpSIZXCACuniGo5XkMgNhB4=;
        b=l0Lc0Qq9KjSwK4JKyKr8Z4HMepFYKVSBzYYjSkC7zJNRP066VUvhqR8X2sG1hdeNq8
         mYSzfzFa0b1bbr4TuerH5VrU7WXyz+vFQa7Dr3iJzb6AZV4yTJ37XYxHSH1kwEwh/JKh
         AqwkBEOCtSuBCHbZmosyVbi3giuAK+q1QRm3I=
In-Reply-To: <4BA9A1BB.4000105@lougher.demon.co.uk> (Phillip Lougher's message
	of "Wed, 24 Mar 2010 05:23:07 +0000")
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Ferenc Wagner <wferi@niif.hu>, Phillip Lougher <phillip.lougher@gmail.com>, linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

>>>>> "Phillip" == Phillip Lougher <phillip@lougher.demon.co.uk> writes:

Hi,

 Phillip> BTW as a comparison, I have added MTD support to Squashfs
 Phillip> twice in the past, *with* bad block support.  The latest has a
 Phillip> diff patch of ~500 lines, with far less complexity and code
 Phillip> changes necessary.

Could we merge that then please?

Again, what kind of size reduction can we expect from getting rid of the
block layer?

-- 
Bye, Peter Korsgaard
