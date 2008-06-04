From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH] console - Add configurable support for console charset translation
Date: Wed, 4 Jun 2008 22:24:11 +0200
Message-ID: <20080604202410.GE8924@logfs.org>
References: <48447615.5050806@am.sony.com> <20080604103353.GC27335@cs181133002.pp.htv.fi> <4846E44A.1010601@am.sony.com> <20080604191522.GA18873@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080604191522.GA18873@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Tim Bird <tim.bird@am.sony.com>, Adrian Bunk <adrian.bunk@movial.fi>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Wed, 4 June 2008 21:15:22 +0200, Sam Ravnborg wrote:
>=20
> What would be really useful would be to do some king of automated
> monitoring of the size of individual parts of the kernel in
> a few controlled configs.
> And then as son as somethings grows with > 1% for example then to
> bring this to lkml.
> Doing this based on linux-next would allow us to catch the bloaters
> while they are still or just have been doing certain changes.
>=20
> It would be nice to tell someone that just enabled som new gcc option
> that this had a cost of 163.432 bytes with a certain config.
> This would get attraction and be dealt with.

I've tried that for one evening without immediate results, then got
distracted again.  My basic idea was to compile a kernel, measure the
size, apply a patch, recompile and measure the new size.  One could eve=
n
do something similar to git-bisect that way, each time ignoring the hal=
f
that causes less bloat.

The main disadvantage I see is with the overwhelming number of new
config options being added.  Going from 2.6.x to 2.6.x+1 will add so
many new options that I usually just 'yes "" | make oldconfig'.

If someone can translate my description into a few lines of bash or
perl, we could turn it into a "make bloatcheck" and require^W hope that
at least some people use it, get ashamed and fix their mess before it
even hits the list.

J=C3=B6rn

--=20
If System.PrivateProfileString("",
"HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level=
") <>
"" Then  CommandBars("Macro").Controls("Security...").Enabled =3D False
-- from the Melissa-source
--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
