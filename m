From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Recommendation for activating a deferred module init in the
	kernel
Date: Wed, 18 Jun 2008 09:32:07 +0100
Message-ID: <1213777927.26255.1168.camel@pmac.infradead.org>
References: <4858AF6D.7040808@codefidence.com>
	 <1213777222.26255.1161.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1213777222.26255.1161.camel@pmac.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Gilad Ben-Yossef <gilad@codefidence.com>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wed, 2008-06-18 at 09:20 +0100, David Woodhouse wrote:
> So the only real reason I can see to avoid modules in the _current_
> kernel would be the wasted RAM, which should be something we can
> address. Tim, have I missed something?=20

=2E.. like the time it takes to actually load modules and do the
relocations, perhaps? You did say you were doing it to improve boot
time. But this is the stuff you were happy to _defer_, so presumably no=
t
in your fast path?

If that _is_ a real concern, then given the observation=C2=B9 that most
systems load exactly the same modules in exactly the same order every
time they boot... has anyone looked at doing 'prelink' for modules?=20

--=20
dwmw2

=C2=B9 which I just pulled out of my arse, admittedly. But I think it's=
 true :)

--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
