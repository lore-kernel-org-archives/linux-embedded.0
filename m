Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529B036C
	for <linux-embedded@vger.kernel.org>; Wed,  6 Nov 2024 00:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730851804; cv=none; b=PhOYHiH5yCQXtL8y3DDcuxXG0QyQWmZlMZ3MjfXQfBa+NDugImfmkLKI5325JfVOC3KELERoKQWcxQ0nGqbZEWFYILQJoVZr26VQFRDivupADEpAH89zzRplhZBfc8ulEwtr9oWX1RzgcfQQ/xswDr8UzRj9X3Ge7ZaW+wGgBDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730851804; c=relaxed/simple;
	bh=EhONxpoabnBdZIC+pPf3rO5NkMwnpcmCJFF6G7tieUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4BVP2p9hjQUdy7dL+gm3rJbdgyQN9nkF+Zix2KwXMcAdSn2LGDkB5mASRCxY//Hi4vwcFuSzMFCL2bHRumyiuWftgEJDsWI/XXBmBqHIthbZYmX4O8BIFv6MPqvNI56+bVK87wWqwaSTEef3qaDmWMSfDPUp55CwoMr/74lbHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YbSsnkO5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YbSsnkO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730851801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcvvbuQpV6OUCQzxbQQxlxp1LzAk7op1D4yotoJD2ro=;
	b=YbSsnkO5wZ9+Mp10nwNNsJq7+rVYTxRyxVhFw0GTxu8WuIlovIqpow41PnAu/gDwOq2M6Z
	T5KUy3jVmvSDMkky3vtEiXFFw/1RiwLRKw1Lm+XW/OnFpM9LtEQ9HNq5zpJ1m812/3GCnq
	jy+pQT/p1e0gSrAX3jkjlMG8X6GvMcI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-h1d3Bh2DN-yZZ4UxAGizrA-1; Tue, 05 Nov 2024 19:10:00 -0500
X-MC-Unique: h1d3Bh2DN-yZZ4UxAGizrA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbf039dccfso103288536d6.0
        for <linux-embedded@vger.kernel.org>; Tue, 05 Nov 2024 16:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730851799; x=1731456599;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcvvbuQpV6OUCQzxbQQxlxp1LzAk7op1D4yotoJD2ro=;
        b=xPV9NLTF1slx1SfjhAKI/V1usphgZ3iWLpdxksGWIF+hb8RA8DOAZc4yhQ7hyRslFh
         VHgcyktBhVotL2ZJx61Nq69v21QVw/Yx72iqOh3BlcYsiTn6/TvARkltw0ofEao8GVUe
         GFi4VtM0ypsNJyaH5qQoWWHmnGqgWdVaS3Nmi0i0SaOC9Tuy04GPpCA/jGm03Bf2U+n8
         vDg5uoPN3famLnPyPtHtPR+m7eUgBwWsfmpQ4k+8vrEyQYb2/vew2RdfuVotVDQkeTun
         hSDjLNhRBVLNv1JYUhuE7Xx3WGX/vTgsOL7QTU0IPVB1aF5yAEqfyWcHzLr/2f4NeKWa
         d5RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV9sXT9DKD0lzy/J3GRO0mYcP9VG0OGrgJ3GEAOcT4omnlTRq43yzIdZEjPqSl4Rp61AI+IB9J0zaQTJPesA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfLjitde14jYt5o8E476V8St8Crjr4E8q39p54Lg4LDmGgYwHZ
	quvCKGMwwXK5zfbXED5r8vfJkh+2rKrSSsaO+Aw6c1cZfKQnnxJJt/TP5IzDUrdxm5mRfUkaf1F
	Bz/uU70zWoEsdXPQRus906Qhnp/WsBc2b2Rf9d+XA5QeGzdVOhVEGdy5rTlRhYutFxp+dtLhx
X-Received: by 2002:a05:6214:469a:b0:6d3:45ad:d850 with SMTP id 6a1803df08f44-6d345addb51mr376583786d6.26.1730851799156;
        Tue, 05 Nov 2024 16:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXBHa2z2eWneZW6mLo2gXLkw1di+NHGIzzjCFZJq2VQ9t7gcqVWFnTuedpuwJcGgzGcdsJIw==
X-Received: by 2002:a05:6214:469a:b0:6d3:45ad:d850 with SMTP id 6a1803df08f44-6d345addb51mr376583676d6.26.1730851798860;
        Tue, 05 Nov 2024 16:09:58 -0800 (PST)
Received: from x1 (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35415b1edsm65837366d6.75.2024.11.05.16.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 16:09:57 -0800 (PST)
Date: Tue, 5 Nov 2024 19:09:56 -0500
From: Brian Masney <bmasney@redhat.com>
To: Saravana Kannan <saravanak@google.com>
Cc: "Bird, Tim" <Tim.Bird@sony.com>,
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Boot-time initiative (SIG) thoughts and next steps
Message-ID: <Zyqz1LBDXZosrjle@x1>
References: <MW5PR13MB5632321E93B031C0E107DB38FD4F2@MW5PR13MB5632.namprd13.prod.outlook.com>
 <CAGETcx_c2nfFQ++-FcsdUdLUo3e-oe07MkLgbuyrnq2FPrcsXQ@mail.gmail.com>
 <MW5PR13MB5632E4EFFD802E0839027A51FD4A2@MW5PR13MB5632.namprd13.prod.outlook.com>
 <CAGETcx-Y6LHpZZUeexeuSF4RJ1E2MDtNtST=ytEUPAj7kKzwFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGETcx-Y6LHpZZUeexeuSF4RJ1E2MDtNtST=ytEUPAj7kKzwFA@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Mon, Oct 28, 2024 at 03:33:29PM -0700, Saravana Kannan wrote:
> On Sun, Oct 27, 2024 at 6:30 PM Bird, Tim <Tim.Bird@sony.com> wrote:
> > > On Fri, Oct 25, 2024 at 11:18 AM Bird, Tim <Tim.Bird@sony.com> wrote:
> > > > = wiki account =
> > > > The wiki where we'll be maintaining information about
> > > > boot time, and about activities of the boot time SIG, is the elinux wiki.
> > > > The page we'll be focusing on is: https://elinux.org/Boot_Time.
> > > > If you are interested in helping update and maintain the information there
> > > > (which I hope almost everyone is), then please make sure you have a user
> > > > account on the wiki.
> > > > If you don't have one, please go here:
> > > > https://elinux.org/Special:RequestAccount
> > > > I have to manually approve accounts in order to fight spambots.  It might
> > > > take a few days for me to get to your request.  It's very helpful if you
> > > > put a comment in one of the request fields about this being related to
> > > > the boot-time initiative or SIG, so I can distinguish your request from
> > > > spam requests.
> > >
> > > Can we instead keep this all a part of the kernel docs instead of the
> > > wiki? Couple of reasons for that:
> >
> > Ideally, we would put some material in the wiki, and also
> > produce a document - some kind of "boot-time tuning guide" that can
> > live in the kernel tree.
> 
> This is the part I care most about being in the kernel docs. Eg: what
> configs to use. What commandline params to set. Dos and Don'ts for the
> drivers, etc. So, good to see that is an acceptable option.

I'm interested to help contribute to a boot speed document, and I
suspect some others at Red Hat are interested as well. Personally,
I would prefer to have a section in the kernel documentation over a
Wiki. Besides arch-specific recommendations, we can also contribute
some boot speed improvement techniques that we've done that are
specific to RT.

In addition to the recommended configs, I think it would also be
beneficial to list some upstream patches that improve boot speed along
with the kernel version it was introduced in.

Brian

