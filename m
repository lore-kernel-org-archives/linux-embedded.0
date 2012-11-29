From: Alexander Varnin <fenixk19@mail.ru>
Subject: Re: Need help adding platform UIO devices to board
Date: Thu, 29 Nov 2012 13:29:49 +0400
Message-ID: <50B72B0D.80904@mail.ru>
References: <50B65DA3.9000707@mail.ru> <20121128190353.GA20385@opentech.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=LEyjbzDjFyCKyuM3vZO37UBWctFYshIK75cWCV1O6rI=;
	b=3ebwlTAa+aqAAiiRKV0k/VUXV+5J3ZGvgdqEhkR6/H89AalgjygAM9yBZDDipivSFffybXcvImlGNHXkwvVUMjF0p0/nJGHMD7O6Q2XPbu6YL+Iz0TNFrixnM9uIBbcm;
In-Reply-To: <20121128190353.GA20385@opentech.at>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: linux-embedded@vger.kernel.org

28.11.2012 23:03, Nicholas Mc Guire =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> open O_RDONLY and then write to it ?
>
> return of 9 =3D=3D EBADF
>
> man 2 write
>
>   EBADF  fd is not a valid file descriptor or is not open for writing=
=2E
>
> hofrat
Yes, sorry, stupid mistake.
But with the correct rights O_RDWR i get error 22 EINVAL both on read=20
and write.
So problem is still there.
