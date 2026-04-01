Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C2026CE05
	for <linux-embedded@vger.kernel.org>; Wed,  1 Apr 2026 01:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775006206; cv=none; b=mIJdQE5HwKTM8ZJjmCaODEkf7Y3CIXEA9wjJd8y5yeqkHGTb6iIRWcQOnyAzjbSrS4Ks5rXfGzzY0CT44OhHaVWB2aSUlX6KIPU898PDFiNPMoaK5pH+WP5NZhb1UU/aCELni/eNlBB1vmtN78IQJcnBO5apy6rptGARVDIRD/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775006206; c=relaxed/simple;
	bh=eCTiAhsQL6PA8v572n1hO00OOtmW6jJQVgnsCrmC3u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2QTBLSFVRDLmgz82xITbJLYsAmkwtNWgnUdKuDwjgP+bbdr75rkA7FgHmkNIteDKEbt9ARVcCgkjS+MM1/lk1uknbuUbYDB/LFSyOvvuwT1dZxYSvZB22UK+syFq6Wu9C+W3bE3UiURAMCk767zDTqLAACVe+/buQGX3bDk0Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iG9DixNZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IdXvJ0qV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iG9DixNZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IdXvJ0qV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775006203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=epSOefwJIjMsdmPqlSPFmwyq58owk3obauEPHRMgwuw=;
	b=iG9DixNZLzzCg+sXr+MWcRc4r5XdlkFbqwoSoDZsUF/DSB7eAia3072SLVt5c52bV2xa3M
	5jHAnGvsDjuff4NQob1NaIZOK+Nu3A+fuJhoeDolcJxlYMttuAiIkq0Lrrb6dH9E+my1O/
	Eb/pIlZiTSFA+iLj0YA/6LLT0tyvjoM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460--uL-Xr5oMO6vM2K8waxEdA-1; Tue, 31 Mar 2026 21:16:42 -0400
X-MC-Unique: -uL-Xr5oMO6vM2K8waxEdA-1
X-Mimecast-MFC-AGG-ID: -uL-Xr5oMO6vM2K8waxEdA_1775006201
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090cc6a7d2so209225071cf.2
        for <linux-embedded@vger.kernel.org>; Tue, 31 Mar 2026 18:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775006201; x=1775611001; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epSOefwJIjMsdmPqlSPFmwyq58owk3obauEPHRMgwuw=;
        b=IdXvJ0qVBvhcSIq0oSIssmJe6VHnUU1k4wS0Uv0UBiLYyrsb1hEAgStIBENzYObdJW
         9t0jHR0Zj56InorECPDvlvg0EH/Pv8JBEsAMZ17l6inds9p5Z7u+Ko30V9lh1BhjjrKj
         S71cg061H1Nbc0CdehG2IrlsTEnR8Q6Xx4nnEdTwzqT7MPk0e727swSVnjFRmdjnKgof
         FF9i6IasgK36+34McjUaOhkK1SI+FeB38REKr84UefjTZu0nzt/0mnSfBfkIlHMvWt9u
         zZFC8zdGjJUr9pOv1AM8xlg1FMMsZyf5i9rZ7Whhu/3qnrycEjqJm9UCGMI8GC3xZIY2
         E0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775006201; x=1775611001;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=epSOefwJIjMsdmPqlSPFmwyq58owk3obauEPHRMgwuw=;
        b=nuqF84zs7IjAJUTinfcxEIFI/f+7sK/TS/n6Yt+PJEJWkKcOo/Euyu6zl6hM0FovHc
         Eg3x3uMioAohE0JaMt2ysMAGmkQs4R5Myx+8VKafL9DMxp4pfafub/yb9Vp8ehqOgf4O
         bpT6GPg4Zg82NvQoW43lQ00l0SQdyfHaMYNPzsRxdS+sPRsAOG1vWGo353pIDTcNENt7
         qbKeTFCFMtynOu7plo++2jfya1tLXGXWAdR0KWOWqQcrbGR9e/DuKfvlUjLkaW2pdqcx
         wEL0atbokFpoEJKp8FpWD0H993+3DQM+DrM7UHHbi9R8rtVV0/PMY6pq2S4EGnF66hBA
         IawA==
X-Forwarded-Encrypted: i=1; AJvYcCXNLTVbWzc+X07J8n86d/5FdDkRndU4+mpAllQDDj2jjYXQhqH3adWMDuMzMJLfK389/vRnecMtKVIQgrgc/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNpUUM2gOEk77sfrBt4DsdX9xm61K2VL3V0s/g9iXI5e2y7ePF
	nRllxfjn9K40UI1Kk8r9+ECQuKd3RdVeQG9CiqT1DGUs3+dD53yW1NnMZskWJFV9wk/4VRlmDp7
	FJ8zSsTkSJV3+iAG5aqO4e6388JaxW0PTJMLZwbRJ4XVIXd0u+6038WLLcfHpdVTztLaG
X-Gm-Gg: ATEYQzxt5EXUBm9logXjgUrAfGbAwQq5aTuicBedBiZOkQlwElykuHw2reGrsBxpkq1
	GrSHAhDvtCeZ7Vj0b49FCbcBf4X6OLbzy0mkVaOu1h48b9JofsuXjg0utcqluh67UeSqqzaf4pc
	NOue46N/sYp1LSA0HXnlk2NLODyXnIrewz9ehDqcAWzhYXoxlPABq6tdJD0PCV7cPl3wud3Z30K
	iXYyei8MeRLd9ley2dtQbHWxsux/xrnJ/LE7+iTlVxAO9vsxMAlaJpXGFpae/74l9pjvpNtdznz
	Ru0Tv5vZgS62ABTujXjGyXDy5+KE7SSp/pTqXZG7SuF8YEDl9fz1upVNnuKH2mfLwd7ykGaTpPk
	Jf5RtoVbzQToOOAIGNSyV81QcM3gwvg6z2Zau37UgtpeXPrQJpnDDq6mK
X-Received: by 2002:a05:622a:a14:b0:50b:2900:6644 with SMTP id d75a77b69052e-50d3bcf4d88mr28067531cf.51.1775006201395;
        Tue, 31 Mar 2026 18:16:41 -0700 (PDT)
X-Received: by 2002:a05:622a:a14:b0:50b:2900:6644 with SMTP id d75a77b69052e-50d3bcf4d88mr28067281cf.51.1775006200958;
        Tue, 31 Mar 2026 18:16:40 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c67beasm103506511cf.5.2026.03.31.18.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 18:16:39 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:16:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, "pmladek@suse.com" <pmladek@suse.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	Shashank Balaji <shashankbalaji02@gmail.com>,
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>,
	"francesco@valla.it" <francesco@valla.it>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Message-ID: <acxx9Bt0N3nhtLgN@redhat.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <87zf3ud92r.ffs@tglx>
 <MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyuvboo2.ffs@tglx>
 <MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyus9xft.ffs@tglx>
 <87ldf78tc5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldf78tc5.ffs@tglx>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Thomas,

On Wed, Apr 01, 2026 at 01:36:26AM +0200, Thomas Gleixner wrote:
> On Tue, Mar 31 2026 at 11:10, Thomas Gleixner wrote:
> > So the real good question is whether the extra information of how long
> > that earliest init takes is really relevant to the goal of optimizing
> > boot time. The expensive part of the boot process definitely comes after
> > that.
> 
> That actually made me curious and so I hacked up the kernel with the
> patch below to compensate for the difference between:
> 
>   x86_64_start_reservations()
> 
> 	i.e. the C entry point of the kernel and the actual earliest
> 	point (ASM entry code aside) where the kernel can take a
> 	timestamp, which is modulo the sanity checks in the PoC the same
> 	thing, right?
> 
> and
> 
>   tsc_early_init()
> 
>         where the upstream kernel enables TSC sched clock today with all
>         sanity checks and enumeration in place.
> 
> Here is the result on a bare metal 256 CPU machine:
> 
> [    0.000000] Linux version 7.0.0-rc3-dirty ...
> 
> ....
> 
> [    0.000000] tsc: Detected 2100.000 MHz processor
> [    0.012482] e820: update [mem 0x00000000-0x00000fff] System RAM ==> device reserved
> 
> That's ~12ms of time which is not accounted for in the overall boot time
> until the machine reaches the init process:
> 
> [   12.289141] Run /init as init process
> 
> That means we are talking about ~0.1% of overall boot time in this case.
> 
> Starting a 4 CPU guest with the same kernel image on the same physical
> machine and additionally 'no-kvmclock' on the command line to make the
> hack work:
> 
> [    0.000000] Linux version 7.0.0-rc3-dirty ...
> 
> ...
> 
> [    0.000000] tsc: Detected 2094.965 MHz processor
> [    0.015122] last_pfn = 0x280000 max_arch_pfn = 0x400000000
> 
> Unsurpringly it takes a bit longer because during that phase the guest
> takes a gazillion of vmexits.
> 
> [    0.995082] Run /init as init process
> 
> Now in this 4 CPU case we are talking about 1.5% of the overall boot
> time.
> 
> With the same setup and 32 CPUs in the VM:
> 
> [    0.015150] e820: remove [mem 0x000a0000-0x000fffff] System RAM
> 
> The initial phase takes 30us more than with 4 CPUs, which is in the
> noise and the machine ends up in init at:
> 
> [    3.329398] Run /init as init process
> 
> which means in total we are up to 0.45% of the overall boot time now.
> 
> I'm honestly confused. May I politely ask which problem you are trying
> to solve?

A recent example of where this was a problem was in the creation of the
arm64 linear map:

https://lore.kernel.org/all/20240412131908.433043-1-ryan.roberts@arm.com/

The boot time was all reported as 0, however we could tell there was a
boot delay based on the timing of the firmware / other linux logs in the
serial console. Eric Chanudet @ Red Hat (CCed) used the cntvct arch
counters on arm64 to track down this unreported time to the linear map
creation.

With this patch set, on a 32GB RAM arm64 system we have the linear map
creation time went from ~350ms to 25ms. Again, the boot time was all
reported as 0 in dmesg.

What Tim is trying to do is to identify if we have points like this on
other systems, or if boot regressions are introduced in the future.

Brian

