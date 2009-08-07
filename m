From: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 4/6] Add support for LZO-compressed kernels for ARM
Date: Fri, 7 Aug 2009 15:27:00 +0200
Message-ID: <4A7C2BA4.7030408@parrot.com>
References: <20090731093107.GA29704@merkur.ravnborg.org> <1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-4-git-send-email-albin.tonnerre@free-electrons.com> <20090806224055.GH31579@n2100.arm.linux.org.uk> <20090807092423.GA4455@laptop> <4A7BF5B8.4030907@knaff.lu> <20090807102117.GB4455@laptop> <4A7C14EB.1060701@parrot.com> <20090807130130.GE4455@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756644AbZHGN1G@vger.kernel.org>
In-Reply-To: <20090807130130.GE4455@laptop>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Cc: Alain Knaff <alain@knaff.lu>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "sam@ravnborg.org" <sam@ravnborg.org>, "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

Albin Tonnerre a =E9crit :
> On Fri, Aug 07, 2009 at 01:50:03PM +0200, Matthieu CASTET wrote :
>> Albin Tonnerre a =E9crit :
>>> On Fri, Aug 07, 2009 at 11:36:56AM +0200, Alain Knaff wrote :
>>>> On 08/07/09 11:24, Albin Tonnerre wrote:
>=20
>>>>> Regards,
>=20
>>>> Could it be that the patches that remove division (zutil.h and inf=
late.c)
>>>> have somehow not been applied?
>=20
>>> Indeed, they've not been applied. However, I'd rather try to unders=
tand why
>>> exactly this is an issue when compiling with -Os and not -O2 instea=
d of working
>>> around it by removing the divisions.
>=20
>> Look at the generated code.
>=20
>> Arm doesn't have division instruction.
>> May be at -Os gcc emit a call to the software division, but at -O2 i=
t
>> manage to optimise the division (transform it in shift, inline some
>> builtin, ...).
>=20
> Yes, I figured that out. What I don't get, though, is that it fails w=
hile the
> software division symbol (__aeabi_uidivmod here) does seem to be prov=
ided by
> libgcc.
>=20
AFAIK we don't link the kernel with libgcc.
That's why the kernel provide __aeabi_* in arch/arm/lib
