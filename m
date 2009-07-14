From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [PATCH 1/2] MMC Agressive clocking framework v4
Date: Tue, 14 Jul 2009 17:19:07 +0200
Message-ID: <63386a3d0907140819j47bbaeb0r447180f7e6cf160@mail.gmail.com>
References: <1245617982-5007-1-git-send-email-linus.walleij@stericsson.com>
	 <63386a3d0907140812q20b5e0bbl63c2906dea6af5e9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=bUo6G4OzXgOWHXBicdg1Ogottmg+iWnY6FW/0/+RTTc=;
        b=W1ueNmnc01o963z2dlUpABvNoTmVYU8ySq/Q/AM7sGWbx11Q6g5w+RAVehft9q1Khz
         grMP/3o34aNSOKxQJOnmPlwstVVLP+E78/hGdqsAGj/8nlGoiQjIkAIaocRpiccUPXq2
         PBBAKPC6TDpaa5NNqycGjt50/he5mbYg8RkUs=
In-Reply-To: <63386a3d0907140812q20b5e0bbl63c2906dea6af5e9@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pierre Ossman <pierre@ossman.eu>
Cc: Linus Walleij <linus.walleij@stericsson.com>, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org

2009/7/14 Linus Walleij <linus.ml.walleij@gmail.com>:
> 2009/6/21 Linus Walleij <linus.walleij@stericsson.com>:
>
>> This patch modified the MMC core code to optionally call the
>> set_ios() operation on the driver with the clock frequency set
>> to 0
>
> Ping on this. It's soon been a month since the last version and
> I know we're in vacation times but...

Aw sorry now I saw you mail about being unable to continue doing
MMC maintenance.

I will proceed to send the patch to Andrew if noone picks up the
r=F4le, OK.

Linus Walleij
