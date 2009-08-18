From: Alex Riesen <raa.lkml@gmail.com>
Subject: Re: New fast(?)-boot results on ARM
Date: Tue, 18 Aug 2009 12:48:50 +0200
Message-ID: <81b0412b0908180348n75af1113wb380919eaeaaf29b@mail.gmail.com>
References: <20090814170228.GM13320@pengutronix.de>
	 <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com>
	 <20090814204305.GA31727@pengutronix.de>
	 <20090815103532.GA5596@sig21.net> <4A8A7D38.5020201@gmail.com>
	 <20090818102136.GN29655@pengutronix.de>
	 <81b0412b0908180334u51fd957dh36f2a4946dffbb0b@mail.gmail.com>
	 <20090818104410.GO29655@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=TpmzTRIYJrhBcVTf6Vxow34KrJ9ms4Nt0BE+2nsyMUI=;
        b=gCjtBcB3In+a5rvtj4XsQH5jLuEAzU/7pIUmaPKxqf1cEC214B3RxTgCH2Ps5tIhOd
         uUGezqB8ei7ChlGMxQ2w0fmHHASdcam8nakHP/rdAxN9ggzYXBJAxG1otYPqq1PIYidI
         LH7iJGZqmaIzAT2SHmlu1floSuJcSAXBLF5HY=
In-Reply-To: <20090818104410.GO29655@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Marco Stornelli <marco.stornelli@gmail.com>, Johannes Stezenbach <js@sig21.net>, Denys Vlasenko <vda.linux@googlemail.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

On Tue, Aug 18, 2009 at 12:44, Robert Schwebel<r.schwebel@pengutronix.d=
e> wrote:
> On Tue, Aug 18, 2009 at 12:34:52PM +0200, Alex Riesen wrote:
>> On Tue, Aug 18, 2009 at 12:21, Robert Schwebel<r.schwebel@pengutroni=
x.de> wrote:
>> > - In general we want to have our systems close to what the mainlin=
e
>> > =C2=A0does; Automation & Embedded is only a small market, and anyt=
hing
>> > =C2=A0which is *not* specific to these markets but mainline is goo=
d.
>>
>> BTW, what is your mainline (or it looks like you mean "upstream")?
>
> unpatched kernel.org
>

But many of the problems you described and suggested solutions
point at userspace, right? (like pre-defined static /dev, mdev script,
or using of specially designed rootfs)
