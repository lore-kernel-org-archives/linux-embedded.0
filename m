Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE9F2003D5
	for <linux-embedded@vger.kernel.org>; Fri,  8 Nov 2024 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731079262; cv=none; b=CCKc3Pix1fOCt2a5yuQivu3U+S+wm9PyM3RNV/bdND+GcWWvM0NRWUinaylS4XX5fFDMG70gIAh877KPE5armmudRyb/C5Mvc9tUya02tfjH/+MEZg382DUC2GrKae3sz2JB3RHQDVOyyWqKJtqczri5oLKIgjQpYlb2LS4uIyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731079262; c=relaxed/simple;
	bh=fo3uUxJNbrFRvLqB+ud6y0eMZHdeHFWS+wloP4ipuns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TlH+bBp/qd58X//iVr16i12cPuLDej6zBngunbcqHXgDpSgS9vEfIM/FFrVMDkEO9w9au5o/7TUnxO0FIDBo37rWjsdrJewDT7jlMe3sjyPedza1nB0nmDMp9EXNdl2L0ZBjXMPIttnV1JmqaYabeDo1d1WN2oSHkj52F0rU6v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=CwVARL5i; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="CwVARL5i"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539fe02c386so3125757e87.0
        for <linux-embedded@vger.kernel.org>; Fri, 08 Nov 2024 07:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1731079256; x=1731684056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fo3uUxJNbrFRvLqB+ud6y0eMZHdeHFWS+wloP4ipuns=;
        b=CwVARL5i6OClIOQG4Nqcm9DadFuvmgWhqzGANjHtln8xvS/xOu7nL6w1Ba13r9JHHK
         bCuRAz957rcrE6xjU1qei8I8w5YgLamaU3MLOQGRxKxf3aGhvB5j3sLC1u1HwMANhVsn
         Vo1+lApGdmKq8zvrgGKk7j5lK28WShL+HV7Dv0Srf8Ds01LoFo6I5CPGmOjS3jwJpBzh
         yvTj0IOaNKslojOw7WRt6xjJEETOe7ePIg1K6OaTkJAqfgUh4sxGPSfkzO89BLmwjsU5
         tN/XlWXTlH/Jly2bcMJHl28T6hTpuh8/XR6JRh5cpIKuB80zDlcrApTEo4kRiPObhK42
         BjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731079256; x=1731684056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fo3uUxJNbrFRvLqB+ud6y0eMZHdeHFWS+wloP4ipuns=;
        b=p1IpIyHtguH9OP13yGChLJqbJBMKueXHJlq2ehBbH84tjqlzS/wP94PRW2fuI2DE+i
         RsCZ/gmoAL696d0Y/q8l6vVvok5ilHEMSxPIO1hJkaOLVp2KoadTkvqBs8mWWyIiHciD
         EPKD5N0CCA2kIq7/e0vnZPOc7UyS17vssIhkXEW1h41pTR7bBBDyfdXMpeGJgcTKrib2
         NT6ZLE5+gMyD+jUs3ZFx0/9gcky9W212ODX2vjsKojEvbpPkD9mQUQF4A3GN9gSYkmbo
         rEmTU97VnrbLg6mAvLZK4Pvnh0B7SB7f/2esGvwXAuQnD0TIwBcpx7A7Y80hKqC4Kg0g
         z7RQ==
X-Gm-Message-State: AOJu0YzdUIg0H+tMtxwQ8p37A1a64IwxLhGlcUlKouLv2TFJ4W1P7/r+
	yzJuJEyN15j6gTAfzyRbFiYBdSM2CbN2j7JoBQzN8Z+TumFh5Z9IspINYUY51lSkttQcdIDMBVS
	rDA7QZBgYG7+++kcK/+vOSmF/W2fQGKOMbY9ErA==
X-Google-Smtp-Source: AGHT+IF2wBKW0bHIiYaSXJP97+8KLdiea1K7DPDb0TAZ6QoqIUNM0TNm6XuQP9ctK5b+YwDCnHdB/4H0zKJ4oU4euFM=
X-Received: by 2002:a2e:a813:0:b0:2fb:569a:5543 with SMTP id
 38308e7fff4ca-2ff1f4d06ddmr14112321fa.19.1731079255629; Fri, 08 Nov 2024
 07:20:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKH5gYwJL85NYma7YaiFwN8Bz-WngHa=arvR-SfKtr_FFD3pSw@mail.gmail.com>
In-Reply-To: <CAKH5gYwJL85NYma7YaiFwN8Bz-WngHa=arvR-SfKtr_FFD3pSw@mail.gmail.com>
From: Ezra Buehler <ezra@easyb.ch>
Date: Fri, 8 Nov 2024 16:20:45 +0100
Message-ID: <CAM1KZSm=JtDzgpL-aE3RH8SfQU8sm_ReS75nNz6J=-NKXcPoiw@mail.gmail.com>
Subject: Re: Request to join the mailing list
To: Madeeha Javed <madeeha@gmail.com>
Cc: linux-embedded@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Madeeha,

On Fri, Nov 8, 2024 at 3:35=E2=80=AFPM Madeeha Javed <madeeha@gmail.com> wr=
ote:
> I work at Igalia but I am joining from my personal email account
> because I have personal interest in working on Linux boot time
> optimizations due to my prior experience with Automotive use-cases in
> my past job.
>
> Thanks!
> Madeeha Javed
> https://www.linkedin.com/in/madeehajaved/
>

On how to subscribe, from https://elinux.org/Boot_Time#Mailing_list:

To subscribe or unsubscribe, see this page:
https://subspace.kernel.org/vger.kernel.org.html
Note: don't send email to the list itself to subscribe or unsubscribe.
Click on the 'sub' or 'unsub' buttons on the web page, or follow the
instructions here: https://subspace.kernel.org/subscribing.html

Cheers,
Ezra.
