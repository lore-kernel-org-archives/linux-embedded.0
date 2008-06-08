From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: YAFFS in the kernel tree?
Date: Sun, 8 Jun 2008 14:16:27 +0200
Message-ID: <20080608121626.GC13200@logfs.org>
References: <200805290859.54396.manningc2@actrix.gen.nz> <f19298770805281515u1602e18enbad78fccfda24b02@mail.gmail.com> <m2zlpw2lrl.fsf@ohwell.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <m2zlpw2lrl.fsf@ohwell.denx.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Detlev Zundel <dzu@denx.de>
Cc: Alexey Zaytsev <alexey.zaytsev@gmail.com>, Charles Manning <manningc2@actrix.gen.nz>, linux-embedded@vger.kernel.org

On Sun, 8 June 2008 13:45:18 +0200, Detlev Zundel wrote:
>=20
> Sorry for jumping in here late, but git should be pretty good about
> finding differences itself.  If you can revers-apply the previous
> version patch, then apply the current version and git commit, it shou=
ld
> yield much more useful information.

Doesn't work too well, if the git version is different from the
out-of-tree version, because of something like version checks.

What might work is to keep developing the git tree, extract a patch fro=
m
that, have a second patch with version checks, etc. and combinediff
those two.

J=C3=B6rn

--=20
=46ancy algorithms are slow when n is small, and n is usually small.
=46ancy algorithms have big constants. Until you know that n is
frequently going to be big, don't get fancy.
-- Rob Pike
--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
