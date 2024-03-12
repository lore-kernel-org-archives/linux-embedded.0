Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BA27C09F
	for <linux-embedded@vger.kernel.org>; Tue, 12 Mar 2024 16:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710261264; cv=none; b=cU3f2HMxKpRzcbkiHwkCA/yDKEYEmlEriRtKMAj76rw8FJfwavXlXoCqKQJv4i86F7mkgW9fFCDdKe5m5LO2bPogAgqlVHEs3Pdgpftj0fx4Nj8vFewQsqX+5+UbrqyfgBEZlkkol1drQUtZGKBX1cNDF6UaDB2bLVa+oKBgsvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710261264; c=relaxed/simple;
	bh=lDBbv2iO6Et8InBc92ml41h43CgACZ439e+y/4Wk/sA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=IMauk+p8yV9iLh4OyKQ/sv/q0OGWFz8NeYcvIvafrIpGeCpevuzUXdAE+lZ6OnNU4EOAxJYjylRDiaQhKFoWSGRFeHf3nRROGbzVt3h8tBB3jEahIuUX/jZDxg7DRskJYRcNmkKF8zEuKekueMLmwNFEqIjW24Z7K1vTJRg4zr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=l8QJj7Iu; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="l8QJj7Iu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DfHbX34mqkyQmyDjicDsPqNhzuh8vzlPuomXVRIS3U8=; b=l8QJj7IuYJ0y7muAElTE5ho3Ei
	Ub3A+8oUg29dKi2T/8UKPTcSFENqms30Y5LMH4Rii7taFJ/FE0DNH5+6lluxT0YJ7NiH5sc4e6kWV
	yQFIs4qdOs6w6xUkVKyohKUQuIBT/LZfnY1sobU64fxwB+Ssasvb8MMQ8YqgdOXbHPx89nXJEGhbk
	kQV5uCk7izLDeDN9j+ADCedzFxY6yulJ6e/jdgj7dfOk6WbbNQOa4L0rxsjA/5sibzeD1/Jsupt87
	U5cmZBoAAc1d881joH4Eb8zi7b5aP5dSyvryQxe9kK2iLXNNFRMIvEhiE1HWovz5bM0g2xQgmRv+p
	YFhimZ+w==;
Received: from [167.98.27.226] (helo=[10.35.6.228])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1rk551-00EUYf-7i
	for <linux-embedded@vger.kernel.org> ; Tue, 12 Mar 2024 16:34:19 +0000
Message-ID: <cfaa5c50-fc76-4766-8ace-4c92820d3baa@codethink.co.uk>
Date: Tue, 12 Mar 2024 16:34:18 +0000
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux Kernel (megi patches for PinePhone Pro)
Content-Language: en-US
From: Tanvir Roshid <tanvir.roshid@codethink.co.uk>
To: linux-embedded@vger.kernel.org
References: <a5b7e74f-fad6-4a07-a2cc-614cdb75046e@codethink.co.uk>
In-Reply-To: <a5b7e74f-fad6-4a07-a2cc-614cdb75046e@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: tanvir.roshid@codethink.co.uk


On 12/03/2024 16:30, Tanvir Roshid wrote:
> Hi,
>
> I hope you are well.
>
> I wanted to post this message to discuss the megous kernel and 
> communicate with the embedded Linux community. This post is my first 
> attempt at using the Linux mailing list, so forgive me if I make any 
> mistakes.
>
> For context, the megous kernel is a fork of the Torvald kernel 
> containing patches to enable the PinePhone and PinePhone Pro to boot 
> correctly.
>
> The megous kernel disappeared earlier this year. We have spent the 
> better part of the year getting the phones to boot with the upstream 
> kernel for GNOME OS. We successfully confirmed working boards using 
> patches found on this repo:
> - 
> https://gitlab.com/pine64-org/linux/-/tree/linux-pinephonepro-6.6.y?ref_type=heads
>
> The work is visible here:
> - https://gitlab.gnome.org/GNOME/gnome-build-meta/-/merge_requests/2455
>
> I am aware that a new fork replacing the megous kernel exists here:
> - https://github.com/sailfish-on-dontbeevil/kernel-megi
>
> The GNOME community would prefer not to rely on a custom kernel and 
> use the upstream version to avoid a repeat of the megous kernel and 
> its disappearance. Recently, the patches have understandably failed to 
> apply to the new kernel. We would prefer not to upstream these patches 
> for long-term maintainability versus continuous maintenance.
Apologies; my sentence was not clear here. I mean to state "We would 
prefer to upstream these patches for long-term maintainability versus 
continuous maintenance. "
>
> My question to the embedded community is:
> - What is preventing the upstream kernel from integrating these patches?
>
> From research (https://news.ycombinator.com/item?id=30015412), I can 
> see that these patches present problems. However, we would like to 
> know more specifics to eventually upstream these patches via 
> additional work.
>
> Kind regards,
> Tanvir Roshid
>
>
