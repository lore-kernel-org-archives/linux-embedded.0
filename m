From: Marcus Tangermann <Marcus.Tangermann@web.de>
Subject: Re: Alignment on XScale ARM
Date: Sat, 08 Nov 2008 19:37:17 +0100
Message-ID: <1734891834@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded@vger.kernel.org

Hello,

due to your hints I've found a solution. The problem was simple: The bu=
ffer was not word aligned as the Xscale requires.=20
With
char buffer[8192] __attribute__((aligned(4)));
things are working.  Sometimes you don't see the wood for the trees.
So thanks to all for the good hints!

Marcus

> -----Urspr=FCngliche Nachricht-----
> Von: "Marcus Tangermann" <Marcus.Tangermann@web.de>
> Gesendet: 07.11.08 23:52:43
> An: linux-embedded@vger.kernel.org
> Betreff: Alignment on XScale ARM

> Hi,
>=20
> we use an XScale 422 (ARM) with a big endian Linux system based on th=
e buildroot environment. It seems there is an alignment problem we have=
=2E I've tracked down the problem to the following.=20
> 1. The data received via a netlink communication from the kernel is s=
tored into a buffer buf. The data is correct.
> 2. The address of the buffer is converted to a pointer to nlmsghdr:
>          struct nlmsghdr *h;
>          h =3D (struct nlmsghdr*) buf;=20
>          printf("IPSECTOOLS: Length  %04d\n", h->nlmsg_len);
>          printf("IPSECTOOLS: Type %02d\n", h->nlmsg_type);
>    The results of printf are nonsens. The first fields seem to have a=
n offset of 2 bytes, at the end there also seem to be swapped bytes.
> 3. To test what might happen, I've created an own struct
>        struct aligntest{
>                 __u32 first;
>                 __u32 int second;
>                 __u32 third;
>                 __u32 fourth;
>        };
>      When you now set a point to a buffer, again the values are wrong=
:
>          s1 =3D (struct aligntest*) buf;
>          printf("1: %08X\n", s1->first);
>          printf("2: %08X\n", s1->second);
>          printf("3: %08X\n", s1->third);
>          printf("4: %08X\n", s1->fourth);
>=20
> It seems, that there is a problem with the unsigned int values. When =
you add the attribute "packed" to the definition of struct aligntest ( =
__attribute__(__packed__) ), all values are displayed correctly.=20
> So, any hints what the problem can be?
>=20
> Regards
> Marcus
> ____________________________________________________________________
> Psssst! Schon vom neuen WEB.DE MultiMessenger geh=F6rt?=20
> Der kann`s mit allen: http://www.produkte.web.de/messenger/?did=3D312=
3
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embed=
ded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20


__________________________________________________________________
"Run, Fatboy, Run" sowie "Rails & Ties" kostenlos anschauen!
Blockbuster-Gutscheine sichern unter http://www.blockbuster.web.de
