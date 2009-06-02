From: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
Subject: Re: Representing Embedded Architectures at the Kernel Summit
Date: Tue, 2 Jun 2009 23:18:04 +0200
Message-ID: <10f740e80906021418i1d58f5eer940e7a8ec9fb8b9e__10126.220729626$1243977499$gmane$org@mail.gmail.com>
References: <1243956140.4229.25.camel@mulgrave.int.hansenpartnership.com>
	 <fa686aa40906021029macf3c72g5261f8d4dbea935a@mail.gmail.com>
	 <20090602211057.GA10800@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=xQ3AE/+xYx/PrAwsqIzCVdrsHnsnm2KKapbKlcOe2F4=;
        b=EXJ6b72hPZJGGncpo6bXQavOYI1IlpTgQoLgpZpR7omLAT7BoMhQogMMVHS1prHeuq
         t/ildC0cQt/pUWtyBB2bEQRfqdgHZ6wpVDTfcvix8LCdvUYYg3NMh5esHgDDpEAmR+ZB
         g0kHKUr8vNRm5UK4qwbFUjpK2R7d1TpdJg/rE=
In-Reply-To: <20090602211057.GA10800@flint.arm.linux.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Grant Likely <grant.likely@secretlab.ca>, James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit-2009-discuss@lists.linux-foundation.org, linux-arch@vger.kernel.org, linux-e

On Tue, Jun 2, 2009 at 23:10, Russell King <rmk@arm.linux.org.uk> wrote=
:
> On Tue, Jun 02, 2009 at 11:29:46AM -0600, Grant Likely wrote:
>> Embedded PowerPC and Microblaze has tackled this problem with the
>> "Flattened Device Tree" data format which is derived from the
>> OpenFirmware specifications, and there is some interest and debate (=
as
>> discussed recently on the ARM mailing list) about making flattened
>> device tree usable by ARM also (which I'm currently
>> proof-of-concepting).
>
> Note that I have to point out that ARM will probably never be in a
> situation where you can have a one kernel image boots on everything.
> That _is_ practical today (and does happen with all PXA now) with wha=
t
> we have within a very big restriction - which is that the kernel must
> be built to support PXA and not Atmel SoCs.
>
> I really don't think combining SoC support is going to be realistic,
> device tree or not. =C2=A0When we had just four machine types (RiscPC=
,
> EBSA110, EBSA285, Netwinder) I did look into this and came to the
> conclusion that it would be far too inefficient for there to be any
> win.
>
> The big problem we have is that the only commonality between differen=
t
> SoCs is that the CPU executes ARM instructions. =C2=A0Everything else=
 is
> entirely up to the SoC designer - eg location of memory, spacing of
> memory banks, type of interrupt controller, etc is all highly SoC
> specific. =C2=A0Nothing outside of the ARM CPU itself is standardized=
=2E

That sounds very similar to m68k, which does support generic kernels
(except for Sun-3, which uses a completely different MMU)?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
