From: alucero@os3sl.com
Subject: Re: Embedded Linux Boot Time Poll
Date: Fri, 22 Oct 2010 17:01:24 +0200
Message-ID: <20101022170124.xxp8pt5z9c48g8cg@webmail.os3sl.com>
References: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes	format=flowed"
To: linux-embedded@vger.kernel.org

Hi Andy,

Talking about boot time with Linux needs to cover how user space =20
initialization is done. I'm talking about init runlevels and all of =20
this inherited functionality from System V. This is a software issue =20
and although it worked fine for years in servers and desktop systems, =20
it is not the right option for embedded systems dedicated to final =20
users like mobile phones, cameras, minilaptos, tablets, ... .

As you probably know, there are people working in this specific part =20
trying to improve the way Linux is doing this things like avoiding =20
shell scripts as much as possible and doing things in parallel when =20
dependencies do not exist.

By other hand, some embedded systems, those gaining main attention, =20
are clearly closer to generic purpose Linux systems as we know them =20
and it will be even more difuse in the close future. But generic =20
purpose and boot time reduction should not be incompatible.


Andrew Murray <amurray@mpcdata.com> ha escrito:

> Hello,
>
> I'm performing some research [for a CELF presentation] into reducing
> boot time on embedded systems and would like to see if the=A0embedded
> community agree with the following statement as to why Linux
> [arguably] takes so long in the first place for an unoptimised system=
:
>
> "Linux is general purpose,=A0convenient=A0and flexible. As it's gener=
al
> purpose it's=A0likely=A0to contain un-required=A0functionality which =
results
> in more initialisation and a larger image size. As it's=A0convenient=A0=
and
> flexible it will spent time discovering devices and=A0verifying=A0the=
ir
> existence."
>
> Do you largely agree or disagree?
> Also do you believe that boot time isn't the highest priority when it
> comes to improving the kernel?
>
> Thanks,
>
> Andrew Murray
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embed=
ded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

