Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6CF304BA3
	for <linux-embedded@vger.kernel.org>; Tue, 21 Apr 2026 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776790571; cv=pass; b=Apoiuo7vSzw36ysAGZadLosT42LqHp+J31iLdyZXqANyRv2MbBsAVitBRI3h7scA8Q2Wf5Kriv1J3BxyATEW2SkzCIF+FnJBo5rKnADBE0KA5f7ytRGCQSzz0Ainbt8ItAPMXdGnZbcxgxQXV8GaTfBBypR+O49QvAP3i+bscHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776790571; c=relaxed/simple;
	bh=SH2w0/kTm8jhbUJr7RV5OTecvqQqYk+tbCpT4DTzMEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ak0TlUnrBFQF59ixN6bS8CyZ6v7ZVZNYGp5C0Rv6QgdvLXMpRBY1sp63hLP7t+h7VJtkP5cyhPhE+HWMNOKSmFGRi9HtVBwC9Oezd2FY1M9GfQg3DjWUwydLk/fX8AGHg9pwCPIJlFOkokhJltFuY3pTTIolDm9lhOF+J9qkKB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AL/MCfAK; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AL/MCfAK"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a74765703so41737387b3.3
        for <linux-embedded@vger.kernel.org>; Tue, 21 Apr 2026 09:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776790569; cv=none;
        d=google.com; s=arc-20240605;
        b=I3FYVPPGY6key24EgilRBY0tyIyFYOyR4gK8A4c4plswQzKd8wl2E+98Ep3Tmnlm8V
         2CYaiMnzkfF+GWM7lYgWjHOqp9W+11pCS0Y89hUCLNxeL0q66dctCUNIGZsKS6mwkSaa
         hYwTzUCNb1mieQ3KczPhP5bawduTSjGVQlHb2JsbuaLYhKUOfFtKapCn9/u34ObjDqhG
         KdGGSioybP57p5DDB3+YX5m+rkM2Td3n/ttLNFZv2ZiYrtOlt1KLZ1qg+FIzlf7IQJnR
         CKz2Y8gs34arhnwWHolkOiYLQxfHTzdHgiJ6fEAmelcGD88lPJBTUInLHFwwqUz+a9i4
         KdQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tY4MJ7/HG54q0UHfHkm0Xw09EWGlhU+XPFtom+m/6Yk=;
        fh=PAUrMba1/OXsYCu8NpfCHxXaHryyJ8D6Oml3y1yQRsw=;
        b=FzXstjSQwQAmhPZQIuipmcgS+Yclfp20243xUwmJrdDEmY0zyMyyxD+XTv5nqKs0QW
         AIjXspI6sIxhDu48RlIHTK4BDtV3AXwq+hmxj/LhoXnxvp30AQu1EvNJGGAVn3+olYBw
         3V+3dxkbOMMn+fIclrWLz641t3d3bhCrmRaBZ9qMXM55EDxW1SfnWQXBCgDXwJ1P3BsP
         1+1P8bGBcPRer7eJtPpwfKGQK9lu/qIFzQLKnTVg2rWegc93Zi8xKUc4jNcdzDsil/xA
         NAzy7iTLd/VoyjmBEp+3xYQQxzwOBkQDzs48H50VKD8RGBoK9dGd3Pkjk71a76tjYfWS
         k3WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776790569; x=1777395369; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tY4MJ7/HG54q0UHfHkm0Xw09EWGlhU+XPFtom+m/6Yk=;
        b=AL/MCfAKMsJsIuslQKQFmTjsC+Hjc8SAk4rbmU+Hq79pvc1aYRqO3AH+zmsn0zfxJu
         dqZo/15NcxlRJ8mXbe5tvwHREp2wEtLrsjgrZVtS/iyxOYJq1IBShBB7Jok0V2t+0FAL
         Ir1LSTuoWvefIjh8G0hxBxmL5m6fds/GajXWqTRXC36Xm1VFXJor8CYnrSn7grYYWx5/
         OIYewsNN9VxxYZCF/JGwFdl0xONeAzUXAr9fcoZQBIgtr10XLbdm3RD1Xpm5Etg/zXm+
         rtY1Ip8/PQ8a1EmaR7YJ+WMLDwPUagpE2Y7AG7vnVAmWTr0IAsQfs+zZGhdSmorMm9ya
         cQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776790569; x=1777395369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tY4MJ7/HG54q0UHfHkm0Xw09EWGlhU+XPFtom+m/6Yk=;
        b=dZPuz+UE+/9rbPHpsRfB2gL6rpa6zr69cGsynEzdb9nOiKkFCa7bZtN0cXsVKIqmVq
         C/stuyTimdDRcUocyjl5lne1pWXLrr4SoAbrmxd2QcrB0xmPTc+ARFrH5TudEaWHWRbS
         eqrBGZTfNnhDCdGp8wlI33cLxdldzRhEeEJqg5KNkGvt5JnNBnunWvfIqNPAbsL5qS9c
         mFCw6GJomRxCQPgVL/QOzzExaIGO+HiLTsSRItUeyO/DdB3dMC7ue0X2IGpZjWOsYbaE
         AEziLHkdHuvO1T7RPSSDN2wxMg/GfxhW/jWy2pHdpUp+1qQvPkOy0z6DQ2he8FGsYnFB
         0kdw==
X-Forwarded-Encrypted: i=1; AFNElJ9iIasOHoqmUvBFSgn2J0giIHUbbMb+YNhW/Yl3PcqVOFQLFarvcgAknNsJWjieQuHs/o5IkqAVMVn+nhawog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNNG7BKA2BcBJmdG4edP1oaC75Vli4hlsM1AM5cQDF8NBfg2Kw
	g31xWXYDyFToW0f4Zv2GH+7Q7ky/ImLuGEiXIIKrv8tfalo3SF7UF+KepolfJUYunkRGX8IqKtT
	iCZ5EEMUiNxn7q9bGdgENwJYLG8VDOg==
X-Gm-Gg: AeBDiesq//gDOCpAqNKE3VAoDL9oXWiXqqpTQXQEvEw2ADLlK0bXuK+ZpVJR0eBRKjn
	7Q54Rjbr79RVABDPtaJZIkAtG9pgj+7V6NkBMHNKm4b8sM4kyx6/ODfsA7p5M/bwzvHHe3QCX1O
	ITZXRAgoIq4IicFhU6Qfd7AvbaZigK3RIm5JpYkGoMpwnJWUiwN2XKGsWVzYiuqsf2g6/EqqYue
	oDdJOvd9Q+Jegg7Wpc7Xe7vNHF2IAwdMnSyL9rAIMaz+WYEH42aZDDGjKC/JVQT3p5hsZSt2CG7
	fpbNW0pR6JlO00lrx+pRfqy9z7pV1L9zxhBR3ux2wrcygiCaEzXvnWG860WuTY1EMaRC9sJx5KK
	GJZrtAYqHp746Se+vZpA=
X-Received: by 2002:a05:690c:e651:b0:79b:cd56:6a0c with SMTP id
 00721157ae682-7b9ecf314f9mr132454707b3.22.1776790569113; Tue, 21 Apr 2026
 09:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <aeINb8-a83R3QDXd@pathway.suse.cz> <MW5PR13MB5632F6F08DB75F7CCBC2AFA1FD2F2@MW5PR13MB5632.namprd13.prod.outlook.com>
 <aec2a2RPO9rYQa0D@pathway.suse.cz> <MW5PR13MB5632E5E9176349336E9AD376FD2C2@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB5632E5E9176349336E9AD376FD2C2@MW5PR13MB5632.namprd13.prod.outlook.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Tue, 21 Apr 2026 18:55:30 +0200
X-Gm-Features: AQROBzCosQRFNijzkZf4sgK2rcQKa3koCMsbPC5HclhCy9aKuzuqJllLpgHK-Wk
Message-ID: <CAJGKYO5Y9GvFE3CxnPRHtfrqHqns_J4qH-Auih5mb1Y0Wnxjvg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@kernel.org>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>, 
	"geert@linux-m68k.org" <geert@linux-m68k.org>, 
	"shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brian Masney <bmasney@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 16:13, Bird, Tim <Tim.Bird@sony.com> wrote:
>
> > -----Original Message-----
> > From: Petr Mladek <pmladek@suse.com>
> > On Mon 2026-04-20 22:18:29, Bird, Tim wrote:

> > I think that we could print both notices from the printk() code:
> >
> >  + 1st one before the very first message
> >  + 2nd one before the first message with a proper timestamp from
> >    the local_clock().
>
> Yes.  That's a good solution.  I feel a bit dumb for not having thought of it. :-)

The very first message is when the kernel receive the hand off:

[    0.183957] Linux version 5.15.202 (roberto@x280) (x86_64-linux-musl-gcc
               (GCC) 14.3.0, GNU ld (GNU Binutils) 2.44) #1 Wed A6

The second one is when the skew happens

[    0.184241] kvm-clock: cpu 0, msr bac001, primary cpu clock
--------- time skew here ---------
[    0.000001] kvm-clock: using sched offset of 55985760 cycles

and also the second is already there: printed by kvm-clock about the
offset (3x the legacy rdtsc reading on a KVM machine, in my specific
case, at least).

[    0.000005] tsc: Detected 1896.002 MHz processor

Soon later another printk explains how to convert the early printk
timestamps into time, using the CPU clock. An information provided by
the tsc subsystem.

Everything was already there. Adding an how-to read data into Kconfig
description would impose the need to update that how-to and
differentiate it among arch/cases plus it might be wrong/useless when
working on an unsupported platforms or not a yet delivered products.
Moreover, it would put a burden on code janitors to explain stuff to
expert kernel hackers which is a non-sense role-inversion!

Therefore patch V6, again.

Best regards, R-
