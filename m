Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B77720CCE7
	for <linux-embedded@vger.kernel.org>; Thu,  7 Nov 2024 11:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730980135; cv=none; b=rSbIiQ3k7nFZpvRXucyVbsAUMourz3IApNrPUEoXDcLK9tqKovFUEeTuBxzlyJSsDXsj8QsarEFxUF2tenX2oF3Wo+99Xg/Z5nGVhf+pH2nIhcgOFYq1Aa1YsRZsBFzPFTYWEoYGT5KxS/27r8R1lcoXQr+4gS/uFvka0P1rn00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730980135; c=relaxed/simple;
	bh=QOvRcaa9ClCUbKw2iregEOY7x2b74a6qHIqj/U+U+m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MHs5Z0ohY3h2K+4N+5cbDl3AfkCu12WKmJwZVaZdGLvqhvpz1lMRa6QwwLvn13vyPmtqaxM95BOcCsCg7rg3XsEBlJLrVy/nPFFHguwgAZy3BvLFbsgDuTaQWFbWg1eTQzjtXq4swvdBOiORsm1miwEED1AQB0jCbo/zR1r98XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gul/TKvd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gul/TKvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730980132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/L/1DDby9dldKVZdC6uWjrN54X6CTuprfUA1WAiNmRU=;
	b=Gul/TKvdDEEd0Z2WpjXwnVOmYQFVeJKt8RgHNQivRMh8Uf4JQGCQRSXberNrJ/4zEJ+R1g
	iuQQrLsDkdDUJQ0fZ/ePxKfE6QQ5Wbp+JdO4lTe2JbMF9gBaaKfGWIhcTYm/zxBuAzo0d2
	GHKz5eLrm2CTjG674Rwley8rBsT4RWc=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-FJ90JmFGNCmsf71lN-KnRA-1; Thu, 07 Nov 2024 06:48:51 -0500
X-MC-Unique: FJ90JmFGNCmsf71lN-KnRA-1
X-Mimecast-MFC-AGG-ID: FJ90JmFGNCmsf71lN-KnRA
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2e2e8a71e3aso1040691a91.3
        for <linux-embedded@vger.kernel.org>; Thu, 07 Nov 2024 03:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730980130; x=1731584930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/L/1DDby9dldKVZdC6uWjrN54X6CTuprfUA1WAiNmRU=;
        b=KYk2HYvbuegmq5krTX8BqznJu+zOkLct/4pdRzm5jyX5Sxy0l6i3Vi92w6CHqiUlSH
         j2Iey6AUZ8y0NRm6JSGcCoyUHuH1rpzDS/8ovylN7ns+nGMUIEw3TPJPDYXj15Kc4a7i
         Dif44hdnVR8aChagnac7+RpTzDuf4HLv6nIohh/ZBE0TZaOblszKCoI4+MA56NkOoiBY
         yzao1LAgLhxcC7u04ox2x01J9bCKvz/IZ5QP9m3MkSP4UA8V6TodmU6xNqJhNvyY+ipK
         7XlraqvkK+UgFdPLRVyKkX+tzCuCnWxwdVBTCJrCDZ0BScN27a5r4JfRAKqP6ctWFSnl
         +sbw==
X-Gm-Message-State: AOJu0YwJSB2h92lyBIBXdSZAFi1+yAaae1oCDEQo7ODuKHHYOGvdWtJa
	EWlv3XKNxwgrskNSX/kRWb9msmSCNfa/0Va0wCZ0CKXWELBspxY/sEeWia9r5elVVn8U6vyAsyG
	vw1Ng/jWVeU8Jip9mO5MP3opiHcouEmDuashEpckxfKkesZj+Bk8kfzcOeLbylsQB2o+p7xKk3w
	L/PId02iGl420188/JSx6nONiFNODPfJ1QwMUN6V8=
X-Received: by 2002:a17:90b:1c85:b0:2e2:9e64:c481 with SMTP id 98e67ed59e1d1-2e94c2e2caamr33234828a91.22.1730980129952;
        Thu, 07 Nov 2024 03:48:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRZJ1bbLeJ/YMxkBDXvyJF0NxUiIHH8QEAOU7ZOunHR8MuquVbkEIP6Em0CoCefvLdX/NtA/ExyCwLPMRI2vc=
X-Received: by 2002:a17:90b:1c85:b0:2e2:9e64:c481 with SMTP id
 98e67ed59e1d1-2e94c2e2caamr33234810a91.22.1730980129649; Thu, 07 Nov 2024
 03:48:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <MW5PR13MB563287E9DCEF5F43C0B2BB0AFD5C2@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB563287E9DCEF5F43C0B2BB0AFD5C2@MW5PR13MB5632.namprd13.prod.outlook.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Thu, 7 Nov 2024 11:48:13 +0000
Message-ID: <CAOgh=FyUkG8UZ9n8rme17ksRu2fhHcZnA3sCfcne3+j9zGW-kA@mail.gmail.com>
Subject: Re: [boot-time] Please check this wiki page about RCU expedited mode
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, 
	"edchong@redhat.com" <edchong@redhat.com>, Brian Masney <bmasney@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

It looks great to me, it's probably kinda self-explanatory but we
could put that it's only relevant to RT-kernels here:

Kernel Version put kernel version here
Configuration list relevant kernel config options here

Is mise le meas/Regards,

Eric Curtin

On Thu, 7 Nov 2024 at 01:50, Bird, Tim <Tim.Bird@sony.com> wrote:
>
> Ed, Brian or Eric,
>
> Can you please take a look at this wiki page, and correct
> mistakes or add any material you think would be valuable.
>
> https://elinux.org/RCU_expedited_mode
>
> If you have a specific example of a boot time reduction
> from using this technique, can you add it to the case
> study listed at the bottom of the page.
>
> I copied some material from your devconf.us presentation.
>
> If you don't have elinux wiki accounts, you can just reply
> to this email with suggestions, and I'll change or add the material myself.
> One specific question I have is whether  this technique only applies
> to an RT kernel or not.
>
> IMHO we can collect information on various techniques on the wiki
> (including data about their savings on different systems and in
> different scenarios), and then migrate the material to an upstream
> kernel tuning guide when we've establish the general utility
> of the material.
>
> As an aside question - if it would be easier to just review the material
> on-list, let me know and I'll send the raw page (in mediawiki markup)
> to the list for email-style review.
>
> Thanks
>  -- Tim
>

