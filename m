From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 7/7] printk: provide a filtering macro for printk
Date: Thu, 10 Sep 2009 11:22:10 +0200 (CEST)
Message-ID: <alpine.LRH.2.00.0909101118420.31704@vixen.sonytel.be>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org> <1251844269-12394-8-git-send-email-mat@brain-dump.org> <4A9DAD2B.3080909@am.sony.com> <BD79186B4FD85F4B8E60E381CAEE190901C55CD3@mi8nycmail19.Mi8.com> <20090902130943.GE2736@debbook.brain-dump.org>
 <4A9EA5C9.3010900@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754575AbZIJJWG@vger.kernel.org>
In-Reply-To: <4A9EA5C9.3010900@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Marc Andre Tanner <mat@brain-dump.org>, H Hartley Sweeten <hartleys@visionengravers.com>, linux-embedded@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, linux kernel <linux-kernel@vger.kernel.org>

On Wed, 2 Sep 2009, Tim Bird wrote:
> Marc Andre Tanner wrote:
> > On Tue, Sep 01, 2009 at 07:32:25PM -0400, H Hartley Sweeten wrote:
> >> On Tuesday, September 01, 2009 4:24 PM, Tim Bird wrote:
> >>> Some places in the kernel break the message into pieces, like so:
> >>>
> >>> printk(KERN_ERR, "Error: first part ");
> >>> ...
> >>> printk(" more info for error.\n");
> >> Technically, shouldn't the second part of the message actually be:
> >>
> >> printk(KERN_CONT " more info for error.\n");
> >>
> >> Maybe some mechanism could be created to handle the continued mess=
age
> >> if they have the KERN_CONT?
> >=20
> > Yes it's true that KERN_CONT isn't handled correctly, but I don't s=
ee a way
> > to change that.
> >=20
> >>> These parts would not be handled consistently under certain
> >>> conditions.
> >>>
> >>> It would be confusing to see only part of the message,
> >>> but I don't know how often this construct is used. =20
> >=20
> > $ grep -R KERN_CONT linux-2.6 | wc -l
> > 373
> >=20
> >>> Maybe
> >>> another mechanism is needed to ensure that continuation
> >>> printk lines have the same log level as their start strings.
> >=20
> > I currently don't see a way to achieve this with the CPP.
>=20
> If it's that few, then maybe it's OK to actually change
> the code for those printk statements. (Heck, these locations
> were all changed in the last 2 years anyway.)
>=20
> I'm just brainstorming here, but how about changing them from:
>   printk(KERN_INFO "foo");
>   printk(KERN_CONT "bar\n");
> to:
>   printk(KERN_INFO "foo");
>   printk_cont(KERN_INFO "bar\n");
>=20
> This way the continuation line has the log level, and can
> be conditionally compiled based on the VERBOSITY level.  A little
> magic would be needed to strip the first 3 chars of the fmt
> string in printk_cont().

You could strip the first 3 chars by adding 3 to the pointer. Which wil=
l
fail horribly if the KERN_* is forgotten and the format string is very =
short.
And the KERN_* still consumes memory.

Or make the KERN_* an explicit first parameter:

    printk_cont(KERN_INFO, "bar\n");

Is "strcmp(p, KERN_INFO)" optimized away for constant strings?

> I think this makes the printk messages a bit more consistent anyway,
> and still marks lines that are continuation lines.

With kind regards,

Geert Uytterhoeven
Software Architect
Techsoft Centre

Technology and Software Centre Europe
The Corporate Village =C2=B7 Da Vincilaan 7-D1 =C2=B7 B-1935 Zaventem =C2=
=B7 Belgium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =C2=B7 RPR Brussels
=46ortis =C2=B7 BIC GEBABEBB =C2=B7 IBAN BE41293037680010
