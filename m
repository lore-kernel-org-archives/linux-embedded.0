Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36CA3033E3
	for <linux-embedded@vger.kernel.org>; Thu, 16 Apr 2026 05:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776317944; cv=pass; b=Do4hHy4wN8ge3kkEW8vfS9UsVyFClZ0zG2pJYBJcVgPrY/RxiGsIhO0yVJAinwe3HPgTeouli2RElYWgu7dsabSs8hB36pDgMeD6OAhEc/HWOhSWJJlFojNmnCLbaRgzshjiCm0Pk8uuO+pBOJSXwsmos20P527+XQiFovAeF/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776317944; c=relaxed/simple;
	bh=zmT0m0aZrAnbyyxqRRlG1iQc09EDR+aWYA5nW+ZhXRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0hiUycmb4WqotwIp7GXtZU1KvPDYkHdTNyEEgPHQfu6RnvVU6UT35LGt23c9K5H177C1uCECWV9M0ph2NFtbnU2M5p4kRA94A5m0rT9YQWSsfPsMWqqNN6J1ro2sz4IOVtWBVT9qkS0jixtvxS8aDml5qNG+zhAsMDszBxODnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhTv+Ww2; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhTv+Ww2"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79827d28fc4so78219617b3.1
        for <linux-embedded@vger.kernel.org>; Wed, 15 Apr 2026 22:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776317942; cv=none;
        d=google.com; s=arc-20240605;
        b=gituuO2Gn2CIiUya6sXiuQW5UQtM4NBfO1RVQ6Zko5RESwHDk0Osq7hLRpUC45zyl3
         DnHw2iNmfoeoa8Qp0mlG5fDMLJLtiXaDHqZoinQLee6tKl6B0XAwdu2miomW6Roiz7KJ
         yjmQC1v4iSaqBXEhsAaNIR4SFFshIDz2W1HzA64nP+9qUksSXSOnNX3uPtgX2h97say2
         Oqgh8MORi9oLBpIsjCNx6idN7Nz5ckU9UYF7cG5r5ZRgySRDZZBf7ZRDObHGMXmzzs4g
         ZAgkJzvsG6ZvivPEIZMY+Zy3gh21TDS8yjdojt70XzEPLsBHSwGy37qeXBRjfJtOF6bh
         uE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VJnSZ6WWvjvalfzDkMn5db/CosjOpRicbArPOcNMGMU=;
        fh=LsXExpPcPf4BShpHSYIBtrYIQUn0C93TXkzPeEnsCA8=;
        b=QKF9mXNHfiFg+PIkBLq8UUpSsvyS36OkB1zjKmeI6zRxvcR03f4Nt8+3tCHTjDTmjH
         wUoGnpg4keDzajubbDgB5zcHLbzax4EyvlQwj/jZ5VVBwSxBdXkrcTQFEHmBMsawj5Z7
         k3hAj/3Gg9FSXc0h63QV5Jge935r4pjW/fJGhbs6DYKdpLnkckCI6DeAtjiBHLkAAKly
         9qDmx8QV3psDsCCTGF4UYOz6H3kq3O+IrzIPYYFNePgAuDlsv+9aS8V+/U649nLvUuNt
         +7eY964SwDn6FNYqJOJF15tf625K8kgCRvp7A+7BKpDFyoTByLLI/VBb+dOfGwGlN/FH
         VDFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776317942; x=1776922742; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VJnSZ6WWvjvalfzDkMn5db/CosjOpRicbArPOcNMGMU=;
        b=HhTv+Ww2DJ09Na7DZw7LRs4o6Fkgrdo/CiXWrPcpU+TxpyhFAlcuNgGJjUksrhNrMw
         beEpjL+0shqjS2XZKtGl0X2LiprJPxd58O/H4MmTbAFovOin4qA4YNYaO9dNezw+Cetk
         NZXROINn1zljdK6PAnZi0Gt5KN/e90ysqF//4pBcwz2nzJsNs4Gzcq9qVaa+NV/9GUD8
         224G8v/zsFnKReYEMcOTu0HbS+D5EWuAeC4viwcIekGzr/dIJEm2H/Lp5/VIFDO5mOni
         y0CYcBTGyik6T0wMMuk0F/AAy5LnpoYic1ezckqsy2ad+AnwcgcnA34AS/aP1Cpf35Ib
         8Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776317942; x=1776922742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJnSZ6WWvjvalfzDkMn5db/CosjOpRicbArPOcNMGMU=;
        b=kVt3zU+hhxFlZmjiFWZFF6yrhIwIsjf7HM/wYpGLljwCzEGBxyvQ1ZUDVpC2R560J8
         oyUZLIYFWqQUbokLOzMK6w68aXs5AkyQmGSVVFQtpmCIPcgIP+EHL6AHK4TalHyt4S/G
         e3fSSXOK5lOzLf8+uYk/aZtWxnkE+uOj18VM5D1XaCfFkwh08YFe4fFwBu9ddN7ml6Mr
         nX2o60hmwSFxgYl9qMJQdVWy5GAf1SYRwRQJtfv8kJsVp8Egqou+M87n0+nHfaTbzYMU
         QSpb5nd9igKfyolqrWvBlpsDs74c0xW757zN33CFcpeFYqEbX3acEEHIpapS5c6vUEZo
         ge4Q==
X-Forwarded-Encrypted: i=1; AFNElJ96PzEjz331/Lj4kXMqp/uGWob3TGu4u0Xe5iLOzqz9oShJTvq2AKmz5s2KpdqIxOBf+sO3mgkz/AFYSJt1/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOtcWnyw7mEpc6V05p266zErRyCrWIIjBzT+YINQ3ZU714Pm0
	EawfmIrlDquiG/0Tso0asJoegMsLEWBDvI11eqswsgibqstTZ0YlHSg1ZqzXDHaxaCyemHhT7ZY
	g3iedRTFamcvfEJQOFeNkzW8YIf7a2Q==
X-Gm-Gg: AeBDiev03SMYIEKUeFUqt4b5eNDGiAbu0fjCXiWeJLUPGPCnY65X7SSQ8cf2hOqRebw
	nCKysSi+zWo3VJPbXv1I/80GBfjdv75+Rr2EIDfbVKyv8YXFGrXIHJKoi7PgA85Q5gPc/DIJ73y
	ffpNHt+T/vwgchGtMuEJdFIq6m0OdoYwA4+Muj+30fHj4iI/6IUEY+sS0ABXH7/o8MK4v1ekMia
	XukYXQAiPwSouQ7amcZZ/7SwQ9As0dGtexln30rbxKbbigvbgFLT19EiT1ubdqz+YoV5cBPNepD
	G0hPeaY8O+vsqDSYztk1EbbizKj1Zlaqzv9gIRJdBSk0PWTKe6UBsk+lHtqx5EfEUD86TuGsy9q
	J3xzb+ANcIw==
X-Received: by 2002:a05:690c:6d81:b0:7b2:aabd:535b with SMTP id
 00721157ae682-7b2aabd60edmr177788787b3.27.1776317941853; Wed, 15 Apr 2026
 22:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
 <87bjfjap37.ffs@tglx> <CAJGKYO5R3yM_DtALNd7BYoNMP6RiRJvCfU84vQNPCKz_Vizweg@mail.gmail.com>
 <CAJGKYO4PatnJLPVuwp730hEEqsMCEAravO-cS6xyenMNJEsXtQ@mail.gmail.com> <MW5PR13MB563296D757735B5B84336781FD222@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB563296D757735B5B84336781FD222@MW5PR13MB5632.namprd13.prod.outlook.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Thu, 16 Apr 2026 07:38:19 +0200
X-Gm-Features: AQROBzCw9ADqp4k7ii4-jCV1yTvncIz-x09o0k5rxCDj13hdZbQJRrjrb5sfpwU
Message-ID: <CAJGKYO5TotaDTPYP5Ddoy9cgi2L8emFrNxdxyJNZ_UZm=jfWLA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Thomas Gleixner <tglx@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, "francesco@valla.it" <francesco@valla.it>, 
	"geert@linux-m68k.org" <geert@linux-m68k.org>, 
	"shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Laight <david.laight.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Apr 2026 at 01:12, Bird, Tim <Tim.Bird@sony.com> wrote:
>
> > -----Original Message-----
> > From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
> > On Wed, 15 Apr 2026 at 23:57, Roberto A. Foglietta
> > <roberto.foglietta@gmail.com> wrote:
> > >
> >
> > [...]
> >
> > > V5
> > >
> > > A single file with the essential for hacking the early boot,
> >
> > early_times.h -- it means before every feature offered by the kernel
> > is available or 100% trustable, thus ASM because it is also supposed
> > to fix what is broken in the kernel thus using the kernel macros isn't
> > the correct way to do so. Early times means before the kernel, thus
> > also out-of-it-three or feature support. Them asm (isb) sounds too
> > drastic or not enough for "exhotic" arm arch? It is a template to
> > start with, not a working part of the kernel. When the kernel works,
> > !0 == true is true.
>
> Roberto,
>
> I appreciate your work to address deficiencies in the proposed
> patch, but I don't follow the above paragraph.  There's nothing
> "broken" about the kernel to fix, just an opportunity to
> instrument more code during bootup than is currently supported.
>
> I think Thomas has demonstrated that this does not have a lot of value
> for x86_64 platforms (where the blind spot is already quite small), but
> on ARM64 and RISCV I think there is some value to developers working
> on boot time.
>

My printouts about x86_64 confirmed, in such a platform the timekeeper
subsystem is almost instantaneously ready.


> > The concept remains the same: a register counter read protected by
> > fencing. Not more, not less than the essential. And a bucket
> > out-of-the-three as a starting point **before** the kernel is ready or
> > fixed. Written in this way, does it sound more reasonable?
>
> I don't know what "bucket out-of-the-three" means?

It is not clear to me what you are trying to achieve with V4 but that
patch was WRONG in principle, in concept and in implementation and
this sparked the debate, nothing else. Plus, there is no bug to fix,
apart from a regression that V4 would have introduced. The correct
approach is the V5 that I rewrote for you:

- https://raw.githubusercontent.com/robang74/uchaosys/e48de8fde/cnfg/printk-early-boot-timestamps-hack-v5.patch

That constitutes an entry point in which every developer can include
their own code. Please, follow that canvas especially if your company
is supporting your upstream campaign with a budget. So, lately your
code could silently be stripped away in favour of a more general
approach. ARM didn't arrive in Linux yesterday and I would be
surprised that you are trying to solve an issue that bothers a lot of
people. Anyway, I can be wrong, but 1700 ms to reach the internal
clock settings isn't sane.

The general approach is having an "early times" entry point in which
people that are porting the kernel on a new silicon can have a "ready
to go" way to start in dealing with printk (thus console output) and
timings (the two things need to start with) after they managed to
complete the boot (which isn't always granted and in some cases it is
a luxury not a commodity).

>
> Thomas has expressed concerns about a number of issues with the latest v4
> patch which I haven't responded to yet.  I was trying to reproduce the bug
> report with clang compilation (reported by 0-day on Sunday), and so far have
> not been able to. I have a proposed solution for that, and for other feedback received.
> But I hesitate to make a V5 patch before I reproduce the problem on my system
> and verify my fix for that bug report.

Please, also consider the feedback you received about 0-division: you
might have a problem sitting between the chair and the screen of your
system... ;-) LOL

Usually, we **humans developers** are such a problem >99.9% times when
gcc complains.

>
> Honestly, given how strongly Thomas feels about some of the items, this may end
> up not being accepted upstream.  But rather than give up at this point, I'd like to
> at least address all feedback received and issue one more patch for consideration.
> If it doesn't get accepted, I will have received some valuable feedback which will
> help make the (out-of-tree) patch as general and as conformant with kernel standards
> as possible, which is useful.

Take my V5 patch, apply (or adapt to apply if your kernel version
differs from 5.15) and then start to put your code into early-times.h
when you completed your investigation, you will appreciate the great
advantage of fix the problem with a single command line operation in
your local source tree: rm -f early-times.h

Best regards,

--
Roberto A. Foglietta
+49.176.274.75.661
+39.349.33.30.697
