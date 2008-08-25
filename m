From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [RFC] Remove more code when IP_MULTICAST=n
Date: Mon, 25 Aug 2008 08:48:25 +0200
Message-ID: <20080825084826.19923151@surf>
References: <20080819150047.38f09acf@surf>
	<Pine.LNX.4.64.0808191618190.25348@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0808191618190.25348@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: linux-embedded@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

Le Tue, 19 Aug 2008 16:18:38 +0200 (CEST),
Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> a =C3=A9crit :

> On Tue, 19 Aug 2008, Thomas Petazzoni wrote:
> > [RFC] Remove more code when IP_MULTICAST=3Dn
>=20
> Probably you wanted to cc netdev@vger.kernel.org?

Not necessarly at the beginning: I first wanted to get the feedback of
embedded-concerned developers, who might have a better understanding
than me of the networking stack. Last time I submitted a size-reduction
patch to Dave Miller concerning IGMP, the answer was:

=C2=AB
I'm not applying this.

This removes core parts of the BSD socket API from applications.
Like TCP and UDP, multicast capabilities are something applications
can always depend upon being available.

If you want a broken networking implementation, you have the source
code, so you can do it in your own tree.
=C2=BB

So, I'd prefer to send a good patch from the beginning.

Thanks,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
