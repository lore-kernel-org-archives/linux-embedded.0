Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE592392806
	for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 22:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776291942; cv=pass; b=WpRyuy2XKp9R/aZLKtN1raEArx40Qwrz82IG96bW6Z1L7Sy4g7fA/ZKfWSvyQJg47CljmRZC5VAJ6+Vi+IVAg3O/TBHVE2ihzIz37uUq7+/s+MaUVEkKmVO6+hkjfFBxqIAKm93v2xPJYasAmOLtIpYV5uYp31bIAteAJ6vjwtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776291942; c=relaxed/simple;
	bh=6yVPlIUJhJc0h4QOTQ3ByAAXEhgFdF6Qm9HUn/Q82LA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/VPQSSW1bS7yuqOZglAr8Kte74idJUrbmMo4HapUsPnyf4NupbRuw9diBGDYpLttLg2b2a3rDpSE2ay9ucEdtFKCu9eyfIFcAovcFg2g2FIzaBf5EQcblYraib4yR7he42+YQLohoCaHyaNWv0xTGLVgrPI7tpN2y9AMSe/cdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQyMw+GY; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQyMw+GY"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7a43424f861so72607387b3.1
        for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 15:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776291940; cv=none;
        d=google.com; s=arc-20240605;
        b=g86xGhdrgwBKGqNDcctMdAViZboE8VOVHEVRyh7BvnxSWOz1z0gEjdv5dNEEXAwkWo
         x6F/6y7FErVrIT6QBmVKpF+CrMU4luK7XxVUXTp+JL0X179qajnhRR8y9DCMCpYNIwLf
         RltmyItp6YsYA4yr83CAKN7GmC5XWzeTKqqV6l8pvIJ8ctW51mbJsHw5O7tS4JZaqibE
         fRJAdC0ZsJ5OmcIjMJ70bMXq47oDb+rzn1c9JSrlr/wMX+4obDyFdfWSLUxkRxss/RTN
         UfkG7F/VDMlUA1bFVl48np9+ZVy3cdX7xhAbrG+3yjxzk66U+0thc4BlKSwH16YT/thx
         CBBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6yVPlIUJhJc0h4QOTQ3ByAAXEhgFdF6Qm9HUn/Q82LA=;
        fh=oaq05LgOf5pir2nBfi1hQTLYAszePtivgRB0+BP8+PQ=;
        b=hRfC8NHPR7GmFipDq9C2x8C+n41JdPqS9aVNXuNu+Z8piNkMBfOpifMIJX7/e2HSAN
         mEPAmKrwJBc3DMbhVtGh1K0LOLy5P0TQSEzGqTGv+eUbgULwidysWSwbyv14gzueqmIF
         p8KzlEvot2ExPne4cc2+tIOs2FreWlzQeBo52ANBGFRuUDy38MZ2LiXQgtDUevylPWqP
         5KFdTJM6XCwXMsi2IMAuTooTgFwZfjiEQgYjwpNXRvznQ1bD4+ghzZds9o1/kC5W5h3Y
         ALUwr/2TVQQDtoJccUOEPcHCGI3MgzmD44G3OyymXwPnh92ETuBp463nVKskKSxdX54m
         yL+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776291940; x=1776896740; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6yVPlIUJhJc0h4QOTQ3ByAAXEhgFdF6Qm9HUn/Q82LA=;
        b=FQyMw+GYDIIAUgh14w53g3/FgusLexFDE6McrvhVu/odrI7pIFDZf/MbEpW+ITkJQM
         yygKenvvzKqOFlIVIpo3A0EM0CelAo/HnlJMfamGzbPo8K1dt8YOQmxM2xPQPSVb6B0d
         VsVmaL4sIXx5BPcJsjcLrTqEb/j4UJ0wQleBokwJtksw3+qv0h9/PXu+6G38X2fRL6OB
         1TQLnGFcinm4Y0d027EpGVnZmK0W7uRF2/u6FbGMSYDtkYj8/aONbY/X66d+VU39UU8R
         cK3sGOIE7H2ViytPGqQGE+lkFwXDXLubtt8HH1nyen9NSnLQc+MJC34y3wzt20l56Mhf
         iJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776291940; x=1776896740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yVPlIUJhJc0h4QOTQ3ByAAXEhgFdF6Qm9HUn/Q82LA=;
        b=D91ikJUy2PD+IWDXmAKTaq/gw9rbGzs27qUburMp0HYw5sp3EMIs6rl8UVO2MY70Sw
         Uryb1wXDiiiuC/zP3+vZYZlmiPiY/R8YJjqsw5c+/MLMsaHHCETaFdFrD/n7PUsFW4nd
         jOLr3zkGwSkJUyStASRooGE3wIONodN7NcznU1p5rtHOCxGfmlGjhsg2BvTPqIkHxm6G
         goVrSvP/dmmAjxz/Pu2OilXWqZmWT8a/ruajXwOI03OFIw+UQ+RFykvZ+tVhY8eOWFP6
         n1cNtZVUQTrvITQQ5IxlogRJPiECVjg3H1NTVvuQPufFONAjkpMhgV3OxAz2WebOxJfw
         c8Kg==
X-Forwarded-Encrypted: i=1; AFNElJ9Z0TYxSwflJiGuqJVx/VpSohBmIhVcc0isOFhVzzuWpK+0Q6+vJOV82QOJAN9BzHYwEePiB/3X1oX9rAHfAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybfkaciW2z3m2Z5A2eDqU6hnbJxRZqBx9xha5fjvaVqCTtjsAF
	5HyYJONeegYQhIBz8Boeb0AtvaPJlNkufs7uqEe7ejfXZudeQm+0sWdMdnyNSTyL3PhiAl1P0c8
	VvXRgvvae5Sl9lxmJkZypf89ApyZ+5Q==
X-Gm-Gg: AeBDieusdhuY4ZPNkNdk4fWuXKmwKmiCtkKVtBpGCc5pfMilyn7GAJkSQNWSe7k14t+
	3ueQlZIn7XDCwj1OB9RUZNSXey7nHvqGsszZxHidq2RW8RxCSVa75g49ozqYDnKCIVl1O2PLK9L
	NFuqggrjCIvxQz/QhZEbTOdGdsNwmv5zpcgz2iPlFoSmEe3OK0fHAJmYfxcSh1iEfpUPMLaps4Y
	2pRdcFxwtVK2Sr73M61LvzXz1iKvDw3+eFS1a0UorEnE8/jnIBfX56DQCkpBBwmTLcN6A6ZphHI
	kBzDGD26ueYI+bzzBfhAhGXP7v5ONn9uSShLhzrn6hu47TSFwZQvpSygJCuuqlvuOLN9Rqo4cwP
	kidUvCqqo2A==
X-Received: by 2002:a05:690c:e64c:10b0:7a3:7ad3:3e9e with SMTP id
 00721157ae682-7af71476e86mr188364857b3.32.1776291939937; Wed, 15 Apr 2026
 15:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
 <87bjfjap37.ffs@tglx> <CAJGKYO5R3yM_DtALNd7BYoNMP6RiRJvCfU84vQNPCKz_Vizweg@mail.gmail.com>
In-Reply-To: <CAJGKYO5R3yM_DtALNd7BYoNMP6RiRJvCfU84vQNPCKz_Vizweg@mail.gmail.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Thu, 16 Apr 2026 00:24:59 +0200
X-Gm-Features: AQROBzBSqRWf3WOFLX5IBUP8DZJQNXty6Uluhac-K_l_DqFG_FgGgfdbCFfaoBY
Message-ID: <CAJGKYO4PatnJLPVuwp730hEEqsMCEAravO-cS6xyenMNJEsXtQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Thomas Gleixner <tglx@kernel.org>
Cc: Tim Bird <tim.bird@sony.com>, pmladek@suse.com, rostedt@goodmis.org, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, francesco@valla.it, 
	geert@linux-m68k.org, shashankbalaji02@gmail.com, 
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 23:57, Roberto A. Foglietta
<roberto.foglietta@gmail.com> wrote:
>

[...]

> V5
>
> A single file with the essential for hacking the early boot,

early_times.h -- it means before every feature offered by the kernel
is available or 100% trustable, thus ASM because it is also supposed
to fix what is broken in the kernel thus using the kernel macros isn't
the correct way to do so. Early times means before the kernel, thus
also out-of-it-three or feature support. Them asm (isb) sounds too
drastic or not enough for "exhotic" arm arch? It is a template to
start with, not a working part of the kernel. When the kernel works,
!0 == true is true.

The concept remains the same: a register counter read protected by
fencing. Not more, not less than the essential. And a bucket
out-of-the-three as a starting point **before** the kernel is ready or
fixed. Written in this way, does it sound more reasonable?

Best regards, R-
