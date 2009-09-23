From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: GPIO driver for MPC8313.
Date: Wed, 23 Sep 2009 18:52:24 +0800
Message-ID: <cb9ecdfa0909230352w77a37f59h3c7f1e146121f9f6@mail.gmail.com>
References: <cb9ecdfa0909222055x1d691698sb516b5b8f5f81d@mail.gmail.com>
	<87y6o6rvvc.fsf@macbook.be.48ers.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=YktBNzK59SG+F5QXX8C+AuEmV3TVh4VYSdYUC7gP+4c=;
	b=Gt8XihHy6T+uBdHEmLp19iVgMlHmW/5ol5RAgVHUW43MbASmGiw+JweI5MWD3ZulkB
	JoouZyOzbjonJRlkpH/U2bPPdqUB5OZbA8DeilHPy6B9SSw7BBHKYxAze7Wy2XILpap3
	Q+poTCU7c82ywLiAgX9OHny5XhKR4WafkXtkI=
In-Reply-To: <87y6o6rvvc.fsf@macbook.be.48ers.dk>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: linuxppc-dev@lists.ozlabs.org, linux-embedded@vger.kernel.org

Thanks, got it. BTW, how to trigger GPIO level in user space
application? I also found arch/powerpc/platforms/52xx/mpc52xx_gpio.c
is a good example. Any reply is appreciate.

BRs, H. Johnny

2009/9/23 Peter Korsgaard <jacmet@sunsite.dk>:
>>>>>> "Johnny" =3D=3D Johnny Hung <johnny.hacking@gmail.com> writes:
>
> =A0Johnny> Hi All:
> =A0Johnny> =A0 =A0Is there a alreday written GPIO dirver or example for
> =A0Johnny> MPC8313/similar ppc platform. It looks like many people need G=
PIO
> =A0Johnny> dirver to control LED, etc... I think is it possible to write a
> =A0Johnny> general gpio driver for all ppc platform and only need to modi=
fy gpio
> =A0Johnny> iomap information of dtb file. Please give me a advice. Thanks=
 in
> =A0Johnny> advanced.
>
> Sure, it's arch/powerpc/sysdev/mpc8xxx_gpio.c, included since 2.6.28. To
> use it, simply enable CONFIG_MPC8xxx_GPIO and add a gpio-controller node
> to your dts, similar to how it's done in
> arch/powerpc/boot/dts/mpc837*_rdb.dts.
>
> See Documentation/powerpc/dts-bindings/fsl/8xxx_gpio.txt for details of
> the dts bindings.
>
> --
> Bye, Peter Korsgaard
>
