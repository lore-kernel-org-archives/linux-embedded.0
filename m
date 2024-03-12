Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4017A13F
	for <linux-embedded@vger.kernel.org>; Tue, 12 Mar 2024 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710261069; cv=none; b=aeE0udsxpyYx+NA08Ozgp5lEJdGGXvRSpCfeLvM68zfFyrzi+2G7dp5m9mb5EHbSt7qxb5l9fANRMRHq/HEhNdlgrvQA6EkMdPb9JehvYrFIs/UTweVDrC/KU6O33o+DYfcsIu7IFW4DxpOr31pAJk1AmSh5gK777cDhcKOhrSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710261069; c=relaxed/simple;
	bh=5N5zUiHYDC55rUfYVG8kcYbxkO5zljQOeXFmlJNbjZk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=U9vK8+mpfrH5cs1f3M/hkBmcMl5mLZENT0RWh5s6VOav3UdZJnblT0tCGgr85BrU4qqvR92sHN5m4GljDXcLHAcaYU2/jw6+PB6UHnxshVPSiupAjptZqQS3ftbF2lisZPolGgPxFMLXTSWZ2Tei1O8P432M8Z6xVRidhVGa+TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=BBuPV87f; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="BBuPV87f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BgsFiFwMMD6/9TV9/hiI4772hQHHtzdffDZ4+mpwx3I=; b=BBuPV87f7mWXbJ5kMrY7xpc3YY
	NQVbpz6u20kb5r49CcWviCAZYtrtHk2huFKikwPd/kGzJTlfxZL0ZFkEaseX7AjVlOEIf0o6zzxwq
	Ae3ks5fcBlhpMrcLAHpbg1SeruFsxSWWVZBL5God6VxdFsU7tzh6LBdv/Q3mEVg6vKR3/NYngX7N7
	iafmztv+P0daHHuofiQw/a3QkqqSfPWSlUaGo7v+F+Ygo76Mv8ZEV7K3UdkxBq/r6q5Qq2peQUchd
	TUpQr1yr64ZViHhenmmW4h05mrZ6egGBME0X7QWQzOF54A419ydMGfLnfDrdNdFSf2QoteUMbQ3G4
	huGDzc5Q==;
Received: from [167.98.27.226] (helo=[10.35.6.228])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1rk51m-00EUSL-JI
	for <linux-embedded@vger.kernel.org> ; Tue, 12 Mar 2024 16:30:58 +0000
Message-ID: <a5b7e74f-fad6-4a07-a2cc-614cdb75046e@codethink.co.uk>
Date: Tue, 12 Mar 2024 16:30:58 +0000
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-embedded@vger.kernel.org
From: Tanvir Roshid <tanvir.roshid@codethink.co.uk>
Subject: Linux Kernel (megi patches for PinePhone Pro)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: tanvir.roshid@codethink.co.uk

Hi,

I hope you are well.

I wanted to post this message to discuss the megous kernel and 
communicate with the embedded Linux community. This post is my first 
attempt at using the Linux mailing list, so forgive me if I make any 
mistakes.

For context, the megous kernel is a fork of the Torvald kernel 
containing patches to enable the PinePhone and PinePhone Pro to boot 
correctly.

The megous kernel disappeared earlier this year. We have spent the 
better part of the year getting the phones to boot with the upstream 
kernel for GNOME OS. We successfully confirmed working boards using 
patches found on this repo:
- 
https://gitlab.com/pine64-org/linux/-/tree/linux-pinephonepro-6.6.y?ref_type=heads

The work is visible here:
- https://gitlab.gnome.org/GNOME/gnome-build-meta/-/merge_requests/2455

I am aware that a new fork replacing the megous kernel exists here:
- https://github.com/sailfish-on-dontbeevil/kernel-megi

The GNOME community would prefer not to rely on a custom kernel and use 
the upstream version to avoid a repeat of the megous kernel and its 
disappearance. Recently, the patches have understandably failed to apply 
to the new kernel. We would prefer not to upstream these patches for 
long-term maintainability versus continuous maintenance.

My question to the embedded community is:
- What is preventing the upstream kernel from integrating these patches?

 From research (https://news.ycombinator.com/item?id=30015412), I can 
see that these patches present problems. However, we would like to know 
more specifics to eventually upstream these patches via additional work.

Kind regards,
Tanvir Roshid
