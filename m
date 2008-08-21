From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Thu, 21 Aug 2008 17:12:26 +0200
Message-ID: <200808211712.27146.arnd@arndb.de>
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de> <6934efce0808210806r701f2e3bo677d2bd2da78faec@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0808210806r701f2e3bo677d2bd2da78faec@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Thursday 21 August 2008, Jared Hulbert wrote:
> > Have you seen any benefit of the rwsem over a simple mutex? I would=
 guess
> > that you can never even get into the situation where you get concur=
rent
> > readers since I haven't found a single down_read() in your code, on=
ly
> > downgrade_write()
>=20
> We implemented a rwsem here because you can get concurrent readers.
> My understanding is that downgrade_write() puts the rewem into the
> same state as down_read(). =C2=A0Am I mistaken?

Your interpretation of downgrade_write is correct, but if every thread
always does

down_write();
serialized_code();
downgrade_write();
parallel_code();
up_read();

Then you still won't have any concurrency, because each thread trying
to down_write() will be blocked until the previous one has done its up_=
read(),
causing parallel_code() to be serialized as well.

In addition to that, I'd still consider it better to use a simple mutex
if parallel_code() is a much faster operation than serialized_code(), a=
s it
is in your case, where only the memcpy is parallel and that is much slo=
wer
than the deflate.

	Arnd <><
