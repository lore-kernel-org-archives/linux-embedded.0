From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Tue, 23 Jun 2009 22:15:42 +0100
Message-ID: <1245791743.25547.3517.camel@macbook.infradead.org>
References: <4A33A7EC.6070008@gmail.com> <200906221317.04166.arnd@arndb.de>
	 <4A3FC7F1.5050108@gmail.com> <200906222033.20883.arnd@arndb.de>
	 <4A3FDBFE.8050509@2net.co.uk> <20090622203034.GA12587@uranus.ravnborg.org>
	 <4A3FFF17.9020701@am.sony.com> <20090623042106.GA17159@uranus.ravnborg.org>
	 <4A411319.4020108@gmail.com>  <20090623192648.GB23119@logfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090623192648.GB23119@logfs.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
Cc: Marco <marco.stornelli@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Tim Bird <tim.bird@am.sony.com>, Chris Simmonds <chris@2net.co.uk>, Arnd Bergmann <arnd@arndb.de>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Tue, 2009-06-23 at 21:26 +0200, J=C3=B6rn Engel wrote:
> Endianness is a
> different case imo.  dd may not work, but a jtag probe will happily g=
et
> you the dump to your development machine.

And dd on /dev/mem would work, surely?

I'd definitely recommend making it fixed-endian. Not doing so for JFFS2
was a mistake I frequently regretted.

--=20
David Woodhouse                            Open Source Technology Centr=
e
David.Woodhouse@intel.com                              Intel Corporatio=
n
