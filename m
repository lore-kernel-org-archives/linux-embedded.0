From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: UIO - interrupt performance
Date: Mon, 20 Oct 2008 14:48:58 +0200
Message-ID: <20081020144858.1f074d7b@surf>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded@vger.kernel.org

Le Mon, 20 Oct 2008 10:55:17 +0100,
"Douglas, Jim (Jim)" <jdouglas@avaya.com> a =C3=A9crit :

> Do you know what the *technical* disadvantages of this approach might
> be? I am most concerned about possible impact on interrupt handling.=20
>=20
> For example, I assume the context switching overhead is higher, and
> that interrupt latency is more difficult to predict? =20

There was a presentation on UIO in embedded systems at the latest
Embedded Linux Conference in April. The presentation includes a small
analysis of UIO's overhead with regard to interrupt latency. See
http://www.celinux.org/elc08_presentations/uio080417celfelc08.pdf

Sincerly,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
