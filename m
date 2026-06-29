Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDE33B2FDF
	for <linux-embedded@vger.kernel.org>; Mon, 29 Jun 2026 21:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769410; cv=pass; b=Sdi8WNXNJIGBHkQ3pTHGNLEBuG5XS+lbyu7U5xIXdXjaHYTJGj/E3Aj234F0AZtgMvlB6xK6UJR9u/TAbsvBVpc4Kcgegkg60w+xukgW0cQXGuK7oqdVpwhi6Q3JorD36BE9Y/rO9e6hkena5z9xHeGj8/r23V2rtTJhzYsUyoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769410; c=relaxed/simple;
	bh=z9T7jNjf4lLVTZ1sWjgRaME8qp3Y63IO6dlh0dMw+r4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqsHeLS+LA0bEy8X9ijgQ2vvZbU6JyTqmS8HsOtdwRcjSXJ59ruggiYPTmH28q3R4Z+LB7t3Jb9bodEln+w0x2UDWLRi20pXizUPMafXo2aB5cE7ImQGfphkbbZvK13DIJSXpuS1on347ed5RCysDIhN+tkxBRLFBlqv72nW7i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o17MyhZp; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o17MyhZp"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6647bc8f900so4520673d50.0
        for <linux-embedded@vger.kernel.org>; Mon, 29 Jun 2026 14:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782769408; cv=none;
        d=google.com; s=arc-20260327;
        b=nLRsK/G+1KtKsL1WIdD+AKeIUFb3ys8SpHHP0ep1m2VwfxYpK4J3zxSQm7GYTnroxF
         alPpPOyikOE22TcNMiUlTYDF/H4Zx36BcQmYo3HUTHmn03CVfuG5nIHZLcSHsLMhri+6
         98jjCYi7I0G/U8Alr4Z/Ein52ggV7ZHlizzURDBLUanSm0oYDVphlKdPlRz+nac2yBmW
         +bIJPG/irtMImO6WX9tvH2VA1/STHZHuEWqyJ1IIXf89UxvePjrN7el2teu9mWaFW2ez
         2A9IWUt1BQtQkrD74ECbFDro7uYZdmiXmMHmKl4b3qokDZKxlnE9I1wB3PQ82uIZTyFh
         9uCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nXw9LPv2noPf4blPOlCBYscHqkFcyfrFoMm5hfBpBbw=;
        fh=9Xsyv73m2gm+L4uBBA+44PJ/UKLIXq97DnHFn14jr9M=;
        b=FCtvD4Gw08O4NEvnMroJhoUedT6ZPfXosV0SOV8IOXtQTM9iEkfI1ldxaS5Bzlz4Ja
         tm9uPElLWhneAmuFHKUTDj+SBYV29cdE+Cf18zdFQ70hEm3+rWup42XpEp6TJQ81D2Rn
         66tpj/HClNMjZ/jZfTJqZEAVloRiZfVwPF2adW0fXfD900ZArb3TiO2OC+p9oBC9hdF6
         QNbakXhj/kwi1HrtkBr8J+3GzpdNz2uaK/bFJT9I8GoOiKqdTVt3Z9CgExaRtlZ2jgbh
         d5EiRGuH2FDG8phZWK6ZYelyS4u68rRRUErMagy3RcICuvsCMLW1U2zy86gBrJpTDTzS
         u7Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782769408; x=1783374208; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nXw9LPv2noPf4blPOlCBYscHqkFcyfrFoMm5hfBpBbw=;
        b=o17MyhZpvl3A3xX6l8l53Sp3JH2NcpTTuWpviPpm3sSx3FzlHJxWiv7ks/egaL37w8
         kwom7q9Jtf4M2x548CSBvtMSDKQJxVlGSbeQeLTZfS3jfrqdzCXlt81xZ7V2MMERqPJM
         li8KfC2z3efGCuZGMKLvVBaNT90xg2IUqu4+U1v/GemKVPY7m1qhGtWU+YowtlZLqIqO
         Am6Azft48Q8R30U/96/Nv3DQRdjAiVnEDF/aFPYKdTGALMIvgCQjXy9BotxMHuHc6A8e
         TNNRD33ckGULz4aNgUJzlB8kyFETMtk2tBsmgrVHH1UOeXpBjjCY054D+465A6ja+jEb
         t83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782769408; x=1783374208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXw9LPv2noPf4blPOlCBYscHqkFcyfrFoMm5hfBpBbw=;
        b=SBwhkAHkB3nCLC2f+F9vacFCwr4iG2FMAnu5TxIjRwXMvUSHK+8J9RIhTXtgH8EVks
         HynNyjFMR0p/s91LcmZIPRINxOOq+CY7WHzbVs3TCoCk8CwVRosryHMXm4Z3SDsOKNiK
         T2O7NFfvSwypnVhfozJMpruyxBXGE9kVNhnQG01p8mT3mNV3vWy9P/lSoeV9ERLnuLzr
         4AflzMoMObHw90iv5Vb0NJMWhwVnHiMdEjeh9iMwmlMvp0vjxHkq4ZAB5IiLa7kQoefb
         tVxFb33c07tIILhx/I+aAOk40cA98vECP4nCFa21myUBkwRuCALLsYelecE8rzZ39R9E
         PVgw==
X-Forwarded-Encrypted: i=1; AHgh+RoOVWqsB2plWo6eThO2Vi7ExmcWrurSaNY8ftq4a7WL2xsCJFeWVo4eRmTmMC704ybodtZNIU+x7QXfubqj5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2kIPFWsMy/DAP6Oojdce7WQT9eEBwpPzxTS/bcaL4UZzuaoAo
	x1BNOxQimdBr5f4cGmVFwxAlea4hrjeNM3DeWqWliwLsiqHKNOmi3LImgSakB28CFkyZAu3TpE2
	1gXx40cBtGfZvx8PreIyBs3Wu011Mc8uWTGs=
X-Gm-Gg: AfdE7cnWEg/T0trcYVkcx6Fzryuk2OzyG5g6cLT5T4igrxqljaRHNklVw+Fj36y8Q1f
	Sx3yvbRqO5FOf8Im+e8XtUK9QIon4r54iD8YEcyeNj4zdU1/I8RpvlxVUC2Os2IG4Tj62bjzTlH
	uGiM2q0OpJk+6uHXXATytaMM+X4GFCj+eMJq8tDN1FbhMaZm9l7HxXXs1b0F47O74aCvBAzov8i
	g+DQ36CQNCIPoczZZWbjfEqd7dMUSVX5LGDFrVcyouDGgVengKBxuZYcyyz3Icq9lVCqJ0+YVNM
	ylzu4H5OCUZWLASOhWJQ+2LQbdRa/gs+tfu/oiyxoj8yYmOy5GeYmlDHUaeAYPYkuQNxXww3mxO
	owMgv8zctl/3GjvhOCCJ3g4qGoUvV
X-Received: by 2002:a05:690e:440e:b0:664:bd7f:1322 with SMTP id
 956f58d0204a3-664f97c0547mr1121446d50.28.1782769408437; Mon, 29 Jun 2026
 14:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f35774f8-4194-4715-8321-dc2fdfc7fc88@landley.net>
 <MW5PR13MB5632F0D9C8E8A12F2C24B64AFD012@MW5PR13MB5632.namprd13.prod.outlook.com>
 <81e4aefd-f052-4a52-94b5-36030b26c358@landley.net> <MW5PR13MB5632FDD1833ABA105437D02AFD162@MW5PR13MB5632.namprd13.prod.outlook.com>
 <9e3f48db-c827-4892-8e41-656e9c60ff89@landley.net> <MW5PR13MB563232D40A099D798E698272FD152@MW5PR13MB5632.namprd13.prod.outlook.com>
 <064b8c64-ebd7-4210-ac28-8be27773c8bf@landley.net> <MW5PR13MB5632865579893156ABF6BC75FDE32@MW5PR13MB5632.namprd13.prod.outlook.com>
 <42eb69fb-928c-4e74-bc2f-aa04eaa97681@landley.net> <MW5PR13MB563273DDAC28AAB1FDF887DAFDE82@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB563273DDAC28AAB1FDF887DAFDE82@MW5PR13MB5632.namprd13.prod.outlook.com>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Mon, 29 Jun 2026 23:42:51 +0200
X-Gm-Features: AVVi8Cf4rS-w4UyYhpzf0Tdj8BAEsx7BodrzsRfLJKkFfqy68T6j5JQaAsZH_co
Message-ID: <CAJGKYO5-Z_8O-eHNVz=dRTZfYj78huraFCdkvP1qfrLnN8E_Lw@mail.gmail.com>
Subject: Re: grab-boot-data.sh fails on mkroot (zombies abound)
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Rob Landley <rob@landley.net>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jun 2026 at 23:00, Bird, Tim <Tim.Bird@sony.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Rob Landley <rob@landley.net>
> >
> > On 6/18/26 13:40, Bird, Tim wrote:
> > > Hey Rob,
> > >
> > > I tried grab-boot-data.sh on mkroot, using 'toybox sh' as interpreter.
> > > I got some weird behavior that I'd like to report.  (I was planning on experimenting
> > > more to see if I could determine the issue, but I'm going on vacation next week.)
> > > Maybe you have an idea off the top of you head what might be the problem...
> > >
> > > When I use init=/bin/sh, and then try to run grab-boot-data.sh, it always
> > > goes zombie after execution.
> >
> > Do you mean rdinit=? (Or does 7.0 make init= apply to initramfs now?)
>
> Actually, I was doing:
> KARGS="quiet initcall_debug log_buf_len=1M HANDOFF=/bin/sh" root/i686/run-qemu.sh
> (which I presumed, mistakenly, turned into 'init=/bin/sh' on the kernel command line.)
>
> But, upon closer inspection HANDOFF is handled by root/i686/fs/init, which is a shell script
> with this line in it:
>   setsid -c <>/dev/$(sed '$s@.*[ /]@@' /sys/class/tty/console/active) >&0 2>&1 \
>       $HANDOFF
>

The init ROB fs is referring to toybox's Rob Ladley, not Rob(erto)

https://github.com/robang74/bare-minimal-linux-system/blob/main/update/initrobfs/init

feel free to help yourself, R-
