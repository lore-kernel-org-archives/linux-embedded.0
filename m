From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: how to increase memory limit reduced at boot-time by "mem"
Date: Fri, 24 Sep 2010 17:42:47 +0200
Message-ID: <AANLkTik6htZjfLPnSaSk0bdA0sYyHL4qBEu-2HXpZmh7@mail.gmail.com>
References: <4C96B77D.3040509@lougher.demon.co.uk>
	<9E0336F52EEC16458D081AA4C618AD8F5B6DE4@VIECLEX02.frequentis.frq>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=fQuHbvCAarehpQ3AoxmyscJo5ejefZMuh7upoWYy9bE=;
        b=by4AFkaq/Sk7Tc5YulRjTH5Rq+DdzoRqU9Rf/9XcTRmSec47GmL/mqwTnu1Rh0g6fZ
         uMlBevJt0CuyF0KOwim9ppYQ5tqLKaNTELiaflvIIn35nuxwRZ36gYJ1+v5K2vh6WEQd
         46GD/ZO9TDDrClt4aE3mBglPB4JCq7/BAjSZ8=
In-Reply-To: <9E0336F52EEC16458D081AA4C618AD8F5B6DE4@VIECLEX02.frequentis.frq>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: CEVAN Ondrej <Ondrej.CEVAN@frequentis.com>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Fri, Sep 24, 2010 at 14:30, CEVAN Ondrej <Ondrej.CEVAN@frequentis.co=
m> wrote:
> If the upper memory limit is reduced at booting by using the kernel c=
ommand
> line parameter "mem" is there a way how this memory limit could be in=
creased
> at some later point of kernel execution? In other words, if I exclude=
 the
> upper part of system memory from kernel's use at boot time, can I rec=
laim it
> back at some later point?
>
> Particularly I am interested if this would work on the PowerPC and AR=
M
> architecture, or is it not architecture depending?

You can use memory hotplugging to add the memory later.
As this has been used on e.g. PS3, it should work on PowerPC.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
