From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Fri, 22 Aug 2008 18:52:37 +0200
Message-ID: <200808221852.38950.arnd@arndb.de>
References: <48AD0101.4020505@gmail.com> <48AE19AD.1020209@lougher.demon.co.uk> <6934efce0808212005h30fa16d8w48833e8a0becfd8c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0808212005h30fa16d8w48833e8a0becfd8c@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Friday 22 August 2008, Jared Hulbert wrote:
> > This implies for block devices that the entire filesystem metadata =
has to be
> > cached in RAM. =C2=A0This severely limits the size of AXFS filesyst=
ems when using
> > block devices, or the else memory usage will be excessive.
>=20
> This is where 64bit squashfs could be a better fit.

Is this the only place where squashfs has a significant advantage?=20
If so, you might want to change it in axfs eventually to make the
decision easier for users ;-)

It certainly sounds like something for your medium-term TODO list,
although I wouldn't think of it as a show-stopper.

	Arnd <><
