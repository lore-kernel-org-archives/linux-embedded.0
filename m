From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Embedded Linux Boot Time Poll
Date: Thu, 21 Oct 2010 21:57:10 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1010212054590.2764@xanadu.home>
References: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_/ImKxaPWpTf8FLZaaSYy2Q)"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Andrew Murray <amurray@mpcdata.com>
Cc: linux-embedded@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_/ImKxaPWpTf8FLZaaSYy2Q)
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Oct 2010, Andrew Murray wrote:

> Hello,
>=20
> I'm performing some research [for a CELF presentation] into reducing
> boot time on embedded systems and would like to see if the=A0embedded
> community agree with the following statement as to why Linux
> [arguably] takes so long in the first place for an unoptimised system:
>=20
> "Linux is general purpose,=A0convenient=A0and flexible. As it's general
> purpose it's=A0likely=A0to contain un-required=A0functionality which resu=
lts
> in more initialisation and a larger image size. As it's=A0convenient=A0and
> flexible it will spent time discovering devices and=A0verifying=A0their
> existence."
>=20
> Do you largely agree or disagree?

I agree with the above, as long as the "unoptimized" keyword is also=20
included in that statement.  By nature, embedded systems are normally=20
well defined and the kernel build configuration options are sufficiently=20
detailed so that a highly optimized kernel with only the=20
required=A0functionalities can be easily produced.

> Also do you believe that boot time isn't the highest priority when it
> comes to improving the kernel?

Well, I don't think the kernel itself needs to be much improved for boot=20
time.  This is more a system design issue nowadays i.e. optimizing the=20
kernel configuration, proper partitioning of drivers between modules and=20
built-in, selection of a storage media for the kernel image to boot,=20
bootloader optimizations, user space optimizations, etc.  It is well=20
possible to achieve a short kernel boot to start interaction with the=20
user quickly, and postpone the probing of peripherals such as USB=20
devices in the background only when user space is started.

That also depends on what your definition of "boot time" is.  Is it the=20
time from power up to the moment when user space starts executing?  Or=20
is it the time before the system is fully operational?  And what is the=20
meaning of "fully operational"?  Is it when the display is working and=20
user input is possible, or is it when network connectivity is fully=20
established?  And even then, does "network connectivity fully=20
established" mean that the link is up with an IP address, or does this=20
mean that you are connected to a specific application server or a=20
particular web site with the required data downloaded?  This is not as=20
straight forward as it may seem.

If boot time is only the time required for user space to start=20
executing, then on some embedded system this can be made to work in less=20
than a second.  Is this criterion (from power up to user space) useful? =20
That depends on the application.


Nicolas








>=20
> Thanks,
>=20
> Andrew Murray
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--Boundary_(ID_/ImKxaPWpTf8FLZaaSYy2Q)--
