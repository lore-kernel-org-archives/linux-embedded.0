Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F237E303
	for <linux-embedded@vger.kernel.org>; Wed,  1 Apr 2026 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028992; cv=none; b=JlpBRtJGRQFeJ1xDpfjYyZNK33o5oCYSSNkzlqdxqZhvCdUz1iiWB8MMjfqE0j8uZ64XY/j4fARnVqYw42o5rHPW6P0fcmIqvSGQ/ql4f4nwZy9G1hvput/rbNB8QYPpx/RFzRNkOvZcppCxMNQzLLHRorT2R79HfQXZPEcMv78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028992; c=relaxed/simple;
	bh=03pMH0msu7QqwMOb7timFaCoFjDeFL9jY9VqfYAFYno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAnbQaon6Bysy8LjbMIaK+vHgDeZrH8zdPshV4UAbJVBgW6+W7bXBzoX3lbgUyCA5I3IVWpjU67djgfO6HmKPeLFLES3D4Dc7oSm+lQkIMnyLJtMFDnRnHlWcFAHvKhq8NwU0dx96afb000TU3hTE0E6AkDqNnolJjXPwAwlGgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56d933b555cso40397e0c.0
        for <linux-embedded@vger.kernel.org>; Wed, 01 Apr 2026 00:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028989; x=1775633789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lm/gOBq1BOtU0l+lQHbn3uykBxd9dDqHQ8KczsAsC8=;
        b=eXHBzlC0R838jx/eUVOLczypPbUpSt8V5C6NC6e/ueH2UN8TzNvkZ+dift/CNgZmsS
         l4c50ToUi8Sv3WxkZXdPx1kxpV9oNClsZFf5IvWGvJ1YFenBDyIrdIgjddzwfT3lkLT1
         aeW428qOCCAFJMkK5xdmwqJ0gWBLSSF0ANtFKL85vtxfM9tQSyCaJ7Bq6Y9/5wVoZy0j
         azDhAfHDEbrQ4rNUwuoZLgkmDnk9cmpCFDcgHQDQiYMXnW3o9pR9u5RstF+6DRLiNYBr
         O5LljzCeJcqEYc24oYYsylpRc+FWuoTS8XGMyWlUPLGXcT1xcPrCFpmyLSdl19LGcxxn
         8oCA==
X-Forwarded-Encrypted: i=1; AJvYcCW0/AcPPuzwpl9wu8YLXsMT///POIcvvn3ce/Tv/YeWXiWHYbUnn1T7Ql5pZmZs0jPjRcjClXpAuJ8Ed8q2aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSVV4Y3jPStds1EYqIe2ZfiXnNjELwuYrrhA6eKH+v7MzeBsxx
	HWoYzby8PIZy7chJXUZo/Yy+uVbxYFcx4kMkCnfOFPLs+mbNPVjSjlR6y2EJ2WbS
X-Gm-Gg: ATEYQzyRLfyhMhp/H+ablY7e15FsaJ9RURuusfQXwlXdd37n5hXKOzyBF9lO+IaO4Wf
	j59hauzDkgWoJlPfpeZQV6ZqI6WBI6BirdltvShCtkI3ERC0sJwNDX7/rC2C7HKoDWExMK9+ayX
	fOksHVVHPvlszLG092ZRWYlbeu39LFKe9m5xqFjeGGzWNADeeteJkboLzxftgEGobr1RsmkgveH
	MrWXYlopWCDi9YZQAElqdfDGWNsLZwFwU3jlH7wjg6A9CfRRiuVDFBC6n74545MIHOOK1/1zy9f
	ARVs/YvUiEg0yGOu1rV4h3L1+n7qaqfENzZ7HlLaI1V0KG9RihSsH1uZPHKJPjzkvOJsajfqgr6
	RdBgOCx1cVU3ICbo0pgV6m33TOI1UrOrcZAR5oMscuHYx6R3TB2i9be0RBgIjgjeY+F3zJNy+FR
	I0S5r24vRVrg3tsCjF47ZUuM+sGRBCn1gNnPJR0aph3ElV17qX0aDNIHTwuYAFZJeM
X-Received: by 2002:a05:6122:a21:b0:56a:e1f3:7956 with SMTP id 71dfb90a1353d-56d8a8f1e97mr1038433e0c.11.1775028989279;
        Wed, 01 Apr 2026 00:36:29 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d885eac2fsm3358009e0c.1.2026.04.01.00.36.27
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 00:36:27 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56d933b555cso40385e0c.0
        for <linux-embedded@vger.kernel.org>; Wed, 01 Apr 2026 00:36:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEOAPepOdXf+xHuNipjQgKlgij8ScEOLj1G95qJhr/YC0zaGKx5P2lutNQxkdU7lQGOfiUoZFqN3QeKDQLPg==@vger.kernel.org
X-Received: by 2002:a05:6122:4d85:b0:56c:d757:a045 with SMTP id
 71dfb90a1353d-56d8a8e7b14mr996573e0c.9.1775028986820; Wed, 01 Apr 2026
 00:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com> <87zf3ud92r.ffs@tglx>
 <MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyuvboo2.ffs@tglx> <MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyus9xft.ffs@tglx> <87ldf78tc5.ffs@tglx> <20260331200519.58930ece@gandalf.local.home>
In-Reply-To: <20260331200519.58930ece@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Apr 2026 09:36:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXk+xG0r4vQii9LA4XuhD8qLRYrDbJGAO8-cGzHqXEM3Q@mail.gmail.com>
X-Gm-Features: AQROBzDQD1ygl7oaV2nLE-1X_VG6hPhFDcZu-FYXUOUe0ahQzGhsojb2V8vFnrg
Message-ID: <CAMuHMdXk+xG0r4vQii9LA4XuhD8qLRYrDbJGAO8-cGzHqXEM3Q@mail.gmail.com>
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early boot
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Gleixner <tglx@kernel.org>, "Bird, Tim" <Tim.Bird@sony.com>, 
	"pmladek@suse.com" <pmladek@suse.com>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, 
	Shashank Balaji <shashankbalaji02@gmail.com>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, "francesco@valla.it" <francesco@valla.it>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Apr 2026 at 02:04, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 01 Apr 2026 01:36:26 +0200
> Thomas Gleixner <tglx@kernel.org> wrote:
> > [   12.289141] Run /init as init process
>
> 12 seconds! Holly crap, that would fail every Chromebook requirement we
> have. In most cases, we shoot for a 3 second boot up and 8 second max.

So that's why my Sony HD Handycam never boots Linux, but instead still
resumes the system Tim suspended 18 years ago ;-)

Looks like the old CE Linux Forum Boot Time Working Group needs more
blood...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
