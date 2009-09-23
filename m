From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: GPIO driver for MPC8313.
Date: Wed, 23 Sep 2009 08:57:43 +0200
Message-ID: <87y6o6rvvc.fsf@macbook.be.48ers.dk>
References: <cb9ecdfa0909222055x1d691698sb516b5b8f5f81d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:to:cc:subject
         :references:from:date:in-reply-to:message-id:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=Gz0Str32uB1U/Zj1wqiu7PHNSQu0MWZokuKlmT95jAs=;
        b=T9B0PxWC8vIMs8FxSQ+zcik+G4iFUZH1rKiv45XIufS0fUVYbg9yBAaPTI565R3Fh6
         Mk6UxCIo5SAbJu4qgxime/V2B+NlaSeHtfXCrqkMXpJvY3T1O0A/wrGilIGJnTJpVC1y
         Hx8+RhCfOHJpYNh69stN1k881WOZQKS/3z5do=
In-Reply-To: <cb9ecdfa0909222055x1d691698sb516b5b8f5f81d@mail.gmail.com> (Johnny Hung's message of "Wed\, 23 Sep 2009 11\:55\:36 +0800")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-embedded@vger.kernel.org

>>>>> "Johnny" =3D=3D Johnny Hung <johnny.hacking@gmail.com> writes:

 Johnny> Hi All:
 Johnny> =C2=A0 =C2=A0Is there a alreday written GPIO dirver or example=
 for
 Johnny> MPC8313/similar ppc platform. It looks like many people need G=
PIO
 Johnny> dirver to control LED, etc... I think is it possible to write =
a
 Johnny> general gpio driver for all ppc platform and only need to modi=
fy gpio
 Johnny> iomap information of dtb file. Please give me a advice. Thanks=
 in
 Johnny> advanced.

Sure, it's arch/powerpc/sysdev/mpc8xxx_gpio.c, included since 2.6.28. T=
o
use it, simply enable CONFIG_MPC8xxx_GPIO and add a gpio-controller nod=
e
to your dts, similar to how it's done in
arch/powerpc/boot/dts/mpc837*_rdb.dts.

See Documentation/powerpc/dts-bindings/fsl/8xxx_gpio.txt for details of
the dts bindings.

--=20
Bye, Peter Korsgaard
