Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F7B21C9E3
	for <linux-embedded@vger.kernel.org>; Thu,  5 Dec 2024 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733410705; cv=none; b=UYpnu7/DSi6USDDUdpZpIShgKtgCyCQ62JnOoi847N2Q5B1vj76bYTgH1Khb9KE2KU1QmIEYtmT96EBzCnB9Fo0t2i181D4ph7jXwMVqporttb7WtIn3H7reo18QWuaAKM9gEbh7NpGfo/a1n/zRmc5DncWiViku7CeJNvfgzkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733410705; c=relaxed/simple;
	bh=ljV0Zr8u+MeNIDmin8UnBfk6m9mlB475IIm3Sc04VF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Po+iGuTEABEj3WZLmNPwtGoLuC4hM2gSTubdSt0DdDROpFTF1C5HRAVOdkucW1ScMFcwdSw6bm4ZuRDTJNi8ryWoJcsXbR9kDsCctUY6ldx0NpmWszpGFvew5gBrbkhWKKPjVR2UUUGHK+IaUmam2sZ6EY2IJwfEOjNcsoQDQW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85b9c456f46so224984241.3
        for <linux-embedded@vger.kernel.org>; Thu, 05 Dec 2024 06:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733410701; x=1734015501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0mMKmgDBfUHZMjg2Zhf2fJQMkIFrqiXMwTO4TFixVI=;
        b=wp7RxhU9WmU7eupVOVDvo3rJzoRKUEU1UbH1sQqyTH8g9AYZQX+OtZu7iHtsNkxKdG
         Jxlkt49WSAZE6hg2CnhSahgqmDCeCHwiDS0bslEW8PD2r7NJRblkYj7bpmUj/j+QttuJ
         2gLeqTxMI0LyJEphRlyHYCK/TNI5JyuX2Q7EXz4jSAGNasrhbrfLx+FQNNA+Vmw8o6WJ
         8q8BvjKcza0k3WLuf0WPngdJA1wSAEKmi2UlURvc7/LMa6cLOLZuKTDjwmjLB4zYu4zF
         gyKeqs98/4CUbauuqCvMDBO1kP68FBhvteYxWBmDBZ6a1xgeR5euKAcfpHZPj+ubwqTo
         os1w==
X-Gm-Message-State: AOJu0YzCNh9931BhxWtS5dF0DkTCbd+cVQiFbPdspXLk3VH1rMzkcKwO
	TAOYHndDldGtwRZQ9+tJz0XGIktI5+Yr1T/CM661g70tX5VAdB640BbNm4zv
X-Gm-Gg: ASbGnctII7GiErK7vQy83Wh2G4SUnP2cmwEhmehOT0RdDzNJW+PTD0FH5Bjwrd/GzBy
	WInaQ/VmUp3Xy9FU9fareTITOvhE2mtSlMUCKmpVoZ+15rMaTAOjonlZu5MTQYw2QMbMVr/7Efl
	KSe8tNuN53iZGWnNc6BsqIPcponjrEoWJE1JlpXXdNRR0Q+nMEXtghT1gWGSkyr+B7pJfVtfYeA
	WCZ5HC5OQTD5tztpH5qm5iHS0dx4tOj9AKuT0RvErov89DivKx4fnQ4mEU6SWxg6CTqON4fiWHQ
	kuycab2rv3jO
X-Google-Smtp-Source: AGHT+IEbNAyjzyZG8hzxK3Ueoj/5SueAR64K58t97YlvrIYKYquaCC8cuXcEjBr4vfBfRvYsy7pGaQ==
X-Received: by 2002:a05:6102:548c:b0:4af:c519:4e85 with SMTP id ada2fe7eead31-4afc5194f7amr1469796137.0.1733410701588;
        Thu, 05 Dec 2024 06:58:21 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2ba0340bsm203121241.14.2024.12.05.06.58.21
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 06:58:21 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afc2f37936so137251137.2
        for <linux-embedded@vger.kernel.org>; Thu, 05 Dec 2024 06:58:21 -0800 (PST)
X-Received: by 2002:a05:6102:3046:b0:4af:bb2e:b4dc with SMTP id
 ada2fe7eead31-4afbb2eb4fcmr2639890137.4.1733410700997; Thu, 05 Dec 2024
 06:58:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1964175.7Z3S40VBb9@fedora.fritz.box> <MW5PR13MB563207AD3DB4415E5A1678A6FD362@MW5PR13MB5632.namprd13.prod.outlook.com>
 <2281836.vFx2qVVIhK@fedora>
In-Reply-To: <2281836.vFx2qVVIhK@fedora>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Dec 2024 15:58:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsLwvnZJ9i531coBkZpDzD_GuhODpHfqayrPAXT6PfOQ@mail.gmail.com>
Message-ID: <CAMuHMdUsLwvnZJ9i531coBkZpDzD_GuhODpHfqayrPAXT6PfOQ@mail.gmail.com>
Subject: Re: [boot-time] [RFC] analyze-initcall-debug.py - a tool to analyze
 the initcall debug output
To: Francesco Valla <francesco@valla.it>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, "Bird, Tim" <Tim.Bird@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francesco,

On Thu, Dec 5, 2024 at 3:47=E2=80=AFPM Francesco Valla <francesco@valla.it>=
 wrote:
> On Tuesday, 3 December 2024 at 21:33:06 Bird, Tim <Tim.Bird@sony.com> wro=
te:
> > > From: Francesco Valla <francesco@valla.it>
> > > Top 10 init/probes durations:
> > >  * 30200000.dss -> 523002us
> >
> > This call, and a lot of the others are missing function names.  Did you=
 compile the kernel with
> > CONFIG_KALLSYMS=3Dy?
> >
> > If that's the case, is there a way to use the System.map file for the k=
ernel (used on
> > the machine where the dmesg was obtained from) to map these addresses
> > to their respective  function names?
>
> These are not in fact addresses, but rather device names. In my understan=
ding, they are printed
> when a probe happens outside of the initialization function for their dri=
ver. I still don't have an idea
> on how to match probes with their original initcall, in order to present =
the user the complete picture.

30200000.dss corresponds to dss@30200000 in the DTS.

$ git grep -W dss@30200000 | grep compatible
arch/arm64/boot/dts/ti/k3-am62-main.dtsi- compatible =3D "ti,am625-dss";
arch/arm64/boot/dts/ti/k3-am62a-main.dtsi- compatible =3D "ti,am62a7-dss";

$ git grep -Ww ti,am625-dss -- drivers/ | grep of_device_id
drivers/gpu/drm/tidss/tidss_drv.c=3Dstatic const struct of_device_id
tidss_of_table[] =3D {

$ git grep -Ww tidss_of_table | grep _driver
drivers/gpu/drm/tidss/tidss_drv.c=3Dstatic struct platform_driver
tidss_platform_driver =3D {

$ git grep -Ww tidss_platform_driver | grep module
drivers/gpu/drm/tidss/tidss_drv.c:drm_module_platform_driver(tidss_platform=
_driver);

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
