From: Marcus Tangermann <Marcus.Tangermann@web.de>
Subject: Alignment on XScale ARM
Date: Fri, 07 Nov 2008 23:52:29 +0100
Message-ID: <1733787858@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded@vger.kernel.org

Hi,

we use an XScale 422 (ARM) with a big endian Linux system based on the =
buildroot environment. It seems there is an alignment problem we have. =
I've tracked down the problem to the following.=20
1. The data received via a netlink communication from the kernel is sto=
red into a buffer buf. The data is correct.
2. The address of the buffer is converted to a pointer to nlmsghdr:
         struct nlmsghdr *h;
         h =3D (struct nlmsghdr*) buf;=20
         printf("IPSECTOOLS: Length  %04d\n", h->nlmsg_len);
         printf("IPSECTOOLS: Type %02d\n", h->nlmsg_type);
   The results of printf are nonsens. The first fields seem to have an =
offset of 2 bytes, at the end there also seem to be swapped bytes.
3. To test what might happen, I've created an own struct
       struct aligntest{
                __u32 first;
                __u32 int second;
                __u32 third;
                __u32 fourth;
       };
     When you now set a point to a buffer, again the values are wrong:
         s1 =3D (struct aligntest*) buf;
         printf("1: %08X\n", s1->first);
         printf("2: %08X\n", s1->second);
         printf("3: %08X\n", s1->third);
         printf("4: %08X\n", s1->fourth);

It seems, that there is a problem with the unsigned int values. When yo=
u add the attribute "packed" to the definition of struct aligntest ( __=
attribute__(__packed__) ), all values are displayed correctly.=20
So, any hints what the problem can be?

Regards
Marcus
____________________________________________________________________
Psssst! Schon vom neuen WEB.DE MultiMessenger geh=F6rt?=20
Der kann`s mit allen: http://www.produkte.web.de/messenger/?did=3D3123
