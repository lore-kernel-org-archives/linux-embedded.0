From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Tue, 23 Jun 2009 01:07:42 +0200
Message-ID: <200906230107.43667.arnd@arndb.de>
References: <4A33A7EC.6070008@gmail.com> <4A3FDBFE.8050509@2net.co.uk> <20090622214155.GA19332@logfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20090622214155.GA19332@logfs.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>
Cc: Chris Simmonds <chris@2net.co.uk>, Marco <marco.stornelli@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Monday 22 June 2009, J=C3=B6rn Engel wrote:
> Four loops doing the same increment with different data types: long,
> u64, we32 (wrong-endian) and we64.  Compile with no optimizations.
>=20
> Results on my i386 notebook:
> long:     453953 us
> we32:     880273 us
> u64:      504214 us
> we64:    2259953 us
> loops: 100000000

(couldn't resist)

The we64 number is artificially high because the glibc bswap_64
implementation forces the conversion to be done on the stack.
Using __builtin_bswap64 make this look more logical, and
makes your point even stronger (on core 2, using -m32):

long:     236792 us
we32:     500827 us
u64:      265990 us
we64:     757380 us
loops: 100000000

	Arnd <><
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
