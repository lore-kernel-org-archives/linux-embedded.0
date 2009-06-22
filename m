From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Mon, 22 Jun 2009 23:20:39 +0100
Message-ID: <1245709239.25547.394.camel@macbook.infradead.org>
References: <4A33A7EC.6070008@gmail.com> <200906221317.04166.arnd@arndb.de>
	 <4A3FC7F1.5050108@gmail.com> <200906222033.20883.arnd@arndb.de>
	 <4A3FDBFE.8050509@2net.co.uk>  <20090622214155.GA19332@logfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20090622214155.GA19332@logfs.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Cc: Chris Simmonds <chris@2net.co.uk>, Arnd Bergmann <arnd@arndb.de>, Marco <marco.stornelli@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Mon, 2009-06-22 at 23:41 +0200, J=C3=B6rn Engel wrote:
> Four loops doing the same increment with different data types: long,
> u64, we32 (wrong-endian) and we64.  Compile with _no_ optimizations.

That's a bit of a poor test then. Especially on architectures with a
load-and-swap instruction where it really shouldn't be any slower at
all.

(Although since GCC doesn't have an __attribute__((littleendian)) I'm
not entirely sure how to entice it into _using_ said instruction for th=
e
purpose of the test... I think the kernel does manage somehow though, i=
f
you get the sources _just_ right.)

--=20
David Woodhouse                            Open Source Technology Centr=
e
David.Woodhouse@intel.com                              Intel Corporatio=
n

--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
