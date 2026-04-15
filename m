Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC84637BE6A
	for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 19:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776281053; cv=pass; b=ErmsSJx2eJCSsGsy3ylCceLOapcB0SnqYiWB/cje+b3mNKzvoC3bIPL2Uf6J90DgFCgZd5IvxvE7Rno6Qbelnn9oG0BCnH67/B3YHwKTdxD37Z8Xs6xlOkV2yNR9Lcx9eYRfyXE+h187vcBHIxvQLVlOR0PiCk6vSaHVqt56gds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776281053; c=relaxed/simple;
	bh=FJ8cahGgn4p5x9iKcxchuAyxHG4afqNZYR4TvomBYIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6/NsPdPNNT6vS3W0ULLm3upxXZ3++e9Zj2WAzNHm3oQj4upTwzv/qtcVH5Vh1mjzcT1GqBhq6n2E0zO/S4nJTRabZSXE9uTtaZX5wFQcyMatGmRuPoSjUYz3H7xNBUq8mqeSKiKH0/TXZKzavltovIbDLVk0bp5uA2vIamrGWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htylPuP5; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htylPuP5"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7947cf097c1so66246547b3.2
        for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 12:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776281050; cv=none;
        d=google.com; s=arc-20240605;
        b=Hn+DfmoFqSjG2sfNhJFTcK6Rxjbm9y5/SedIQNT24DiH4Vn5WiIhbW99xVSacHjZcm
         CX77fYsvTpfKnQuNdr5qUPZzO1Ak3+d/riI28DtDwuWRUZDH6XSDqx6UubGZOiF7sRW7
         YqkKQnIqwcASECk/oMLkxrYocCCMjCaQmbWKOv0YmA0QIxvG/zkz7yC+PJ9Xf/tu9wXp
         o2coe63Kg8LZdISkLta0gUCwbgRq/QFO+nTLYzy7GBN6uRrC5PUOdA48q6Yq/NCOjN8H
         3ZwuN/BR239R6xtBiYE48dJSmfO57z3/uuQ7/tPF3vK/tA5z44S1/tFrRwKdtcmuEegc
         8qIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=llU/Q9bLVOq6WHBDeRqVxDdTvkd/FsNKVSTGsoogm9Q=;
        fh=Mt+sY7tNf7W5L0CyjFzdXxZ8LYpu7NPcDWT1XruzL9I=;
        b=I26IvM7M+FWjhnJD7uxz/XOqaqBk8E/XHiCz2iniWeJe4U5QbkXWg49HbvgGHwQ969
         NbennNUmoVcYNTADIJaSl9cVWO6NIXad1NluqNfsq9RJNrpxn6GvFutfE2vEp5lq1tS/
         aqKsXLMLtQW4Sqkd7X7j/kNBBlXOke/gPIn4YuTJ6DIYHFLe1rU07S+RHKMJZK7UBvHC
         W8YWf11ALEVvZlvuP2yRjZK3SdtY5eXcHihLpr94Gfpqgjir7GDNF+7JP7SUdRjdSdCK
         +SmIKMF6gX3SRqyN5RLJt6oY8AyzpunhO6mO+0QDfV68O1YhljT/BxIDvnuEA4YXPdn8
         ivQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776281050; x=1776885850; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=llU/Q9bLVOq6WHBDeRqVxDdTvkd/FsNKVSTGsoogm9Q=;
        b=htylPuP5fcJj8hfBYfqCi8SllEvdw3KLrxNixlkt6nPK8DZtGn1CPW5tV/ZddmswQ9
         CeRvQ8Spz7zeLz4G2clIGJAr0qn6EcZwRBDDDSdf3RX5SngIKy6XQEVY59awNKwJ0qOY
         JG82TvLIOyi+SdOfgnwKU9JOKtzH0P+zQARAMXRYCc8dB4J9y5Vnszt3Vg3gBdVsggI8
         wsXD3TszADQQ1njJVEFRkIByWNj1tAqfZx9EfxPuDPraWIsqumGeW5xoWwJwFXCCs/Jl
         ayYqc+1yQT4hlbfuJfy5p85Hu7zLXNJWGEGERjXNjZI3Hi1SJGtboNDuhh+cPjj+39oy
         kRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776281050; x=1776885850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llU/Q9bLVOq6WHBDeRqVxDdTvkd/FsNKVSTGsoogm9Q=;
        b=MnppLnIB/IryPg5uQtM97TXknnr3fb3TAnptmff29defkAb0n1+rqYZ8IdEEQ1KK6J
         NwznJO//hTvyarxJBlzxqNW0rg/Gu7Nf8XgN9A6EciXqPVrca68OhELbHue2JEp0hDXX
         4j0esqkgeB902oMUmSXk8Gl/V01VFPJP10DgDNlLHfkdT6feqMI/fuYbklT0zgiBIQ43
         t1z/8WozvJ5M9gycBNmQpnN/8Hmbp9YfEpyzqLHr0NUYEb4/i8bG+0J5GdnVQZsydLWU
         eJqygbJn+yyAfhpbXOaWmgaTOgAxx8WZvkKcZrotwaQuTbT5cNP1XhwQTPpHqkju0xnw
         gxQA==
X-Forwarded-Encrypted: i=1; AFNElJ85EYU6jtJnFMo6uL2Hu27/f89E1UV8azjxiXVc/BlKe6kAoRFrPVOWK4CkJoIRCH8r6ZdyJIES5nJVochGzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQrHC18WOIRLMIZCLZF3eQiqhtNXRoB8HadChu/WFgnZkRQUCk
	5LPWsDnDLUmDMlySzlzzH3sDpIuCl3SkFOkOnjIN7mfNWrhGDVkuZfPIyAo3pSXD3bLMQzDal5T
	Z3VH3GXVDzXQwnJ7EJyT92sMxUACOyl0lcOsx3Q==
X-Gm-Gg: AeBDieugjJtqlO0guJis/RlY33hvqPSHeBgKlT5UNfalFy5s6q1pEcG0McVifMnBM8w
	s1BiTKGwGapsyvVtmGx4GnFEBK1I9N924BNJVivmMTY+4xsBNhRJlucVu80bfewQZmi6xvrz+nb
	PSrpXPfy0RqYLF6Mzj4ynQDVwF4K47YRY4W0oPUeeXJ3rcTzu0BiEVi+RFnjtL+4U1/qc7o6YII
	W1h529242oUrbkzAtQClrRI8xohUsmIXWD6Aae1jw4b2YeYxcrOQIPhN7bX569B8ArKv1NiLp0F
	tuH3jWMRD8M/rDRuUsHcIDvTiDgeI5pKqx7Nab0SgUw8mWAdGbmf8Bzyi3AsWbN+TuySvWI+PnL
	Efv5m1EjQYsEb8uTDKb4=
X-Received: by 2002:a05:690c:6e87:b0:7b2:dad2:5e0d with SMTP id
 00721157ae682-7b2dad263eemr138968977b3.33.1776281049476; Wed, 15 Apr 2026
 12:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
 <CAJGKYO7-9t=KMN4=jARMHhO7gWSSaphDuwqRha0TAhOtUdXuQQ@mail.gmail.com> <CAMuHMdVYxHbHgeT4nnbC9s2Hn+S8FSqe3DgsJuShcRWsiGGGRg@mail.gmail.com>
In-Reply-To: <CAMuHMdVYxHbHgeT4nnbC9s2Hn+S8FSqe3DgsJuShcRWsiGGGRg@mail.gmail.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Wed, 15 Apr 2026 21:23:32 +0200
X-Gm-Features: AQROBzCwk8hYJ3ELFEtGYd62_-eim5KgO8MTg36RfP6nIN8zMdufHM12a_Uo7VA
Message-ID: <CAJGKYO4d65gUBr5_hY0Z1XdwsxO31K8c25tDbGNuzBBU2RYXKQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Tim Bird <tim.bird@sony.com>, pmladek@suse.com, 
	rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org, 
	francesco@valla.it, shashankbalaji02@gmail.com, 
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000fa11f9064f84a890"

--000000000000fa11f9064f84a890
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 20:41, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Roberto,
...
> Thanks for your patch!
>
> > --- /dev/null
> > +++ kernel/printk/early_times.h
> > @@ -0,0 +1,26 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef _EARLY_TIMES_H
> > +#define _EARLY_TIMES_H
> > +
> > +#include <linux/timekeeping.h>
> > +
> > +/*
> > + * Fencing isn't optional here, otherwise unreliable values displaying
> > + */
> > +#if defined(CONFIG_ARM64)
> > +             #include <asm/sysreg.h>
> > +             #define __early_raw_cycles ({ u64 val; \
> > +                 asm volatile("isb; mrs %0, cntvct_el0" : "=r"(val)); val; })
> > +#elif defined(CONFIG_X86_64)
> > +             #define __early_raw_cycles ({ u64 val; \
> > +                 asm volatile("lfence; rdtsc; shl $32, %%rdx; or %%rdx, %%rax" \
> > +                     : "=a"(val) : : "rdx"); val; })
> > +#elif defined(CONFIG_RISCV_TIMER)
> > +             #define __early_raw_cycles ({ u64 val; \
> > +                 asm volatile("fence; rdtime %0" : "=r"(val)); val; })
> > +#else
>
> All of these should be handled in arch/*/include/asm/early_times.h...
>
> > +             #define __early_raw_cycles 0
>
> ... while this should be in include/asm-generic/early_times.h.

In the last release of the patch, I decided to stick with the "single
point of hacking" approach

https://github.com/robang74/uchaosys/blob/v069/cnfg/printk-early-boot-timestamps-hack-v5.patch

and I developed it in a way that can be proposed in such "exceptional
way" for this very specific case:

+#if CONFIG_PRINTK_EARLY_BOOT_TIMINGS
+#include "early_times.h"
+ /*
+ * Very few developers are using this feature and they're expecting to deal
+ * with it as a single point of change hack to be further customised by them.
+ */
+ if (unlikely(!ts_nsec))
+ ts_nsec = __early_raw_cycles;
+#endif

As you can see the include uses double quotes to indicate that the
header is local and it is not supposed to belong to the formal three:
it is where everyone of us will put it when we are going to do dirty
tricks to reach somewhat result, in the same folder of the printk.c,
out-of-the-three.

Why is this a very special case?

- First of all because just a variable is provided by the macros set.
No hypothesis, just a variable as-is because most of the few users
that might be interested in are going to watch HOW the relative
sequences of events are happening. Moreover, there is no reason to
pretend (sell) a timestamp when the timestamp sub-system is not ready
to provide that feature: fairness first, by clarity. Previously the
time skew was from zeros and something, now from two different ways of
tagging the printk.

- Second, because there is a very limited use of it due to almost
immediate timestamp readiness. Therefore those who are interested,
they were hacking with very LOW level stuff (or BIOS for those are
constraint but that evilness in x86 arch). For those people the ASM
code is fine and it is very useful to have it in the same place. And
it is in the interest of those who maintain the kernel that those
people have a single point of hack for the major arch available.
Easier is for them to test different arches, far more improbable an
under-tested patch will reach a proposal upstream stage... and trust
me about "under-tested" because I am an expert on that field... ;-)
LOL

- Third, because every assumption has been removed, even the basics
>>10 shifts. Just something that appears as a variable emerging from a
local header and these two things together should ring some bells in
the head of those who have a little experience of firmware / embedded.
Few constructs are more vicious than macros that resemble variables...
;-)

> > +             if (unlikely(!ts_nsec))
> > +                     ts_nsec = __early_raw_cycles >> 10;
>
> As there can be lots of variation in the granularity of early timers,
> I think the shift should be moved in the arch-specific __early_raw_cycles,
> so it is only done when useful.
>

I am attaching the matured V5 patch that I tested against the 5.15.202
LTS kernel. Please, sit on the approach -- include"local-stuff.h" --
and let your judgement get soothed by time and PoVs. For sure one
change is probably a necessity, moving the Kconfig part into the DEBUG
section from the INIT where it stays by now. However, moving a feature
around the menuconfig is the last and less effort change in a TODO
list.

For sake of completeness, I am attaching the V5 matured patch. Will it
be refused because of its approach? Fine, at least the idea of that
approach has a patch that can be applied to something and people can
give it a try. Which add a practical degree of judgemental because
usually we are attracted by the beauty of perfection and purity,
something that Franco Battiato entitled "Inneres Auge" (a call from
above) but as complementary we are also keen to fall in love for those
bare-simple dirty-practical solution... in the same sense that song
was intending with a convoluted and educated paraphrase... LOL

Cheers, R-

--000000000000fa11f9064f84a890
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="printk-early-boot-timestamps-hack-v5.patch"
Content-Disposition: attachment; 
	filename="printk-early-boot-timestamps-hack-v5.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mo0fht4z0>
X-Attachment-Id: f_mo0fht4z0

VGhpcyBpcyBhIGhlYXZpbHkgInJlZmFjdG9yZWQgYnkgaGFuZHMiIHBhdGNoIGZvciBMaW51eCBL
ZXJuZWwgNS4xNS4yMDIgTFRTCnRyeWluZyB0byBzb2x2ZSB0aGUgc291cmNlIHRyZWUgamFuaXRv
cmluZyB2cyAxLXNpbmdsZSBwbGFjZSBoYWNrIGZvciBoYWNrZXJzCmluIG5lZWQgZm9yIGEgc2lt
cGxlLWJhcmUgcHJvZmlsaW5nIHRvb2wgYW5kIGJhc2VkIG9uIHRoZSBwYXRjaCBWNCBzdWJtaXR0
ZWQgYnkKCkZyb206IFRpbSBCaXJkIDx0aW0uYmlyZEBzb255LmNvbT4KU3ViamVjdDogW1BBVENI
IHY0IDEvMV0gcHJpbnRrOiBmaXggemVyby12YWx1ZWQgcHJpbnRrIHRpbWVzdGFtcHMgaW4gZWFy
bHkgYm9vdApEYXRlOiBGcmksIDEwIEFwciAyMDI2IDE0OjM3OjQxIC0wNjAwCk1lc3NhZ2UtSUQ6
IDwyMDI2MDQxMDIwMzc0MS45OTc0MTAtMi10aW0uYmlyZEBzb255LmNvbT4KCkR1cmluZyBlYXJs
eSBib290LCBwcmludGsgdGltZXN0YW1wcyBhcmUgcmVwb3J0ZWQgYXMgemVybyBiZWZvcmUKa2Vy
bmVsIHRpbWVrZWVwaW5nIHN0YXJ0cyAoaS5lLiBiZWZvcmUgdGltZV9pbml0KCkpLiBUaGlzIGhp
bmRlcnMKYm9vdC10aW1lIG9wdGltaXphdGlvbiBlZmZvcnRzLiBUaGlzIHBlcmlvZCByYW5nZXMg
ZnJvbSAxNyB0byAxNzAwCm1pbGxpc2Vjb25kcyBvbiBkaWZmZXJlbnQgZW1iZWRkZWQgbWFjaGlu
ZXMgcnVubmluZyBMaW51eC4KCkFkZCBzdXBwb3J0IGZvciBlYXJseSB0aW1lc3RhbXBzIGJhc2Vk
IG9uIHByb2Nlc3NvciBjeWNsZS1nZW5lcmF0b3JzCnRoYXQgbmVlZCBubyBrZXJuZWwgaW5pdGlh
bGl6YXRpb24uVGhpcyBmZWF0dXJlIGlzbid0IGludGVuZGVkIGZvciBhIApnZW5lcmljIGRpc3Ry
byBrZXJuZWxzIGJ1dCBmb3IgdGVtcG9yYXJ5IHVzZSBkdXJpbmcga2VybmVsIGRldmVsb3BtZW50
CmFuZCBib290LXRpbWUgcmVzZWFyY2ggYW5kIG9wdGltaXphdGlvbiBieSBrZXJuZWwgaGFja2Vy
cyBvbmx5LgoKVGhpcyB5aWVsZHMgbm9uLXplcm8gdGltZXN0YW1wcyBmb3IgcHJpbnRrcyBmcm9t
IHRoZSB2ZXJ5IHN0YXJ0Cm9mIGtlcm5lbCBleGVjdXRpb24uIFRoZSB0aW1lc3RhbXBzIGFyZSBy
ZWxhdGl2ZSB0byB0aGUgc3RhcnQgb2YKYW4gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGNvdW50ZXIg
KGUuZy4gdHNjIG9uIHg4Nl82NCBhbmQgY250dmN0X2VsMApvbiBhcm02NCkuIEFmZmVjdGVkIHRp
bWVzdGFtcHMgcmVmbGVjdCBjeWNsZSBjb3VudGVyIHJlbGF0ZWQgdmFsdWVzCnNpbmNlIGluaXQg
KHVzdWFsbHkgbWFjaGluZSBwb3dlci1vbiBvciB2aXJ0dWFsIG1hY2hpbmUgc3RhcnQpIGluc3Rl
YWQKb2YgdGltZSBmcm9tIHRoZSBrZXJuZWwncyB0aW1la2VlcGluZyBpbml0aWFsaXphdGlvbi4g
VGhpcyByZXN1bHRzIGluCmEgZGlzY29udGludWl0eSBpbiB0aGUgcHJpbnRrIHRpbWVzdGFtcCB2
YWx1ZXMsIG9uZSB0aW1lLCB3aGVuCmtlcm5lbCB0aW1la2VlcGluZyBzdGFydHMuCgpTaWduZWQt
b2ZmLWJ5OiBUaW0gQmlyZCA8dGltLmJpcmRAc29ueS5jb20+ClNpZ25lZC1vZmYtYnk6IFJvYmVy
dG8gQS4gRm9nbGlldHRhIDxyb2JlcnRvLmZvZ2xpZXR0YUBnbWFpbC5jb20+Ci0tLQpWNSAtPiBW
NAogIFJhdGlvbmFsZTogc2luZ2xlIHBvaW50IG9mIGNoYW5nZSBoYWNrIGZvciBwcmludGsuIENv
ZGUgcmV3cml0dGVuLCBlbnRpcmVseS4KICBJdCBwcm92aWRlcyBhIGZlYXR1cmUgZm9yIGtlcm5l
bCBoYWNrZXJzIHdpbGxpbmcgdG8gcHJvZmlsaW5nIHRoZSBlYXJseSBib290CiAgd2l0aCBhIGJh
c2ljIHByaW50ayBhcHByb2FjaCAocmF0aGVyIHRoYW4gdXNpbmcgSFcgbW9uaXRvcnMgd2hpY2gg
bWlnaHQgbm90CiAgYmUgYXZhaWxhYmxlIG9yIGltbWVkaWF0ZWx5IGF2YWlsYWJsZSkuIFRodXMs
IGl0IGlzIGEgZmlyc3QtbG9vayBvciBhIGxhc3QKICByZXNvcnQgaGFjayBwcm9maWxpbmcgZmVh
dHVyZS4gU29tZXRoaW5nIHRoYXQgaXNuJ3QgZ29vZCB0byBzcHJlYWQgYXJvdW5kCiAgdGhlIGtl
cm5lbCBzb3VyY2VzIHRyZWUgYW5kIGl0IGlzIGZpbmUgdG8gaGF2ZSBpbnRvIGEgc2luZ2xlIGhl
YWRlciBmaWxlLgpWMyAtPiBWNAogIFJlcGxhY2UgY29uZmlnIHZhcnMgd2l0aCBzaW5nbGUgb25l
OiBDT05GSUdfRUFSTFlfQ1lDTEVTX0tIWgogIFJlcGxhY2UgcnVudGltZSBjYWxpYnJhdGlvbiB3
aXRoIHN0YXRpYyBjb25maWcgdmFyaWFibGUKICBSZW1vdmUgcmVmZXJlbmNlIHRvIGdldF9jeWNs
ZXMoKQogIEFkZCBzdXBwb3J0IGZvciBSSVNDViBwbGF0Zm9ybXMKVjIgLT4gVjMKICBEZWZhdWx0
IENPTkZJRyBvcHRpb24gdG8gJ24nCiAgTW92ZSBtb3JlIGNvZGUgaW50byBlYXJseV90aW1lcy5o
IChyZWR1Y2UgaWZkZWZzIGluIGluaXQvbWFpbi5jKQogIFVzZSBtYXRjaDY0IGhlbHBlciByb3V0
aW5lcwogIFVzZSBjeWNsZXNfdCBpbnN0ZWFkIG9mIHU2NCB0eXBlCiAgQWRkICNkZWZpbmVzIGZv
ciBFQVJMWV9DWUNMRVNfQklUIGFuZCBFQVJMWV9DWUNMRVNfTUFTSwogIEludmVydCBpZiBsb2dp
YyBpbiBhZGp1c3RfZWFybHlfdHMoKQpWMSAtPiBWMgogIFJlbW92ZSBjYWxpYnJhdGlvbiBDT05G
SUcgdmFycwogIEFkZCAnZGVwZW5kcyBvbicgdG8gcmVzdHJpY3QgYXJjaGVzICh0byBoYW5kbGUg
cHBjIGJ1ZykKICBBZGQgZWFybHlfdHNfb2Zmc2V0IHRvIGF2b2lkIGRpc2NvbnRpbnVpdHkKICBT
YXZlIGN5Y2xlcyBpbiB0c19uc2VjLCBhbmQgY29udmVydCBvbiBvdXRwdXQKICBNb3ZlIGNvbmRp
dGlvbmFsIGNvZGUgdG8gaW5jbHVkZSBmaWxlIGVhcmx5X3RpbWVzLmgKCi0tLSBhL2luaXQvS2Nv
bmZpZwkyMDI2LTA0LTE1IDExOjM0OjA1LjgyMzQzMzcxMiArMDIwMAorKysgYi9pbml0L0tjb25m
aWcJMjAyNi0wNC0xNSAxMTozNjoxMi43MDMzMzQ2MDQgKzAyMDAKQEAgLTgzMyw2ICs4MzMsMjcg
QEAgY29uZmlnIFBSSU5US19JTkRFWAogCiAJICBUaGVyZSBpcyBubyBhZGRpdGlvbmFsIHJ1bnRp
bWUgY29zdCB0byBwcmludGsgd2l0aCB0aGlzIGVuYWJsZWQuCiAKK2NvbmZpZyBQUklOVEtfRUFS
TFlfQk9PVF9USU1JTkdTCisJYm9vbCAiRWFybHkgYm9vdCBwcmludGsgc2hvd3MgdGltZXMgaW4g
cmF3IGN5Y2xlIGNvdW50ZXIgc3R5bGUiCisJZGVmYXVsdCAwCisJZGVwZW5kcyBvbiBQUklOVEsK
KwlkZXBlbmRzIG9uIEFSTTY0IHx8IFg4Nl82NCB8fCBSSVNDVl9USU1FUgorCXNlbGVjdCBQUklO
VEtfVElNRQorCWhlbHAKKwkgIEJvb2xlYW4gdmFsdWUsIGRpc2FibGVkIGJ5IGRlZmF1bHQuCisK
KwkgIFNldCB0aGlzIHRvIHByb3ZpZGUgY3ljbGVzIGluZm9ybWF0aW9uIGZvciBwcmludGtzIGlu
IGVhcmx5IGJvb3QKKwkgIChiZWZvcmUgdGhlIHN0YXJ0IG9mIGtlcm5lbCB0aW1la2VlcGluZyks
IHRoYXQgd291bGQgb3RoZXJ3aXNlCisJICBzaG93IGFzIDAuIFByb2ZpbGluZyBieSByZWxhdGl2
ZSBtb25vdG9uaWMgdmFsdWVzLCBub3QgdGltZS4KKworCSAgTm90ZSB0aGF0IHRoaXMgY2F1c2Vz
IHRoZSBrZXJuZWwgdG8gc2hvdywgZm9yIHNvbWUgZWFybHkgcHJpbnRrcywKKwkgIGN5Y2xlcyB0
aGF0IGFyZSByZWxhdGl2ZSB0byBwcm9jZXNzb3IgcG93ZXIgb24sIGluc3RlYWQgb2YKKwkgIHJl
bGF0aXZlIHRvIHRoZSBzdGFydCBvZiBrZXJuZWwgdGltZWtlZXBpbmcuIFdoZW4ga2VybmVsCisJ
ICB0aW1la2VlcGluZyBzdGFydHMsIHRoZSB0aW1lc3RhbXBzIHZhbHVlcyByZXNldCwgY2F1c2lu
ZworCSAgYSBkaXNjb250aW51aXR5IGluIHRoZSB0aW1lc3RhbXAgdmFsdWVzLgorCisJICBJZiB1
bnN1cmUsIGtlZXAgaXQgZGlzYWJsZWQgYXMgcGVyIGl0cyBkZWZhdWx0LgorCiAjCiAjIEFyY2hp
dGVjdHVyZXMgd2l0aCBhbiB1bnJlbGlhYmxlIHNjaGVkX2Nsb2NrKCkgc2hvdWxkIHNlbGVjdCB0
aGlzOgogIwotLS0gL2Rldi9udWxsCTIwMjYtMDQtMTAgMTU6MzU6NDkuNjU5NzQxNjQ0ICswMjAw
CisrKyBiL2tlcm5lbC9wcmludGsvZWFybHlfdGltZXMuaAkyMDI2LTA0LTE1IDExOjMyOjQ5Ljc4
NjcyODYwMiArMDIwMApAQCAtMCwwICsxLDI2IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCAqLworCisjaWZuZGVmIF9FQVJMWV9USU1FU19ICisjZGVmaW5lIF9FQVJMWV9U
SU1FU19ICisKKyNpbmNsdWRlIDxsaW51eC90aW1la2VlcGluZy5oPgorCisvKgorICogRmVuY2lu
ZyBpc24ndCBvcHRpb25hbCBoZXJlLCBvdGhlcndpc2UgdW5yZWxpYWJsZSB2YWx1ZXMgZGlzcGxh
eWluZworICovCisjaWYgZGVmaW5lZChDT05GSUdfQVJNNjQpCisJI2luY2x1ZGUgPGFzbS9zeXNy
ZWcuaD4KKwkjZGVmaW5lIF9fZWFybHlfcmF3X2N5Y2xlcyAoeyB1NjQgdmFsOyBcCisJCWFzbSB2
b2xhdGlsZSgiaXNiOyBtcnMgJTAsIGNudHZjdF9lbDAiIDogIj1yIih2YWwpKTsgdmFsOyB9KQor
I2VsaWYgZGVmaW5lZChDT05GSUdfWDg2XzY0KQorCSNkZWZpbmUgX19lYXJseV9yYXdfY3ljbGVz
ICh7IHU2NCB2YWw7IFwKKwkJYXNtIHZvbGF0aWxlKCJsZmVuY2U7IHJkdHNjOyBzaGwgJDMyLCAl
JXJkeDsgb3IgJSVyZHgsICUlcmF4IiBcCisJCQk6ICI9YSIodmFsKSA6IDogInJkeCIpOyB2YWw7
IH0pCisjZWxpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9USU1FUikKKwkjZGVmaW5lIF9fZWFybHlf
cmF3X2N5Y2xlcyAoeyB1NjQgdmFsOyBcCisJCWFzbSB2b2xhdGlsZSgiZmVuY2U7IHJkdGltZSAl
MCIgOiAiPXIiKHZhbCkpOyB2YWw7IH0pCisjZWxzZQorCSNkZWZpbmUgX19lYXJseV9yYXdfY3lj
bGVzIDAKKyNlbmRpZgorCisjZW5kaWYgLyogX0VBUkxZX1RJTUVTX0ggKi8KLS0tIGEva2VybmVs
L3ByaW50ay9wcmludGsuYwkyMDI2LTA0LTE1IDExOjM5OjU1LjM3MjA2NjgwMiArMDIwMAorKysg
Yi9rZXJuZWwvcHJpbnRrL3ByaW50ay5jCTIwMjYtMDQtMTUgMTE6Mzk6MzMuNDU4OTUzNTgyICsw
MjAwCkBAIC0yMTUxLDYgKzIxNTEsMTYgQEAgaW50IHZwcmludGtfc3RvcmUoaW50IGZhY2lsaXR5
LCBpbnQgbGV2ZQogCSAqLwogCXRzX25zZWMgPSBsb2NhbF9jbG9jaygpOwogCisjaWYgQ09ORklH
X1BSSU5US19FQVJMWV9CT09UX1RJTUlOR1MKKyNpbmNsdWRlICJlYXJseV90aW1lcy5oIgorCS8q
CisJICogVmVyeSBmZXcgZGV2ZWxvcGVycyBhcmUgdXNpbmcgdGhpcyBmZWF0dXJlIGFuZCB0aGV5
J3JlIGV4cGVjdGluZyB0byBkZWFsCisJICogd2l0aCBpdCBhcyBhIHNpbmdsZSBwb2ludCBvZiBj
aGFuZ2UgaGFjayB0byBiZSBmdXJ0aGVyIGN1c3RvbWlzZWQgYnkgdGhlbS4KKwkgKi8KKwlpZiAo
dW5saWtlbHkoIXRzX25zZWMpKQorCQl0c19uc2VjID0gX19lYXJseV9yYXdfY3ljbGVzOworI2Vu
ZGlmCisKIAlpZiAoIXByaW50a19lbnRlcl9pcnFzYXZlKHJlY3Vyc2lvbl9wdHIsIGlycWZsYWdz
KSkKIAkJcmV0dXJuIDA7CiAK
--000000000000fa11f9064f84a890--
