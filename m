From: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 02 Jan 2009 17:04:08 +0100
Message-ID: <495E3AF8.6000006@parrot.com>
References: <200901020207.30359.rob@landley.net> <200901021026.37905.a.miskiewicz@gmail.com> <200901020513.19593.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757211AbZABQE1@vger.kernel.org>
In-Reply-To: <200901020513.19593.rob@landley.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Landley <rob@landley.net>
Cc: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

Rob Landley a =C3=A9crit :
> On Friday 02 January 2009 03:26:37 Arkadiusz Miskiewicz wrote:
>> On Friday 02 of January 2009, Rob Landley wrote:
>>
>> Heh,
>=20
> I believe all three scripts run under dash and busybox ash.  (The tim=
econst.sh=20
> one needs 64 bit math which dash only provides on 64 bit hosts, which=
 is a=20
> regression from Red Hat 9 in 2003 by the way.
With dash 0.5.4-12 (from debian sid), I seems I got the 64 bit math for
32 bit hosts :
$ uname -m
i686
$ dash -c 'echo $((1<<32))'
4294967296


Matthieu
