From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: LZMA inclusion
Date: Mon, 8 Dec 2008 21:17:34 +0100
Message-ID: <20081208201734.GA4069@logfs.org>
References: <492BA3FA.9010204@openwrt.org> <200812032348.36921.lasse.collin@tukaani.org> <Pine.LNX.4.64.0812050914380.8749@vixen.sonytel.be> <200812062356.50734.lasse.collin@tukaani.org> <20081207160140.GA13387@logfs.org> <493C5D10.1040604@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <493C5D10.1040604@lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Lasse Collin <lasse.collin@tukaani.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, Tim Bird <tim.bird@am.sony.com>, glp@openwrt.org, linux-embedded@vger.kernel.org

On Sun, 7 December 2008 23:32:32 +0000, Phillip Lougher wrote:
>=20
> Currently, as mentioned above, Squashfs decompresses into a single=20
> contiguous output buffer.  But, due to the linux kernel mailing list'=
s=20
> dislike of vmalloc, this is being changed.

Don't blame lkml, blame Intel and IBM.  Back in the days of the 386, a
beefy machine had 8MB of physical memory and 4GB of virtual memory
space.  Noone had to worry about fragmentation anymore.  If you needed =
a
1MB buffer, you'd just round up some 256 pages and instruct the mmu to
map them into a large contiguous address range in the virtual address
space.  Life was good indeed.

But physical memory has constantly grown since, while the virtual memor=
y
space has for a long time stagnated.  Intel even introduced some
hardware hacks to use up to 64GB of physical memory with a measly 4GB o=
f
virtual memory.  Now it was _virtual_ memory fragmentation that you had
to worry about.

These days most CPUs you'd buy are 64bit, so virtual memory space has
become useful again.  But as a kernel hacker, you have little control
over what hardware everyone is using.  And those weird systems with
more physical than virtual memory are still around. :(

J=C3=B6rn

--=20
Don't patch bad code, rewrite it.
-- Kernigham and Pike, according to Rusty
