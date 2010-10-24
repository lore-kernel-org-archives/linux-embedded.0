From: Andrew Murray <amurray@mpcdata.com>
Subject: Re: Embedded Linux Boot Time Poll
Date: Sun, 24 Oct 2010 17:01:16 +0100
Message-ID: <AANLkTin6d28BP_THD+yJgc3fvPBnrhNCJHUbkXRKJhuA@mail.gmail.com>
References: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded@vger.kernel.org

Hi,

Thanks all for your very valuable input. This seems to be an
interesting topic that generates a lot of interest!

I've updated my statement - does this reflect your views?

"Given an unoptimised system based on embedded Linux with a clearly
defined purpose - The amount of boot time it takes to reach that
required state of functionality can be reduced by specialising the
software stack to those needs. Specialisation may involve
removing/deferring unrequired functionality/support and optimising
required functionality."

I've emphasised the focus of the statement to refer to a Linux based
system and so by doing this optimisation then refers to the system as
a whole including bootloaders, choice of filesystems, user space
initialisation, etc.

I've also defined boot time as the amount of time required to reach a
useful state of functionality - in other words meeting only the needs
of the application which provides the products purpose.

By remove functionality/support - I mean removing support for device
drivers not required and also removing unused functionality (which may
be things like removing kallsyms, ipautoconfig, printk support, etc).
And by 'optimise required functionality' - I think this can have a
broad meaning and include system design decisions such as how
userspace is initialised - e.g. the app could be the init process,
optimising flash timings, using a more optimal filesystem, removing
probes (if you know the hardware will always been there), etc.

And I've tried to use relative terms rather than absolute terms - so
the comparison is against an unoptimised system (e.g. perhaps a
customer has a pre-provided BSP and they have little knowledge of how
to optimise it and remove things via KConfig etc).

Thanks,

Andrew Murray

On 22 October 2010 00:20, Andrew Murray <amurray@mpcdata.com> wrote:
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
>



--=20
Andrew Murray, Embedded Linux Group
MPC Data Limited
e-mail: amurray@mpc-data.co.uk=A0 web: www.mpc-data.co.uk
tel: +44 (0) 1225 710600=A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 fax: +44 (0) 122=
5 710601
ddi: +44 (0) 1225 710665

MPC Data Limited is a company registered in England and Wales with
company number 05507446
Registered Address: County Gate, County Way, Trowbridge, Wiltshire, BA1=
4 7FJ
VAT no: 850625238

The information in this email and in the attached documents is
confidential and may be
legally privileged. Any unauthorized review, copying, disclosure or
distribution is
prohibited and may be unlawful. It is intended solely for the
addressee. Access to this
email by anyone else is unauthorized. If you are not the intended
recipient, please
contact the sender by reply email and destroy all copies of the
original message. When
addressed to our clients any opinions or advice contained in this
email is subject to
the terms and conditions expressed in the governing contract.
