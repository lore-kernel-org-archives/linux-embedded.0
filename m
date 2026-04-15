Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DC3332919
	for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244801; cv=pass; b=iqbBhUCFfVqBekmpADciur325J7G+dga/FN4SPHXQlsfKO4lJ0As8K6n2HX3L9Q6B8xonhB6qwC6I1y0jRZ78RH8ephWRmn7wTzbm8ftlMOqq4Yhtn+L9k5HqJ+COSr3IZHFOZOKwJ3VSR5rU0ARsUs9E3QO0AiwamUIyIxb06I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244801; c=relaxed/simple;
	bh=c8DgsOawDjrnTSx91HRmcxclG8rmAdupHvPFJ0Ct77M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7e78EemAktqPrnmypJV5unO01YJ9BClADkFD2Lg2tBSCeMNapdc2GokSApieBzu7tObGFGHnRlW0OZTgPDyC5DxiF7Tyy+fKUBjXQjobMFTEb30JhKQ0J+xApFth40PDyxHdzUCnnRgd/WmFBqpjNkx3xK248/IW7KkT0YAqVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7IwiHyb; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7IwiHyb"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a2ee65171so84168257b3.2
        for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 02:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776244798; cv=none;
        d=google.com; s=arc-20240605;
        b=DwUIHqwlp8oR2LyreUkSooHQt9np0pvrpV3/AwULsv/okYYqUjFMxbj3T3Pfd8w5q4
         rVBHzQWvMAiINc7PCCKzqApsV1GjpqaBUX/comYvgCF8kTbyCzJoO+s/Sv/0ef7LCfL0
         j4Hnr9JfCLGIbpnRhMYxjlCGsgDGPT0Wx7UeG3w6ZqEEH65patdv8CBRlVD9qfrxG5KH
         lG1m69qbd5mpApijhztlp7WJpgKzbjVPFsjaKMGGn/mDKDasXpKijy0wPJeaLXpITnep
         DladcvwnfE7rZghZ+sWQ6kZlZ0YCxuxT/ttHhSiw+viKfb3zrf8nej7SPJ+NgzUt2gHa
         bB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C4wXCYps2P7+zVVY5N/jpfms7ehDvH0ij/k5Goxbxvc=;
        fh=2a5kHRDYhBNzZASLyIPcyAn4UySn6oOVP2LmoH13GtU=;
        b=MH7fdJPVjDLPL2tdh7++63vS3J3jony2jRsMXz6txrrUG07f1scBTdGhLUUSCVfRgu
         OO2JXk/4GxKIZA1JOvkKPUnMmPmgPSRGqUetPAAdKUruMckpwQv7YCWhE5RBQwXtXKEc
         srga07EOkQ+Nwe013lRiXyGrAxRlNUPQR/SPR9SSuU2jJHHpTFaokwSruToIVbtTg9SD
         GQAdchUKkST1pzk4satWw9tXVVR7Jhi5GQqmjT1D0wOAu5WgJO7F36P0DMtUMrM0uFG8
         pdjS+wpiFOnDh2Pf48WXJe8j2GB5Eyp+vcDdJycR+CySOl7oFxgqdVQ0x/auf1JUUOqt
         t8mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776244798; x=1776849598; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C4wXCYps2P7+zVVY5N/jpfms7ehDvH0ij/k5Goxbxvc=;
        b=G7IwiHybWx51uYvLOrL3stIsyWw+mzjy92s7Tq8pkcg5a1GF56Sa/He7u9ApY16CEa
         rRXYDGHZBSg5uogl9RBYqgeNaPgf7gxTqpvdVBpy1hHcoErmFHwnt3VS88PsWeZHulgJ
         LincwGBmCLm4k59CRA/rTcs17UYxamG+n5oQfQ/wXtkfZ2dBQ0P6RpZz3/UTEtjm+Ehu
         riJ3noq593BgdAPsqWg23jShXSyHwUn8BX23Hq9IBJKo2Zq5d1FiyMLOiu4QRZi9iiM3
         jqjD7zUHu3K9DfAxcEtntabO6K6PgA6nOyB5GRWWxF4mqlSDBxxEibBKLiPUMQsfWpop
         jqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244798; x=1776849598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4wXCYps2P7+zVVY5N/jpfms7ehDvH0ij/k5Goxbxvc=;
        b=AhuPQgny0k3AfO4VyYU+pSQdvNYGxo489frYKD9ELnulc3IUH1oDmAfls4H9YwNdDq
         tYAN1MdnGDC1Bgb3EANy/tFDCVimA+nWleLHbHUUOg6YSqIRFIW00jpG9OppcasvrqHZ
         PXFvNd1yjKjTJwE350c2Hy60PSiBik0DoTYo1tI4wk3flmHJncCj21Yqe86/iL2/OdaC
         Uj9X7Ore/i2/AVuySAC8TvZHj38ijnzy8eDLnnr1WDR6+4Cf6vkx1aEstXHxvjsKSyRq
         npwSnztA48PJ1jWwEEUXY6SAg309SrwkZzjrKQFvvWHwqLlgscq00OqKJz8OcjBTYqST
         JPvg==
X-Forwarded-Encrypted: i=1; AFNElJ+iBVzC1Mxr74d3Lxrf5MWsqOaFSncvQyPe5dZ2bTqIc080Oin67DPhz0FG1/4fHNfUCcFcTgSkBNLzY7B4GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgB4zk1p1tmqgITCaLHzyrnHiBO7M3TRwj8yiDxOIp0TBBgguL
	H4EMEF3zB3YXuf1GBobSb1GhD8LWvJvH8GyP1XeF1IiNn4uBKLoCnlxihDHHNzr5RbqiLgN28He
	FgXQM8bNcDFN+a5Z52nqmyDJXgxq5IQ==
X-Gm-Gg: AeBDiesivrFH6SGRfZpTyQ5yGMz+01NqgDaVmJyeU32aYRj0sD4jaz8rOv6bbpaH+8n
	CsuheuwAm9/DwcEvzpZA0DlZOwfs2fOOMEzuPDByyUmuLLB2gLoyJdoV4w8vpfk35rxIMxblXp3
	0RfO/0tG5GboUvNQbO00BCZd2oaT/PA92L5fBwoXyoupMZ6j42sg+xKs2afpyg8VxjRTzl2DkAP
	lO9KO1nxspUowAbHR7VRrFmmvKoI/ZSJOrX2r2zx4ZJkeFvsVPoXk9jLxeujcKAsw9FZOe5w2H5
	QzAV8Crzz0HqDgt/VhQQD27ilS+hjyk+HapelntaIEKx4WtQin0c6d5pDZOTh2u0urqNgGumqwN
	QNK/ztnR0
X-Received: by 2002:a05:690c:6d82:b0:7b7:29e4:7dcc with SMTP id
 00721157ae682-7b729e49d1cmr25666537b3.39.1776244798506; Wed, 15 Apr 2026
 02:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
In-Reply-To: <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Wed, 15 Apr 2026 11:19:19 +0200
X-Gm-Features: AQROBzCQh70bEoGaPoP4WKTZ_R9pvWCsG9lEO8--nDZoWQDZyZXY2pGWF6UeV7k
Message-ID: <CAJGKYO7-9t=KMN4=jARMHhO7gWSSaphDuwqRha0TAhOtUdXuQQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Thomas Gleixner <tglx@kernel.org>
Cc: Tim Bird <tim.bird@sony.com>, pmladek@suse.com, rostedt@goodmis.org, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, francesco@valla.it, 
	geert@linux-m68k.org, shashankbalaji02@gmail.com, 
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000401a9e064f7c3879"

--000000000000401a9e064f7c3879
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 02:19, Roberto A. Foglietta
<roberto.foglietta@gmail.com> wrote:
>
> On Wed, 15 Apr 2026 at 00:38, Thomas Gleixner <tglx@kernel.org> wrote:
> >
> > On Fri, Apr 10 2026 at 14:37, Tim Bird wrote:
> > > +
> > > +#include <linux/timekeeping.h>
> > > +#ifdef CONFIG_ARM64
> > > +#include <asm/sysreg.h>
> > > +#endif
> > > +
> > > +#ifdef CONFIG_EARLY_CYCLES_KHZ
> > > +static inline u64 early_unsafe_cycles(void)
> > > +{
> > > +#if defined(CONFIG_X86_64)
> > > +     /*
> > > +      * This rdtsc may happen before secure TSC is initialized, and
> > > +      * it is unordered. So please don't use this value for cryptography
> > > +      * or after SMP is initialized.
> > > +      */
> > > +     return rdtsc();
> > > +#elif defined(CONFIG_ARM64)
> > > +     return read_sysreg(cntvct_el0);
> > > +#elif defined(CONFIG_RISCV_TIMER)
> > > +     u64 val;
> > > +
> > > +     asm volatile("rdtime %0" : "=r"(val));
> > > +     return val;
> > > +#else
> > > +     return 0;
> > > +#endif
> > > +}
> >
> > No. Generic code and generic headers have no business to implement any
> > architecture specific code and there is zero justification for
> > architecture specific #ifdefs in generic code.
>
> This translates in practice in early_unsafe_cycles() various
> instances, one for each architecture supported. Even better a macro
> for each architecture like this example below (untested code, just for
> exemplification):
>
>   ts_nsec = local_clock();
> #ifdef CONFIG_EARLY_CYCLES_KHZ
> #if defined(CONFIG_ARM64)
> #include <asm/sysreg.h>
> #define early_unsafe_cycles read_sysreg(cntvct_el0);
> #elif defined(CONFIG_X86_64)
> #define early_unsafe_cycles rdtsc()
> #elif defined(CONFIG_RISCV_TIMER)
> #define early_unsafe_cycles ({ u64 val; asm volatile("rdtime %0" :
> "=r"(val)); val; })
> #else
> #define early_unsafe_cycles 0
> #endif
> + if (unlikely(!ts_nsec))
> + ts_nsec = early_times_ns();
>  #endif // CONFIG_EARLY_CYCLES_KHZ
>   caller_id = printk_caller_id();
>
> While keeping architectures separate is for abstraction layer best
> practice, in very specific cases abstraction can be a meaningless
> concept or much less important than having a single file for a single
> feature (the complementary way of organising stuff). Because in Linux
> the abstraction layer approach applies for architectures, the gap
> between aesthetic and a specific case like an early boot macros set
> hack for debugging is to clarify the exception from the general rule
> in the header itself.

IMHO, this patch (upstreamed or not) is for a few hackers and it is
not even a tool but a first-outlook or last-resort hack. Therefore the
single point of change that makes sense against spreading stuff that
is supposed to be further hacked isn't the correct approach. The
debate can be about upstreaming this kind of changes, and IMHO this
one still has a sense to be upstreamed among debug features.

I am attaching the path for just sake of independence storage (due my
project github repo linked before is naturally subject to arbitrary
changes by me). It is not supposed to be applied as-is (and probably
cannot be applied anyway) and the patch has been written by hands on a
keyboard. Gemini was used for retrieving information (in a smart man 3
command style) and to collect the ASM code and its fencing.

So the main question is: does this v5 suggested approach bridge the
1-single-point-of-change practical needs with the aim of keeping the
source three? If yes then a V6 is worth being developed to provide the
functionality and propose the upstream (I do not bet in good at the
first write but on resolving the contrast/debate THEN delivery).

Best regards, R-

--000000000000401a9e064f7c3879
Content-Type: text/plain; charset="US-ASCII"; 
	name="printk-fix-early-boot-timestamps-patch-v4.txt"
Content-Disposition: attachment; 
	filename="printk-fix-early-boot-timestamps-patch-v4.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mnzu16tz0>
X-Attachment-Id: f_mnzu16tz0

VGhpcyBpcyBhIGhlYXZpbHkgInJlZmFjdG9yZWQgYnkgaGFuZHMiIHBhdGNoIChleGFtcGxlKSBi
YXNlZCBvbiB0aGUgb25lIGJ5CgpGcm9tOiBUaW0gQmlyZCA8dGltLmJpcmRAc29ueS5jb20+ClN1
YmplY3Q6IFtQQVRDSCB2NCAxLzFdIHByaW50azogZml4IHplcm8tdmFsdWVkIHByaW50ayB0aW1l
c3RhbXBzIGluIGVhcmx5IGJvb3QKRGF0ZTogRnJpLCAxMCBBcHIgMjAyNiAxNDozNzo0MSAtMDYw
MApNZXNzYWdlLUlEOiA8MjAyNjA0MTAyMDM3NDEuOTk3NDEwLTItdGltLmJpcmRAc29ueS5jb20+
CgpEdXJpbmcgZWFybHkgYm9vdCwgcHJpbnRrIHRpbWVzdGFtcHMgYXJlIHJlcG9ydGVkIGFzIHpl
cm8gYmVmb3JlCmtlcm5lbCB0aW1la2VlcGluZyBzdGFydHMgKGkuZS4gYmVmb3JlIHRpbWVfaW5p
dCgpKS4gIFRoaXMKaGluZGVycyBib290LXRpbWUgb3B0aW1pemF0aW9uIGVmZm9ydHMuICBUaGlz
IHBlcmlvZCByYW5nZXMgZnJvbQoxNyB0byAxNzAwIG1pbGxpc2Vjb25kcyBvbiBkaWZmZXJlbnQg
ZW1iZWRkZWQgbWFjaGluZXMgcnVubmluZyBMaW51eC4KCkFkZCBzdXBwb3J0IGZvciBlYXJseSB0
aW1lc3RhbXBzIGJhc2VkIG9uIHByb2Nlc3NvciBjeWNsZS1nZW5lcmF0b3JzCnRoYXQgbmVlZCBu
byBrZXJuZWwgaW5pdGlhbGl6YXRpb24uVGhpcyBmZWF0dXJlIGlzbid0IGludGVuZGVkIGZvciBh
IApnZW5lcmljIGRpc3RybyBrZXJuZWxzIGJ1dCBmb3IgdGVtcG9yYXJ5IHVzZSBkdXJpbmcga2Vy
bmVsIGRldmVsb3BtZW50CmFuZCBib290LXRpbWUgcmVzZWFyY2ggYW5kIG9wdGltaXphdGlvbiBi
eSBrZXJuZWwgaGFja2VycyBvbmx5LgoKVGhpcyB5aWVsZHMgbm9uLXplcm8gdGltZXN0YW1wcyBm
b3IgcHJpbnRrcyBmcm9tIHRoZSB2ZXJ5IHN0YXJ0Cm9mIGtlcm5lbCBleGVjdXRpb24uICBUaGUg
dGltZXN0YW1wcyBhcmUgcmVsYXRpdmUgdG8gdGhlIHN0YXJ0IG9mCmFuIGFyY2hpdGVjdHVyZS1z
cGVjaWZpYyBjb3VudGVyIChlLmcuIHRzYyBvbiB4ODZfNjQgYW5kIGNudHZjdF9lbDAKb24gYXJt
NjQpLiBBZmZlY3RlZCB0aW1lc3RhbXBzIHJlZmxlY3QgY3ljbGUgY291bnRlciByZWxhdGVkIHZh
bHVlcwpzaW5jZSBpbml0ICh1c3VhbGx5IG1hY2hpbmUgcG93ZXItb24gb3IgdmlydHVhbCBtYWNo
aW5lIHN0YXJ0KSBpbnN0ZWFkCm9mIHRpbWUgZnJvbSB0aGUga2VybmVsJ3MgdGltZWtlZXBpbmcg
aW5pdGlhbGl6YXRpb24uIFRoaXMgcmVzdWx0cyBpbgphIGRpc2NvbnRpbnVpdHkgaW4gdGhlIHBy
aW50ayB0aW1lc3RhbXAgdmFsdWVzLCBvbmUgdGltZSwgd2hlbgprZXJuZWwgdGltZWtlZXBpbmcg
c3RhcnRzLgoKU2lnbmVkLW9mZi1ieTogVGltIEJpcmQgPHRpbS5iaXJkQHNvbnkuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBSb2JlcnRvIEEuIEZvZ2xpZXR0YSA8cm9iZXJ0by5mb2dsaWV0dGFAZ21haWwu
Y29tPgotLS0KVjUgLT4gVjQKICBSYXRpb25hbGU6IHNpbmdsZSBwb2ludCBvZiBjaGFuZ2UgaGFj
ayBmb3IgcHJpbnRrLgogIEl0IHByb3ZpZGVzIGEgZmVhdHVyZSBmb3Iga2VybmVsIGhhY2tlcnMg
d2lsbGluZyB0byBwcm9maWxpbmcgdGhlIGVhcmx5IGJvb3QKICB3aXRoIGEgYmFzaWMgcHJpbnRr
IGFwcHJvYWNoIChyYXRoZXIgdGhhbiB1c2luZyBIVyBtb25pdG9ycyB3aGljaCBtaWdodCBub3QK
ICBiZSBhdmFpbGFibGUgb3IgaW1tZWRpYXRlbHkgYXZhaWxhYmxlKS4gVGh1cywgaXQgaXMgYSBm
aXJzdC1sb29rIG9yIGEgbGFzdAogIHJlc29ydCBoYWNrIHByb2ZpbGluZyBmZWF0dXJlLiBTb21l
dGhpbmcgdGhhdCBpc24ndCBnb29kIHRvIHNwcmVhZCBhcm91bmQKICB0aGUga2VybmVsIHNvdXJj
ZXMgdHJlZSBhbmQgaXQgaXMgZmluZSB0byBoYXZlIGludG8gYSBzaW5nbGUgaGVhZGVyIGZpbGUu
ClYzIC0+IFY0CiAgUmVwbGFjZSBjb25maWcgdmFycyB3aXRoIHNpbmdsZSBvbmU6IENPTkZJR19F
QVJMWV9DWUNMRVNfS0haCiAgUmVwbGFjZSBydW50aW1lIGNhbGlicmF0aW9uIHdpdGggc3RhdGlj
IGNvbmZpZyB2YXJpYWJsZQogIFJlbW92ZSByZWZlcmVuY2UgdG8gZ2V0X2N5Y2xlcygpCiAgQWRk
IHN1cHBvcnQgZm9yIFJJU0NWIHBsYXRmb3JtcwpWMiAtPiBWMwogIERlZmF1bHQgQ09ORklHIG9w
dGlvbiB0byAnbicKICBNb3ZlIG1vcmUgY29kZSBpbnRvIGVhcmx5X3RpbWVzLmggKHJlZHVjZSBp
ZmRlZnMgaW4gaW5pdC9tYWluLmMpCiAgVXNlIG1hdGNoNjQgaGVscGVyIHJvdXRpbmVzCiAgVXNl
IGN5Y2xlc190IGluc3RlYWQgb2YgdTY0IHR5cGUKICBBZGQgI2RlZmluZXMgZm9yIEVBUkxZX0NZ
Q0xFU19CSVQgYW5kIEVBUkxZX0NZQ0xFU19NQVNLCiAgSW52ZXJ0IGlmIGxvZ2ljIGluIGFkanVz
dF9lYXJseV90cygpClYxIC0+IFYyCiAgUmVtb3ZlIGNhbGlicmF0aW9uIENPTkZJRyB2YXJzCiAg
QWRkICdkZXBlbmRzIG9uJyB0byByZXN0cmljdCBhcmNoZXMgKHRvIGhhbmRsZSBwcGMgYnVnKQog
IEFkZCBlYXJseV90c19vZmZzZXQgdG8gYXZvaWQgZGlzY29udGludWl0eQogIFNhdmUgY3ljbGVz
IGluIHRzX25zZWMsIGFuZCBjb252ZXJ0IG9uIG91dHB1dAogIE1vdmUgY29uZGl0aW9uYWwgY29k
ZSB0byBpbmNsdWRlIGZpbGUgKGVhcmx5X3RpbWVzLmg+CgpkaWZmIC1wcnVOIC9kZXYvbnVsbCBr
ZXJuZWwvcHJpbnRrL2Vhcmx5X3RpbWVzLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi44MmJhY2ZkMGUyNmIKLS0tIC9kZXYvbnVsbAorKysga2VybmVsL3ByaW50ay9l
YXJseV90aW1lcy5oCkBAIC0wLDAgKzEsMjYgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wICovCisKKyNpZm5kZWYgX0VBUkxZX1RJTUVTX0gKKyNkZWZpbmUgX0VBUkxZX1RJ
TUVTX0gKKworI2luY2x1ZGUgPGxpbnV4L3RpbWVrZWVwaW5nLmg+CisKKy8qCisgKiBGZW5jaW5n
IGlzbid0IG9wdGlvbmFsIGhlcmUsIG90aGVyd2lzZSB1bnJlbGlhYmxlIHZhbHVlcyBkaXNwbGF5
aW5nCisgKi8KKyNpZiBkZWZpbmVkKENPTkZJR19BUk02NCkKKwkJI2luY2x1ZGUgPGFzbS9zeXNy
ZWcuaD4KKwkJI2RlZmluZSBfX2Vhcmx5X3Jhd19jeWNsZXMgKHsgdTY0IHZhbDsgXAorCQkgICAg
YXNtIHZvbGF0aWxlKCJpc2I7IG1ycyAlMCwgY250dmN0X2VsMCIgOiAiPXIiKHZhbCkpOyB2YWw7
IH0pCisjZWxpZiBkZWZpbmVkKENPTkZJR19YODZfNjQpCisJCSNkZWZpbmUgX19lYXJseV9yYXdf
Y3ljbGVzICh7IHU2NCB2YWw7IFwKKwkJICAgIGFzbSB2b2xhdGlsZSgibGZlbmNlOyByZHRzYzsg
c2hsICQzMiwgJSVyZHg7IG9yICUlcmR4LCAlJXJheCIgXAorCQkgICAgICAgIDogIj1hIih2YWwp
IDogOiAicmR4Iik7IHZhbDsgfSkKKyNlbGlmIGRlZmluZWQoQ09ORklHX1JJU0NWX1RJTUVSKQor
CQkjZGVmaW5lIF9fZWFybHlfcmF3X2N5Y2xlcyAoeyB1NjQgdmFsOyBcCisJCSAgICBhc20gdm9s
YXRpbGUoImZlbmNlOyByZHRpbWUgJTAiIDogIj1yIih2YWwpKTsgdmFsOyB9KQorI2Vsc2UKKwkJ
I2RlZmluZSBfX2Vhcmx5X3Jhd19jeWNsZXMgMAorI2VuZGlmCisKKyNlbmRpZiAvKiBfRUFSTFlf
VElNRVNfSCAqLwpkaWZmIC0tZ2l0IGEvaW5pdC9LY29uZmlnIGIvaW5pdC9LY29uZmlnCmluZGV4
IDc0ODRjZDcwM2JjMS4uNDBjMzEyM2MyYzI3IDEwMDY0NAotLS0gYS9pbml0L0tjb25maWcKKysr
IGIvaW5pdC9LY29uZmlnCkBAIC03OTIsNiArNzkyLDI2IEBAIGNvbmZpZyBJS0hFQURFUlMKIAkg
IG9yIHNpbWlsYXIgcHJvZ3JhbXMuICBJZiB5b3UgYnVpbGQgdGhlIGhlYWRlcnMgYXMgYSBtb2R1
bGUsIGEgbW9kdWxlIGNhbGxlZAogCSAga2hlYWRlcnMua28gaXMgYnVpbHQgd2hpY2ggY2FuIGJl
IGxvYWRlZCBvbi1kZW1hbmQgdG8gZ2V0IGFjY2VzcyB0byBoZWFkZXJzLgogCitjb25maWcgRUFS
TFlfQk9PVF9USU1JTkdTCisJaW50ICJFYXJseSBib290IHByaW50ayBzaG93cyB0aW1lcyBpbiBy
YXcgY3ljbGUgY291bnRlciBzdHlsZSIKKwlkZWZhdWx0IDAKKwlkZXBlbmRzIG9uIFBSSU5USwor
CWRlcGVuZHMgb24gQVJNNjQgfHwgWDg2XzY0IHx8IFJJU0NWX1RJTUVSCisJaGVscAorCSAgQm9v
bGVhbiB2YWx1ZSwgZGlzYWJsZWQgYnkgZGVmYXVsdC4KKworCSAgU2V0IHRoaXMgdG8gcHJvdmlk
ZSBjeWNsZXMgaW5mb3JtYXRpb24gZm9yIHByaW50a3MgaW4gZWFybHkgYm9vdAorCSAgKGJlZm9y
ZSB0aGUgc3RhcnQgb2Yga2VybmVsIHRpbWVrZWVwaW5nKSwgdGhhdCB3b3VsZCBvdGhlcndpc2UK
KwkgIHNob3cgYXMgMC4gUHJvZmlsaW5nIGJ5IHJlbGF0aXZlIG1vbm90b25pYyB2YWx1ZXMsIG5v
dCB0aW1lLiAKKworCSAgTm90ZSB0aGF0IHRoaXMgY2F1c2VzIHRoZSBrZXJuZWwgdG8gc2hvdywg
Zm9yIHNvbWUgZWFybHkgcHJpbnRrcywKKwkgIGN5Y2xlcyB0aGF0IGFyZSByZWxhdGl2ZSB0byBw
cm9jZXNzb3IgcG93ZXIgb24sIGluc3RlYWQgb2YKKwkgIHJlbGF0aXZlIHRvIHRoZSBzdGFydCBv
ZiBrZXJuZWwgdGltZWtlZXBpbmcuICBXaGVuIGtlcm5lbAorCSAgdGltZWtlZXBpbmcgc3RhcnRz
LCB0aGUgdGltZXN0YW1wcyB2YWx1ZXMgcmVzZXQsIGNhdXNpbmcKKwkgIGEgZGlzY29udGludWl0
eSBpbiB0aGUgdGltZXN0YW1wIHZhbHVlcy4KKworCSAgSWYgdW5zdXJlLCBrZWVwIGl0IGRpc2Fi
bGVkIGFzIHBlciBpdHMgZGVmYXVsdC4KKwogY29uZmlnIExPR19CVUZfU0hJRlQKIAlpbnQgIktl
cm5lbCBsb2cgYnVmZmVyIHNpemUgKDE2ID0+IDY0S0IsIDE3ID0+IDEyOEtCKSIKIAlyYW5nZSAx
MiAyNQpkaWZmIC0tZ2l0IGEva2VybmVsL3ByaW50ay9wcmludGsuYyBiL2tlcm5lbC9wcmludGsv
cHJpbnRrLmMKaW5kZXggMDMyMzE0OTU0OGY2Li5kZGVhYjgxZjA0ZWYgMTAwNjQ0Ci0tLSBhL2tl
cm5lbC9wcmludGsvcHJpbnRrLmMKKysrIGIva2VybmVsL3ByaW50ay9wcmludGsuYwpAQCAtMjI5
NCw2ICsyMjk1LDggQEAgaW50IHZwcmludGtfc3RvcmUoaW50IGZhY2lsaXR5LCBpbnQgbGV2ZWws
CiAJICogdGltZXN0YW1wIHdpdGggcmVzcGVjdCB0byB0aGUgY2FsbGVyLgogCSAqLwogCXRzX25z
ZWMgPSBsb2NhbF9jbG9jaygpOwogCisjaWYgQ09ORklHX0VBUkxZX0JPT1RfVElNSU5HUworI2lu
Y2x1ZGUgImVhcmx5X3RpbWVzLmgiCisJCS8qCisJCSAqIFZlcnkgZmV3IGRldmVsb3BlcnMgYXJl
IHVzaW5nIHRoaXMgZmVhdHVyZSBhbmQgdGhleSdyZSBleHBlY3RpbmcgdG8gZGVhbAorCQkgKiB3
aXRoIGl0IGFzIGEgc2luZ2xlIHBvaW50IG9mIGNoYW5nZSBoYWNrIHRvIGJlIGZ1cnRoZXIgY3Vz
dG9taXNlZCBieSB0aGVtLgorCQkgKiBUaGUgcmlnaHQgc2hpZnQgYnkgMl4xMCBpcyBhIHJhdyBl
eHRpbWF0aW9uIHRvIHByb3ZpZGUgNi1maWd1cmUgd2l0aGluIHRoZQorCQkgKiBmaXJzdCBzZWNv
bmQgd2hlbiB0aGUga2VybmVsIGludGVybmFsIGN5Y2xlL25TIGNhbGlicmF0aW9uIGlzbid0IHJl
YWR5IHlldC4KKwkJICovCisJCWlmICh1bmxpa2VseSghdHNfbnNlYykpCisJCQl0c19uc2VjID0g
X19lYXJseV9yYXdfY3ljbGVzID4+IDEwOworI2VuZGlmCisKIAljYWxsZXJfaWQgPSBwcmludGtf
Y2FsbGVyX2lkKCk7CiAKLS0gCjIuNDMuMAo=
--000000000000401a9e064f7c3879--
