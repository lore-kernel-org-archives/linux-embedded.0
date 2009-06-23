From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Tue, 23 Jun 2009 21:26:49 +0200
Message-ID: <20090623192648.GB23119@logfs.org>
References: <4A33A7EC.6070008@gmail.com> <200906221317.04166.arnd@arndb.de> <4A3FC7F1.5050108@gmail.com> <200906222033.20883.arnd@arndb.de> <4A3FDBFE.8050509@2net.co.uk> <20090622203034.GA12587@uranus.ravnborg.org> <4A3FFF17.9020701@am.sony.com> <20090623042106.GA17159@uranus.ravnborg.org> <4A411319.4020108@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A411319.4020108@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marco <marco.stornelli@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Tim Bird <tim.bird@am.sony.com>, Chris Simmonds <chris@2net.co.uk>, Arnd Bergmann <arnd@arndb.de>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Tue, 23 June 2009 19:38:33 +0200, Marco wrote:
>=20
> dd? You haven't got any device file to have a dump. I think we're goi=
ng
> a bit out of scope. I had some doubt to support rootfs in pram and af=
ter
> some feedback and the comments of this review I think I'll remove it
> from the next release (to understand some aspects of this fs with the
> kernel community was my main goal for this review). I agree to use th=
e
> native endian. As I said the important thing is that if an user want =
to
> use it in a 64bit environment then the fs must work well and then it
> must be designed to support even this situation, I think it's obvious=
=2E

Glancing at the discussion with Pawel, I see two paths to follow.  One
is to turn pramfs into a full-features all-round general-purpose
filesystem with mkfs, fsck, xattr and any number of additional features=
=2E
That way lies doom, as you would compete against ext2+xip and have
little new to offer.

The other path is to make/keep pramfs as simple as possible for
comparatively specialized purposes, like flight recorder data and dump
information.  Main selling point here is the amount of vulnerable code
in the total package.  ext2 + block layer + vfs helpers is relatively
large and many things may go wrong in a panic situation.

So I agree with you that many things expected from general purpose
filesystems simply don't apply to pramfs.  Moving mkfs into the kernel
is a fair tradeoff, when the required code is small.  Endianness is a
different case imo.  dd may not work, but a jtag probe will happily get
you the dump to your development machine.

And even within the same box you can have more than one architecture an=
d
endianness.  http://www.top500.org/system/9707 will show you one such
beast, which happens to have the top bragging rights at the moment.  I
don't want to endorse such strange beasts, but there is no good reason
not to support reading the ppc-written fs from the opteron.  In fact,
there is no reason full stop.

J=C3=B6rn

--=20
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
