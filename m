From: Hector Oron <hector.oron@gmail.com>
Subject: Re: [PWM 01/10] API to consolidate PWM devices behind a common user
 and kernel interface
Date: Sat, 2 Oct 2010 13:25:04 +0100
Message-ID: <AANLkTi=6GN=cwA5vuv4fNDt0=xPT3+g2vntzZdN_gDrw@mail.gmail.com>
References: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=uZByLB0osm+NKWUErCliIAD0LndKayKbzftjfQzxhJk=;
        b=Ets2XP/64/lcsOREFcGZAh2q9mGq5PZmwd9FDLeNUV2iy0hJggZkZJHtlb4SSojqTU
         dfgWEQ5/ZHV0ILznd62Zft+2cMneTU8KaQfAi2FrYNMOrvXwuf7lKh3TJsmGEDnMEA3v
         vVSCQpxP6y8pZPxOcsHmRvMWfXngYT6JIZ5V8=
In-Reply-To: <1285946271-17728-1-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

Hello Bill,

2010/10/1 Bill Gatliff <bgat@billgatliff.com>:
> Signed-off-by: Bill Gatliff <bgat@billgatliff.com>
> ---
> =C2=A0Documentation/pwm.txt =C2=A0 | =C2=A0260 +++++++++++++++++++
> =C2=A0drivers/pwm/pwm.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0635 ++++++++++++=
+++++++++++++++++++++++++++++++++++
> =C2=A0include/linux/pwm.h =C2=A0 =C2=A0 | =C2=A0 31 ---
> =C2=A0include/linux/pwm/pwm.h | =C2=A0128 ++++++++++
> =C2=A04 files changed, 1023 insertions(+), 31 deletions(-)
> =C2=A0create mode 100644 Documentation/pwm.txt
> =C2=A0create mode 100644 drivers/pwm/pwm.c
> =C2=A0delete mode 100644 include/linux/pwm.h
> =C2=A0create mode 100644 include/linux/pwm/pwm.h

Thanks for trying (again) to get this in mainline.
Are you planning to request a slot in the GIT at kernel.org to hold
and maintain this nice framework?

Best regards,
  -- H=C3=A9ctor Or=C3=B3n
