From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: New fast(?)-boot results on ARM
Date: Fri, 14 Aug 2009 20:58:52 +0200
Message-ID: <20090814185852.GO13320@pengutronix.de>
References: <20090814170228.GM13320@pengutronix.de> <4A85AAC4.7050505@acm.org> <20090814184651.GA12021@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090814184651.GA12021@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jamie Lokier <jamie@shareable.org>
Cc: Zan Lynx <zlynx@acm.org>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

On Fri, Aug 14, 2009 at 07:46:51PM +0100, Jamie Lokier wrote:
> Zan Lynx wrote:
> > Or maybe its cheap and slow flash. In that case I think your only
> > hope is to make all the code as small as possible and/or find a
> > different flash filesystem that does not have to read so much of th=
e
> > device to mount. Perhaps use a read-only compressed filesystem for
> > the system binaries and reflash it for software upgrades. Only init
> > and mount the writable flash for user-storable data well after
> > system boot has finished.
>
> Fwiw, logfs claims to mount quickly, but I haven't heard much about i=
t
> in recent months and http://logfs.org/logfs/ implies it's not really
> stable yet. But maybe if you're working on a prototype that doesn't
> matter so much.

Is logfs ready for production in the meantime? Last time I checked it
was still more or less J=F6rn's pet project and ubifs seemed much more
mature.

rsc
--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
