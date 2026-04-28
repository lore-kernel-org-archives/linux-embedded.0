Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635E435898
	for <linux-embedded@vger.kernel.org>; Tue, 28 Apr 2026 05:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777355816; cv=pass; b=nMl0uQ6ER3JO14UInMIMduLnPmA1Kh8v9INXys7fLc9Sr/W5Vi81kZamYNE2SUVJQu+yP2bLCv0xAGZPj7nz4Sd7ONSxrKbZeZMCqyv4OWXqawCNYzLguhQ1MAlIUfHCnic8/m2jYtdRvKpRCrDqTiqtdPvF4Hh6G85WedgpUr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777355816; c=relaxed/simple;
	bh=OA8p2i70Cu7XMGpA136X+DK3vOEL3O0bmRgOmh6Sydw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keLliVN0MrnnGPHkWCZAmayu53X5CeftvUMy4NIKa2hP9mMZO3ERylmq1LxW3HRHdZDd7oQ5yc2BaMajOOCw896sN51QQKRKUGXW2yxO8pqWu4JIwgJG8bvU4YX7JVaO9bqdZ32cDCY0VxHvzc39Sgqpx5CmaLTPGLq6SMxxJLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVXYoX8q; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVXYoX8q"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79db5e18ac6so127316787b3.1
        for <linux-embedded@vger.kernel.org>; Mon, 27 Apr 2026 22:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777355814; cv=none;
        d=google.com; s=arc-20240605;
        b=aOXw3S3FepZwejmE29LBLRfl+3VySuQNqT9k/AK7KGA0xufXtUa2spn6ELG3zv9lar
         ni0dkGQu+Ik5VJYvFbGiQuiOVLy6Y8Dh7quNZ5cs69bMkN6K8hrF7LaWlfjw3vUG5PO/
         6tsCOLDrlRPMNcqDhrex3LsIo4zCa3/CnIG+6GtCNPbV5DY8Gs2ebn5vohmW9SyHc+zZ
         HqLN+qlZ0/K6hnBw+1KpiIF7T7tZsPRENlAgdd02DqQB+R+511YHA5ykyQcjQhhi/EFn
         pWbUu0EviuN0t8zZbuzjkx4nAudg1DgtXi7HJ+v5ij8L8be2QLZHTA6ZUPCVWOMacMEC
         S6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OA8p2i70Cu7XMGpA136X+DK3vOEL3O0bmRgOmh6Sydw=;
        fh=/BAyWWEX7x4tDgLNdqWtU3qrD6MjB07dxkRsTDpsKgA=;
        b=ZClvXAtRQaDlZqfqIc30I1PZgwqBf+qN9GSc+d77kpbCAVI5b9kHrv78JVVvFgc0Se
         n29f9iMMF1U+O2/kuTMyQjYvwhbxJXuSU+WbIuvis2p12UcIJdF4sLBq/yAChktAcZ2/
         rD9NAzGzNMrw/CH/H0XmF54BpklIx+gfca1La721bNFkl2C+9na3rosuXFVu0B4oeq9K
         KVTp6abDBRMQB9sF5YV0dkOrN/GWTkmVBjllpzMOrsWv0AOV/wm7grGN8r4DmMKUBmA2
         QNR/OlKbckLqzArqgbuTFzhkpHddEZMLPvMUhN2sIB2ni+JGjTwoGgEP5CgtN/TFgeWk
         wSHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777355814; x=1777960614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OA8p2i70Cu7XMGpA136X+DK3vOEL3O0bmRgOmh6Sydw=;
        b=AVXYoX8qNmrzQiJawztCxHiIAxALyY0J+K2GVlMSXHkuvwoxKidgNa7ljtNQQHHl5g
         cCoXWu50OFZfHkOB8dJ7O+nDrDm+1oYUe4RkCoOwZFZbrEzgAewpkHTR+01ahgzUXDDF
         w7UHm4C4Xdo71pPr0Lck4HIlDldtpi47Z/Aq/kK8+ML9NSZotCYIQViVespw1+0y+09Q
         D+9d+sDU+2iXEM/uyQKeodk90PVr86gLTxhOeZnvxMbfJAgdnOjis4+wmJqra1ySF2sx
         nEC4gOJN/xitHB6VdbZuAm6Lifq+VZyyQfdfIaSNtNcxfdJAunSxP3nw41cHVRVbdCNU
         TYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777355814; x=1777960614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OA8p2i70Cu7XMGpA136X+DK3vOEL3O0bmRgOmh6Sydw=;
        b=H1xqu3/M35PYI3tQSoikCzgrqz8bzyaZ01uQo74CsENbGvZOf4v7303xAKI5s3pd8y
         njePATLYZR/1J/Q0nceySdQPbakc/XjKgCjm08NP3xMxDbvRFL/0Ry6uxuyafvYjw8gq
         guEBZ95PiepvW/zU9Z1D39V5uVBOyDMjDyOFE0gYIQnJLoFM4vUYwmGgZkn0s5M5J6+X
         nvwOGS7xfFbE0DC0djzXD7NDvzo7g7azndmUV5so+9w/KVTIqQfgKpnk6QeNoq4cAsXK
         ql0J+9Qjv9rvH+3pbMiPFxUWVqoS4J7yRGKkrOXuzgL+1fBv7D2O0kN/XrztFJJy+9+h
         DUEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cjgTu3MqVSedWRvfxp6dvwH/hJj1zI53UX2WGWTwq2iDvEAgBw2rG/P+0f+iyezUlKb6nBW22GwMJ31e75A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ+dwfp84LXWCLB8EGsXdK0e8gse5oXpH8rdiXxtL7FILVZezr
	lB8Q8hp9pXoFiOrW5QMWzUR4rHbk7KJO2G+xLlX4iVGX0FhEb+Si+1XAwy1Slu74Vbl9bQMuvUG
	z0npyeVyN4dRUyjQwH2iPo0kZw5SOTQ==
X-Gm-Gg: AeBDiesvRQA66qYJFR2PfTKSfxtzRPLXBaylhQP9U7FZYUJVSi6ulIGXO+eCw/+kU/t
	F/jJuH7kFqfTf6BueIr+Z7XUbMsPD+wgmO+XEZW+3fe53501HmQ5FR47amwBmpDvtDNJyp78tM0
	tNogfJH9Eklb1mISlrNw8IopjDO+kS50Q0hubpNpG6qIr5SQaMFkL5AH2ldM0geZT9STfpfLprU
	jSM8nAdgtVDhkj8h8Fu8BHQXY9+jRbBJhipiXoqqc2r+g0snLsjb8HLwpyQOOOEn7O/XNK9VMd/
	WiPoDoiSfKbfsMOGTr+R9FD0PVTJ4gchEVznAEuEM+MEoN3AuqVs9EXWuowbKLkOGOdiVOr6xQt
	vZ/rYu489AgB6hhhrjl38Ep/XcqyqMOE=
X-Received: by 2002:a05:690c:6387:b0:7b1:9036:a23a with SMTP id
 00721157ae682-7bcf30013famr14885717b3.14.1777355814368; Mon, 27 Apr 2026
 22:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <CALqELGz3qJ=KtDmBHMRP4NMSmmeZGKxk6SpTCQGcvGru5Dn0SA@mail.gmail.com> <MW5PR13MB56327ABDE42B1CB0D02B8D5BFD372@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB56327ABDE42B1CB0D02B8D5BFD372@MW5PR13MB5632.namprd13.prod.outlook.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Tue, 28 Apr 2026 07:56:17 +0200
X-Gm-Features: AVHnY4Lx4RO0RtWZhacUdpyEoez8-XBU9iTxoj6zUr5Xs-zgXbtodubetmIgb5A
Message-ID: <CAJGKYO4mVOXrsXfco5uzOLAmyBRLZ5e6FmPuriA7BnrXV_JAgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Andrew Murray <amurray@thegoodpenguin.co.uk>, "pmladek@suse.com" <pmladek@suse.com>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>, 
	"geert@linux-m68k.org" <geert@linux-m68k.org>, "tglx@kernel.org" <tglx@kernel.org>, 
	"shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Apr 2026 at 07:42, Bird, Tim <Tim.Bird@sony.com> wrote:
>

> In my experience, although the kernel's blind spot is relatively small on x86, it
> is quite a bit larger on other platforms: 183 milliseconds on a raspberry pi
> and 1700 milliseconds on a FPGA-based riscv board.

Human time is relative, it is 1700ms but what is going on during that time?

The same thing that happens in 0.183 seconds in a x86 powerful silicon?

The blind spot is the same. Just the clock of the CPU is different.

Considering that 200ms is the time in which an entire Linux embedded
system can boot by a Qemu/KVM

~> https://github.com/robang74/uchaosys#quick-start (contains boot example data)

I would suggest that it is better to cut the boot time by an early
CNRG initialisation (which also brings in security) rather than worry
about a short (in terms of operations, whatever is the human time)
blind spot.

Wonderful that U-boot can provide reliable early timings but U-boot
isn't granted. From this point of view considering early timings as a
bounded case for debug/hacking makes sense

~> https://github.com/robang74/uchaosys/blob/v070/cnfg/printk-early-boot-timestamps-hack-v6.patch

as well as cutting down the boot time by providing early CNRG
initialisation. Solving practical problems and creating easy to access
bounded areas of experimentation for what we cannot control. Code or
patch aren't perfect? Humans aren't perfect, but improvable,
hopefully.

Best regards, R-
