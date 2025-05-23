Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A12F19C554
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 07:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747983904; cv=none; b=n4QwCRFJtYDvZ07cy8AUlrD/bphMqaJTBU4YxguY4Ac1D1IwPEUfNsphvgZXs+6nK4HMeFzEbvbFco/icdBEs1dZuJDCCViuhfG8F7AoQ8bMODJ8O0DlbcR0bW3shC//ouClY4VXiv6lQ3M9Z8VmkIQmwIXrCim/VQbzZCkMvjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747983904; c=relaxed/simple;
	bh=yi6lMCX7wo4/F9aQy9Z8vbd0MZCsULoh96ceZikTZIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DB50JqQsbHAroPwBgxCZPVeXLXan99kqjSxpzKuERWYM57PR8pK3cm2fEIUggw4o77mVR1lqMX1Kce7/ltNThMLh1HYkfFG4WqzHTc2DIfUA+UOstPgGw/ENtoK/1AA6HfUw7QN2gpR1lAzhYNpZ6Co/QNoS9HfgAKqVRGF+u5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-527b70bd90dso3229453e0c.3
        for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 00:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747983901; x=1748588701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDCWfMLwckXFjFrQ4F8ePVJ2jSzV+BF9Aq3XlfVQcyQ=;
        b=Zs4hQ2C9j5n1S/paXJJ08SvX/WmXh4F4LZbiofycpP/F/3cPdGXrwSzE26neXRA/Hu
         4eoBDTQxh0hujp4CW0ZAemrkogBWf0r7lZuzV1qA/xKcPLXaOigvU8XUgFGVB4dhhN/B
         jSy1WKX17K0kznY80SHmZER2KWICFu5kdbPyP4qMgMGn2MKPinr6JocOM8DthxLr8Nrt
         Wjf8+gOPXW9WdQyqPtgeLRfT6enkVwDZXJuefuVi6hLFLE2GExstxmwF9nYPg24Hd7ZS
         Njro8/AXfbUAL7jJQ/NDDw5trAU8PBxv8GK0EKqHrKBgI8U90pM8UZn0ATFMFa2pBvHq
         f5PA==
X-Gm-Message-State: AOJu0YyM4o0ofOhUTZGR9Qvih5LaVQu6HpcwYQwlwhmSsx/Txg/NnFxO
	hdmaTxDAfhcN67xxVvcbVcGlMnqFj6QffeuWTa0WKMCqyOCqN2YSzCHY7s0H5sNg
X-Gm-Gg: ASbGncvBYl3vQST1fi3G5xeud2zhXweYCHpWXezVLhr0zHSdqHq4stOOaJ3YpR71GSH
	A3df2rRRNwKNnA5LkBMeLTpGgAk9y4CSOhBQmkqcpOiQxy/v3UeRHBrsx+p8nfyBBPHck2HaVy1
	SbEz6+5TDegFam5WpGTg2cTragxMVuK/VdkXe6AzYtkZHtm1XpB85OPWqcN3N3G3Mmdd7wU03GU
	bQiGFv6PHQ6OBsKU31AWHFh8ljXWnAy+3OPq0jrKp1OSKTyqI2oNdIoLnTa9+NYPbGUni6LlCO4
	RuSy7kjVNCFJuNuJrMWpJTSdIv4DetPDbW5FfDCP2OLLrKn88d6ameLvRVHdmLhAFgafxvikzVk
	K8VdXqe3Jz5sN43RQ9QJ+PX8Y
X-Google-Smtp-Source: AGHT+IFN/0HacVtF/utd0Jcc09gN7KcjzFc3dTDTy7zCyDROd6YB1m6miAUrqua3nV/39fBr/Zs1TA==
X-Received: by 2002:a05:6122:4b86:b0:529:373:fcb7 with SMTP id 71dfb90a1353d-52f1fed20c9mr1336754e0c.10.1747983900781;
        Fri, 23 May 2025 00:05:00 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab6c0f1sm13013590e0c.41.2025.05.23.00.05.00
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 00:05:00 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e2b21d1b46so1430423137.3
        for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 00:05:00 -0700 (PDT)
X-Received: by 2002:a05:6102:8014:b0:4c2:20d6:c6c3 with SMTP id
 ada2fe7eead31-4e2f1983b8cmr1335416137.10.1747983900408; Fri, 23 May 2025
 00:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522224223.358881-2-francesco@valla.it>
In-Reply-To: <20250522224223.358881-2-francesco@valla.it>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 09:04:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqw9igYU-iPFbA-uP8-LrmZocUKT4k9cb8+py1gFp8tA@mail.gmail.com>
X-Gm-Features: AX0GCFtf3b8aa6og2wwX1AlyzeYhUfHM_X9f54_8mBeX5gG-B57QPwdy7aGjrn8
Message-ID: <CAMuHMdXqw9igYU-iPFbA-uP8-LrmZocUKT4k9cb8+py1gFp8tA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Add driver for bootstage stash
To: Francesco Valla <francesco@valla.it>
Cc: linux-embedded@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Francesco,

On Fri, 23 May 2025 at 02:25, Francesco Valla <francesco@valla.it> wrote:
> after the discussion on the "Unified Boot Log" topic during the latest
> Boot Time SIG special meeting [1], I tried to mock up a driver that
> reads a bootstage stash saved by the U-Boot bootloader in a given memory
> area and exposes the data in a user- and machine- friendly through both
> sysfs and debugfs attributes. Details on the interfaces, as well as
> example output for the debugfs interfaces, can be found on the
> documentation that is part of the patchset.

Thanks for your work!

> To use this driver, a memory area shall be reserved inside the Linux
> kernel devicetree as follows (possibly changing the address and the size
> of the memory area):
>
>     bootstage@a4300000 {
>         compatible = "bootstage";
>         reg = <0 0xa4300000 0 0x1000>;
>         no-map;
>     };
>
> At U-Boot side, following configuration shall then be set:
>
>     CONFIG_BOOTSTAGE=y
>     CONFIG_BOOTSTAGE_STASH_ADDR=0xa4300000
>     CONFIG_BOOTSTAGE_STASH_SIZE=0x1000

I think this can be simplified further, using either of these two options:
  1. If the bootstage@a4300000 node would already be present in the
     DTB used by U-Boot, the two CONFIG_BOOTSTAGE_STASH_*
     options would no longer be needed.
  2. U-Boot could add the bootstage@a4300000 to the DTB that is
     passed to the kernel, just like it already adds/updates the memory
     nodes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
