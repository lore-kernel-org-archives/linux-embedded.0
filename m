From: Andrew Murray <amurray@mpcdata.com>
Subject: Embedded Linux Boot Time Poll
Date: Fri, 22 Oct 2010 00:20:50 +0100
Message-ID: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded@vger.kernel.org

Hello,

I'm performing some research [for a CELF presentation] into reducing
boot time on embedded systems and would like to see if the=A0embedded
community agree with the following statement as to why Linux
[arguably] takes so long in the first place for an unoptimised system:

"Linux is general purpose,=A0convenient=A0and flexible. As it's general
purpose it's=A0likely=A0to contain un-required=A0functionality which re=
sults
in more initialisation and a larger image size. As it's=A0convenient=A0=
and
flexible it will spent time discovering devices and=A0verifying=A0their
existence."

Do you largely agree or disagree?
Also do you believe that boot time isn't the highest priority when it
comes to improving the kernel?

Thanks,

Andrew Murray
