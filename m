From: Alexander Varnin <fenixk19@mail.ru>
Subject: Re: Need help adding platform UIO devices to board
Date: Thu, 29 Nov 2012 13:47:25 +0400
Message-ID: <50B72F2D.30101@mail.ru>
References: <50B65DA3.9000707@mail.ru> <20121128190353.GA20385@opentech.at> <50B72B0D.80904@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=KZoB1B9mK6QzDkOJVakg/0cfM5zu2DSK434/mDFjd/s=;
	b=1TQFQl/P4WneGrjqUf3cN1rg6YKfOc/VWgQEEUiC9I707owlRAz9wizujDWZ1zy6At6Ih6K0vYRHgpAb5dbGM1zRBjWXDa2RvutEPlUacLQtnlO1EiLXLU+QybmEFIsN;
In-Reply-To: <50B72B0D.80904@mail.ru>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: linux-embedded@vger.kernel.org

29.11.2012 13:29, Alexander Varnin =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> 28.11.2012 23:03, Nicholas Mc Guire =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Yes, sorry, stupid mistake.
> But with the correct rights O_RDWR i get error 22 EINVAL both on read=
=20
> and write.
> So problem is still there.
> --=20
> To unsubscribe from this list: send the line "unsubscribe=20
> linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
Seems to be solved.

Problem was due to lines

if (count !=3D sizeof(s32))
return -EINVAL;

in uio_read kernel function.

I've made read of 4 bytes, and it is ok.
