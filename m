From: Robin Theunis <robint91@gmail.com>
Subject: Re: ARM target not boot after remap memory
Date: Tue, 14 Sep 2010 07:32:37 +0200
Message-ID: <AANLkTimWLpazRTDdGsXRrTYCjJQURM8ydv2TcX_PycWM@mail.gmail.com>
References: <AANLkTi=tWwaFHB0DY=j0UaqbYdYJpGJpmWdGC4aMufSw@mail.gmail.com>
	<20100913214132.0438615242D@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=0ZRT9Phum8R8JSq3OnENcYwcRzWMq74kZfEZqU50TfI=;
        b=fvNPcGTFpE/7/nKT1iPZTv/OOsmUOyvxlNpwBNvaduNnkym+tF3W/MaSDYArOa9jyh
         Se6oh6NYqq7NA78fMInBnm1LP8HsbsKvrKymlGiAf9veUzatff1Y0CBIcQlj2Hz7Yo3P
         8c/lXfVO+wrCTxXQ5Cv3qvuHIYzB1ctjelH6s=
In-Reply-To: <20100913214132.0438615242D@gemini.denx.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Wolfgang Denk <wd@denx.de>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Dear Wolfgang,

I messed up the buildroot and u-boot version!
u-boot =3D 2010.06
and
buildroot =3D 2010.08

Sorry all, my fault.

Best regards,

Robin Theunis

2010/9/13 Wolfgang Denk <wd@denx.de>:
> Dear Robin Theunis,
>
> In message <AANLkTi=3DtWwaFHB0DY=3Dj0UaqbYdYJpGJpmWdGC4aMufSw@mail.gm=
ail.com> you wrote:
>>
>> The U-boot version is 2010.08. I have build the whole system on a
>
> There is no such version of U-Boot.
>
> Best regards,
>
> Wolfgang Denk
>
> --
> DENX Software Engineering GmbH, =A0 =A0 MD: Wolfgang Denk & Detlev Zu=
ndel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> What is tolerance? -- it is the consequence of humanity. We =A0are =A0=
all
> formed =A0of frailty and error; let us pardon reciprocally each other=
's
> folly -- that is the first law of nature. =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0- Voltaire
>
