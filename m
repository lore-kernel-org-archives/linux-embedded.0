Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E17FD
	for <linux-embedded@vger.kernel.org>; Tue, 29 Oct 2024 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730207877; cv=none; b=r8AKEd3BqPw2liDRNULe9y2r+JW0MYrX3GxspgN6bkmrx33goW7q8I+kjOv0nANbRoGmEWJwKsAdMG+t2LS5x/EqzlZH7oCHIMKXDuaMCnSka7AvosOdn+tf6Z5tBDcE3JUPV1oNJYyvCilYDI6qfQeGVlOW3eoPCMiTWQZuwBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730207877; c=relaxed/simple;
	bh=G6NE968qZlh0EoXgzeEZCqzP1dafKTirwCy5J3i619M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SPGImzc8pPQpez+YIdOPAycAoD2ue3N3N4ecD6RLFzqQSaJNdY4ubxBzENeWjRnd8dhbKcLKk6U/w8bPUvkwQgb8CYtyb+CXpvQJMDLo01rEiIKfrgJOZ1aNAobo/y7OpaOlX1rv1aBy3HWIDOfIAuIox1MfI9PomxBIxq9gjcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e39bf12830so40342897b3.1
        for <linux-embedded@vger.kernel.org>; Tue, 29 Oct 2024 06:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730207873; x=1730812673;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mpaSZcFMM7chpl1Neswcfu/YLG4rnRm2x0arnhTQW8=;
        b=pWV/hcbBF7/PC+CGohECE9+Z0KJkVcmyZ2/PpdzodeKipe/yAuAN84z2XoeglpGgao
         NshrcwXiHE1svDN1ANECFAs6OOj4PzUiDaQSLVx2k2ym2HxUwIYL0JMTumFvcptmv8A0
         6KIipnBA8kJ6LrAi+XuScGBm/7ePBtqBECnySn5DmEE9OuigySjQGiJjYdYF3LSvn8F4
         DRMvjVLi0t1zMpflfST9jY6KaUgwEO+6ROjGEnXnkvSYvvSJIUKGww0tEctpynZZeTO3
         vDCqUH++eg0YhEdP4Cd9RduX/rk3SRyaz++VEtnCe3ve4G6C5jQdr4QD8PXiz2CJ1F6l
         T9wQ==
X-Gm-Message-State: AOJu0YwaEgOajWktPbEW4ExEtFf0tNirqVDQ5+Xe39ldn0aNP9Mjx8fo
	0BGwReC8bUtIp0vhb8DAmLHWtVtSJpb9W1IFULHmA6v0gmaGFujiYdmGMhMP
X-Google-Smtp-Source: AGHT+IH1r7m75VApaL+Q7qU7j/a4dcfGOAL8SuD9z1KMVVxu6Q39TOLHG0dbXgDkl+Df0CZ3mjHrDA==
X-Received: by 2002:a05:690c:7449:b0:6e5:adf8:b0a8 with SMTP id 00721157ae682-6ea2bf7221dmr14956087b3.6.1730207873328;
        Tue, 29 Oct 2024 06:17:53 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6bdc010sm19562207b3.41.2024.10.29.06.17.53
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 06:17:53 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e39bf12830so40342727b3.1
        for <linux-embedded@vger.kernel.org>; Tue, 29 Oct 2024 06:17:53 -0700 (PDT)
X-Received: by 2002:a05:690c:dc3:b0:6e2:4975:43bf with SMTP id
 00721157ae682-6ea2bf58466mr14476287b3.3.1730207872911; Tue, 29 Oct 2024
 06:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Oct 2024 14:17:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXN3J=_xFQkuhcLxhniNK0LqTH9rFM9Ydex1TUufuBw3w@mail.gmail.com>
Message-ID: <CAMuHMdXN3J=_xFQkuhcLxhniNK0LqTH9rFM9Ydex1TUufuBw3w@mail.gmail.com>
Subject: elinux.org wiki style
To: "Bird, Timothy" <Tim.Bird@sony.com>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tim,

https://elinux.org/ is looking weird today.

There seems to be something wrong with the stylesheet.
When trying to open it:

[b554204955cf12a33d7baee1]
/load.php?debug=false&lang=en&modules=ext.echo.badgeicons%7Cext.echo.styles.badge%7Cmediawiki.legacy.commonPrint%2Cshared%7Cmediawiki.sectionAnchor%7Cmediawiki.skinning.interface%7Cskins.vector.styles&only=styles&skin=vector
Error from line 689 of
/var/www/elinux.org/htdocs/includes/exception/MWExceptionHandler.php:
Class 'FormatJson' not found

Backtrace:

#0 /var/www/elinux.org/htdocs/includes/exception/MWExceptionHandler.php(216):
MWExceptionHandler::logError(ErrorException, string, string)
#1 /var/www/elinux.org/htdocs/includes/AutoLoader.php(109):
MWExceptionHandler::handleError(integer, string, string, integer,
array)
#2 /var/www/elinux.org/htdocs/includes/AutoLoader.php(109): require()
#3 [internal function]: AutoLoader::autoload(string)
#4 /var/www/elinux.org/htdocs/includes/resourceloader/ResourceLoader.php(141):
spl_autoload_call(string)
#5 /var/www/elinux.org/htdocs/includes/resourceloader/ResourceLoader.php(751):
ResourceLoader->preloadModuleInfo(array, ResourceLoaderContext)
#6 /var/www/elinux.org/htdocs/load.php(51):
ResourceLoader->respond(ResourceLoaderContext)
#7 {main}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
