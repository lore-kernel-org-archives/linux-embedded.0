From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH] devtmpfs: support !CONFIG_TMPFS
Date: Tue, 16 Mar 2010 14:04:06 +0100
Message-ID: <87tysgifjt.fsf@macbook.be.48ers.dk>
References: <1268389504-22179-1-git-send-email-jacmet@sunsite.dk>
	<4B9A2548.7050401@msgid.tls.msk.ru>
	<87aaud22jj.fsf@macbook.be.48ers.dk>
	<ac3eb2511003120502y2953ff0au81ee5c4d76261a87@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:from:to:cc
         :subject:references:date:in-reply-to:message-id:user-agent
         :mime-version:content-type;
        bh=JP5wVq1dpjGhOkmFK0vcaNMfZJrlb+LV+bxEiivm89o=;
        b=dwcGdjqzuy2KFROhCL5fEkXXf5ktJFD3VIkfH+LOlbpzwfVPI9fripNwTyuoxgYCA5
         fZK9+OWOHkg0R41eAOCNejL/vR4nAD63VxgXZfOMZTwFZGGq5vQpSgDmwyV0G6TW1hcN
         7Yn+bAlzFX1lxrbcmYjlbiLv0GQiaTb+KMSLY=
In-Reply-To: <ac3eb2511003120502y2953ff0au81ee5c4d76261a87@mail.gmail.com>
	(Kay Sievers's message of "Fri, 12 Mar 2010 14:02:57 +0100")
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: Kay Sievers <kay.sievers@vrfy.org>, Michael Tokarev <mjt@tls.msk.ru>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

>>>>> "Kay" == Kay Sievers <kay.sievers@vrfy.org> writes:

Hi,

 Kay> For the patch:
 Kay>   Acked-by: Kay Sievers <kay.sievers@vrfy.org>

Great - Greg, will you pick this up?

http://patchwork.kernel.org/patch/85237/

-- 
Bye, Peter Korsgaard
