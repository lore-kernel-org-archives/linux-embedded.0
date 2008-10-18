From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Power cut in management
Date: Sat, 18 Oct 2008 14:31:23 +0100
Message-ID: <1224336683.6770.1364.camel@macbook.infradead.org>
References: <4917.79.37.233.237.1224328849.squirrel@nausicaa2.coritel.it>
	 <20081018114910.GA29345@shareable.org>
	 <1224331493.6770.1360.camel@macbook.infradead.org>
	 <20081018125621.GA30391@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081018125621.GA30391@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jamie Lokier <jamie@shareable.org>
Cc: marco.stornelli@coritel.it, linux-embedded@vger.kernel.org

On Sat, 2008-10-18 at 13:56 +0100, Jamie Lokier wrote:
> Trouble is, that's not suitable for a dashboard unit where users plug
> in their own media card.
>=20
> Marco didn't say if the SD card is for users to plug in their own
> media, or if it's internal storage for the device.

True, but the situation is different for a removable card. Firstly, it'=
s
unlikely to be mission-critical; the device will still operate without
it. Secondly, even the most na=C3=AFve of users knows that these things=
 are
disposable.

It's different if you're building a black box around them, with one of
these things inside.

--=20
David Woodhouse                            Open Source Technology Centr=
e
David.Woodhouse@intel.com                              Intel Corporatio=
n
