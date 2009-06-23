From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Tue, 23 Jun 2009 07:57:35 +0200
Message-ID: <20090623055735.GA23119@logfs.org>
References: <4A33A7EC.6070008@gmail.com> <200906221317.04166.arnd@arndb.de> <4A3FC7F1.5050108@gmail.com> <200906222033.20883.arnd@arndb.de> <4A3FDBFE.8050509@2net.co.uk> <20090622214155.GA19332@logfs.org> <1245709239.25547.394.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1245709239.25547.394.camel@macbook.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Chris Simmonds <chris@2net.co.uk>, Arnd Bergmann <arnd@arndb.de>, Marco <marco.stornelli@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Mon, 22 June 2009 23:20:39 +0100, David Woodhouse wrote:
> On Mon, 2009-06-22 at 23:41 +0200, J=C3=B6rn Engel wrote:
> > Four loops doing the same increment with different data types: long=
,
> > u64, we32 (wrong-endian) and we64.  Compile with _no_ optimizations=
=2E
>=20
> That's a bit of a poor test then. Especially on architectures with a
> load-and-swap instruction where it really shouldn't be any slower at
> all.
>=20
> (Although since GCC doesn't have an __attribute__((littleendian)) I'm
> not entirely sure how to entice it into _using_ said instruction for =
the
> purpose of the test... I think the kernel does manage somehow though,=
 if
> you get the sources _just_ right.)

=46eel free to improve the test.  It is admittedly crap and designed to
support Chris' argument.  But seeing that it still fails to do so and
Arnd has already shown one improvement that weakened Chris' argument, I
guess we can all agree that further improvments won't change the
conclusion, can we? ;)

J=C3=B6rn

--=20
It's just what we asked for, but not what we want!
-- anonymous
