From: Christophe Aeschlimann <c.aeschlimann@acn-group.ch>
Subject: Re: Q: file system for embedded
Date: Thu, 14 Jun 2012 16:48:57 +0200
Message-ID: <4FD9F9D9.7080101@acn-group.ch>
References: <CAJ2oMh++ji7YBrx6UcLdhPVDmLuTZCr8kGQR8aEAYWyob_ccBQ@mail.gmail.com> <CAJ2oMhLpMJZ_UT1Z+12s7=5hGjRbA9WNvv3CU4m9B2rDp9yr3Q@mail.gmail.com> <4FD9A22B.7060207@acn-group.ch> <CAJ2oMhKB6684j2_ZzRopCxipnUnuu9GbACCMg08OsHBJ7u6=_g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CAJ2oMhKB6684j2_ZzRopCxipnUnuu9GbACCMg08OsHBJ7u6=_g@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ran Shalit <ranshalit@gmail.com>
Cc: linux-embedded@vger.kernel.org

Le 14.06.2012 14:58, Ran Shalit a =E9crit :

=20
> Hi Christophe,
>=20
> Thanks for the reply.
> I have no need to write to flash during the main application
> execution: I will program the configuration and executable before
> start of execution, and after initialization there is no need to writ=
e
> again to flash.


How are you going to program the flash ? Which initialization ?

> What I still do not understand is why cramfs, ubifs are recommended
> for embedded if they access the flash.


=46or the reasons I gave in my previous email. I never used cramfs but =
I
see that it is a read-only compressed format (like supported in JFFS2)
which decompresses your data on-the-fly before read/execution hence
allowing to store more information if your flash is small.

> Is accessing the flash not a problem in embedded linux ?=20

I'm not sure what you mean here. It's not a problem, but it requires
some care.

> What does it mean using mlockall with cramfs ?


Well if you don't have swap enabled mlockall has no effect since there
is nowhere to swap anyway. But I'm not sure I understand your question.

> Regards, Ran


Regards,

--=20
Christophe Aeschlimann

Embedded Software Engineer & IT Manager
ACN Advanced Communications Networks S.A.
2000 - Neuch=E2tel, Switzerland
Tel. +41 32 724 74 31
