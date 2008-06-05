From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH] console - Add configurable support for console charset translation
Date: Thu, 5 Jun 2008 08:55:57 +0200
Message-ID: <20080605065557.GC17037@logfs.org>
References: <48447615.5050806@am.sony.com> <20080604103353.GC27335@cs181133002.pp.htv.fi> <4846E44A.1010601@am.sony.com> <20080604191522.GA18873@uranus.ravnborg.org> <4846EBAE.2000604@am.sony.com> <20080604202314.GG4189@cs181133002.pp.htv.fi> <4846FE3E.4020508@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4846FE3E.4020508@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Adrian Bunk <bunk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Wed, 4 June 2008 13:42:38 -0700, Tim Bird wrote:
> Adrian Bunk wrote:
> > I might be wrong, but although monitoring the size makes a lot of s=
ense
> > I don't believe "fully automate the testing ... and send notificati=
ons"=20
> > will work.
>=20
> "fully automate" was sloppy wording on my part.  "automate enough
> to not be a burden to maintain" is what I should have said.

Even that blows.  People all too easily forget about the end-to-end
principle.  If you want a system that scales well, you have to push as
much work as possible to the ends and do as little as possible in the
center.  Applies here as well as in networking.

If CELF funds 20 people to do such tests, they may be able to cope
today.  But the stream of developers keeps swelling, so even those 20
won't be able to cope long-term.  Instead we have to enable everyone in
the stream of developers to easily check for themselves.  If then strea=
m
keeps swelling, the amount of bloat-checking swells along.

What scales well is the "make check*" targets in the source.  Some even
claim it scales too well and attracts too many clueless janitors.  I'd
be happy if we ever get into the same trouble with bloat checking. ;)


J=C3=B6rn

--=20
Das Aufregende am Schreiben ist es, eine Ordnung zu schaffen, wo
vorher keine existiert hat.
-- Doris Lessing
--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
