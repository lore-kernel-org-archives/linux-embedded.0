From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Fri, 22 Aug 2008 21:37:15 +0200
Message-ID: <200808222137.16108.arnd@arndb.de>
References: <48AD0101.4020505@gmail.com> <200808221852.38950.arnd@arndb.de> <6934efce0808221043i3d463ac2gb54b7dd4cfde4b81@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0808221043i3d463ac2gb54b7dd4cfde4b81@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Friday 22 August 2008, Jared Hulbert wrote:
> > It certainly sounds like something for your medium-term TODO list,
> > although I wouldn't think of it as a show-stopper.
>=20
> Maybe. =C2=A0It more of a feature rather than a bug. =C2=A0It makes s=
tat() and
> such fast. =C2=A0The trade off is RAM...

Yes. And if you implement it at some point later, it can well be
a mount option or an mkfs option in case it needs format changes.

	Arnd <><
