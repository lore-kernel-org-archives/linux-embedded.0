From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [ANNOUNCE] CELF open project proposal
Date: Fri, 4 Dec 2009 23:39:10 +0900
Message-ID: <9c9fda240912040639n3126f7cbv5de06ac0fc600bec@mail.gmail.com>
References: <4B15AAFE.4030705@am.sony.com>
	 <8bd0f97a0912021336xf1ef7ebmfb502efabec187cb@mail.gmail.com>
	 <4B16E03D.3000202@am.sony.com>
	 <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com>
	 <20091203062503.4300CE6D391@gemini.denx.de>
	 <9c9fda240912030538j14ea07bdr7fa2f4c1b902405c@mail.gmail.com>
	 <20091203205447.GJ22533@pengutronix.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=uKJackEs6fDZm/MHgud3n5pqbvjNhMQDJDtb+J093fA=;
        b=p5JtKrLJdNlOYRlJj15ZQcJzvBnLwB8NOKmdKCDo9Fhb98AMJvE6P+aFhgoKSA80Qq
         IibCG7vYbrOMdh3q0a66c9GoueeSsJ794QN542ctcOJaiNutTdn8Frbdw9keCTZOfkvk
         GFLmObg6OmRZcs3rUIX9MvBtUcC4eJsO1q+Ws=
In-Reply-To: <20091203205447.GJ22533@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Fri, Dec 4, 2009 at 5:54 AM, Robert Schwebel
<r.schwebel@pengutronix.de> wrote:
> On Thu, Dec 03, 2009 at 10:38:07PM +0900, Kyungmin Park wrote:
>> How about the TFTP over USB? It's required feature for no ethernet devices
>
> In barebox (aka u-boot-v2) we have USB DFU support, in a very flexible
> way. Would that fit your needs?

I will check the USB DFU. Thanks for info.

>
>> I wish some filesystem to share between u-boot and kernel. Of course
>> ext2 or fat is possbile. but current u-boot implementation depends on
>> block device or NOR device. not for NAND/OneNAND devices.
>
> That would indeed be interesting.

More required feature is we can update the file instead of partition.
Remove or update the file itself.
>
>> Finally very very small jpeg or png library for u-boot (under 30KiB).
>
> What's your use case for that, a splash screen?

and charging animation. bootloader can support the battery charging feature.
That's the another reason to use sharable filesystem at bootloader.
We store the charging images to shareable filesystem and display it at
bootloader using graphics library.

Thank you,
Kyungmin Park
