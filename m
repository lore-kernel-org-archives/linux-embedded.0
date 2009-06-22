From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Mon, 22 Jun 2009 23:41:55 +0200
Message-ID: <20090622214155.GA19332@logfs.org>
References: <4A33A7EC.6070008@gmail.com> <200906221317.04166.arnd@arndb.de> <4A3FC7F1.5050108@gmail.com> <200906222033.20883.arnd@arndb.de> <4A3FDBFE.8050509@2net.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A3FDBFE.8050509@2net.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Simmonds <chris@2net.co.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Marco <marco.stornelli@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Mon, 22 June 2009 20:31:10 +0100, Chris Simmonds wrote:
>=20
> I disagree: that adds an unnecessary overhead for those architectures=
=20
> where the cpu byte order does not match the data structure ordering. =
I=20
> think the data structures should be native endian and when mkpramfs i=
s=20
> written it can take a flag (e.g. -r) in the same way mkcramfs does.

Just to quantify this point, I've written a small crap program:
#include <stdio.h>
#include <stdint.h>
#include <byteswap.h>
#include <sys/time.h>

long long delta(struct timeval *t1, struct timeval *t2)
{
	long long delta;

	delta  =3D 1000000ull * t2->tv_sec + t2->tv_usec;
	delta -=3D 1000000ull * t1->tv_sec + t1->tv_usec;
	return delta;
}

#define LOOPS 100000000
int main(void)
{
	long native =3D 0;
	uint32_t narrow =3D 0;
	uint64_t wide =3D 0, native_wide =3D 0;
	struct timeval t1, t2, t3, t4, t5;
	int i;

	gettimeofday(&t1, NULL);
	for (i =3D 0; i < LOOPS; i++)
		native++;
	gettimeofday(&t2, NULL);
	for (i =3D 0; i < LOOPS; i++)
		narrow =3D bswap_32(bswap_64(narrow) + 1);
	gettimeofday(&t3, NULL);
	for (i =3D 0; i < LOOPS; i++)
		native_wide++;
	gettimeofday(&t4, NULL);
	for (i =3D 0; i < LOOPS; i++)
		wide =3D bswap_64(bswap_64(wide) + 1);
	gettimeofday(&t5, NULL);
	printf("long:  %9lld us\n", delta(&t1, &t2));
	printf("we32:  %9lld us\n", delta(&t2, &t3));
	printf("u64:   %9lld us\n", delta(&t3, &t4));
	printf("we64:  %9lld us\n", delta(&t4, &t5));
	printf("loops: %9d\n", LOOPS);
	return 0;
}

=46our loops doing the same increment with different data types: long,
u64, we32 (wrong-endian) and we64.  Compile with _no_ optimizations.

Results on my i386 notebook:
long:     453953 us
we32:     880273 us
u64:      504214 us
we64:    2259953 us
loops: 100000000

Or thereabouts, not completely stable.  Increasing the data width is 10=
%
slower, 32bit endianness conversions is 2x slower, 64bit conversion is
5x slower.

However, even the we64 loop still munches through 353MB/s (100M
conversions in 2.2s, 8bytes per converion.  Double the number if you
count both conversion to/from wrong endianness).  Elsewhere in this
thread someone claimed the filesystem peaks out at 13MB/s.  One might
further note that only filesystem metadata has to go through endianness
conversion, so on this particular machine it is completely lost in the
noise.

=46eel free to run the program on any machine you care about.  If you g=
et
numbers to back up your position, I'm willing to be convinced.  Until
then, I consider the alleged overhead of endianness conversion a prime
example of premature optimization.

J=C3=B6rn

--=20
Joern's library part 7:
http://www.usenix.org/publications/library/proceedings/neworl/full_pape=
rs/mckusick.a
