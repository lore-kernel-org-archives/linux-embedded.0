Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B0E3EF0CD;
	Tue, 30 Jun 2026 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814904; cv=none; b=Svxife6j29bmmraYfLuAO2xlrNXztcAkBoU3vxiNaX/qHGBLUzMq4o0+xIuPLH28IKpXh7tv4y4a56yaLIOXUzo3uj5F8aP+7ExE0Gew93/wl9IbvYnshbcO0BG49elBI0bgRGf9BeG43TptRTHlv5j/n5oyxKMp5wUYp6DNexU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814904; c=relaxed/simple;
	bh=wT/Bb+x+s1YDn5DZ5iFC7JTtCOVb2Tka+Fp7AqLEtLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMnSmI5PIu6vLlPz5mqHdMYxZOzvr5Bebwj56sMPhlJTdgd01jwTldj93XleqHAViH94h8nKcicJQ4knVX7O+RF9fG8jRACWXbb/uEssOIO/4vzoWVh+7qSkbh7mRCAC/tbv9Z16ESeGvzg02uCMTaH2RatehjhXM5WRlAsZULY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KIxxVhml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KIxxVhml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC081F000E9;
	Tue, 30 Jun 2026 10:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782814903;
	bh=X7hs7sZWl1dIid5w2aQBEd8pj9W7yynBTLih1LQRX7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KIxxVhmlDb48t6nY6Ud1fKs7XTr8iD84wXL3iBAR9uu7VaoFsuPNUqyv3Kw3amwFf
	 6fjHHjRRsVrxFzUXQyW0hjjUhrHuq0+8+S2HRpawurK2fuit0EqdUW3o2OZd5Sotde
	 70zeRkKhMR638Btw8i0w5+7kJt2nWY+2FSffykMo=
Date: Tue, 30 Jun 2026 12:21:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Francesco Valla <francesco@valla.it>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Tim Bird <tim.bird@sony.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-embedded@vger.kernel.org
Subject: Re: [PATCH] driver core: add driver name to probe debug print
Message-ID: <2026063043-slouchy-outgoing-a958@gregkh>
References: <20260629-probe_driver-v1-1-fc58117581b5@valla.it>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-probe_driver-v1-1-fc58117581b5@valla.it>

On Mon, Jun 29, 2026 at 11:51:18PM +0200, Francesco Valla wrote:
> The initcall_debug command line option is a useful tool while debugging
> and optimizing the initialization of a new system, mainly because it
> allows to see probe failures and deferrals without recompiling the
> kernel (e.g., with CONFIG_DEBUG_DRIVER). However, matching a device
> with the driver it is being probed with can become difficult, since
> some devices use names that are not explicit, at least at a first sight
> (e.g.: '1-0:1.0' or '1-0060').
> 
> Add an additional debug print to inform the user which driver is being
> used for a device, allowing for a quick match. The print is inserted in
> the same really_probe_debug() wrapper that is already used to report
> the result of the probe, and is thus not affecting executions not using
> the initcall_debug option.
> 
> Suggested-by: Tim Bird <tim.bird@sony.com>
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Hello,
> 
> this very small patch comes from a discussion started at the end of
> 2024 after a Boot Time SIG meeting [1]; I decided to reduce the patch
> proposed there by Tim to the bare minimum, as this should already be
> enough information for a developer to work with.
> 
> I was unsure on whether to add information to the existing print or
> introduce a new one; while IMO technically worse, I opted for this
> second solution, since the existing print *might* be viewed as
> userspace-facing ABI. I'll be happy to do otherwise if there is
> consensus.
> 
> Thank you!
> 
> Regards,
> Francesco
> 
> [1] https://lore.kernel.org/linux-embedded/MW5PR13MB563277AF5972FD2B56026CF9FD3C2@MW5PR13MB5632.namprd13.prod.outlook.com/
> ---
>  drivers/base/dd.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 60c005223844..3c0930020050 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -782,6 +782,9 @@ static int really_probe_debug(struct device *dev, const struct device_driver *dr
>  	ktime_t calltime, rettime;
>  	int ret;
>  
> +	/* Don't change this to pr_debug() - see comment below. */
> +	printk(KERN_DEBUG "probing %s with driver %s\n", dev_name(dev), drv->name);

So you now get 2 lines per driver probe attempt?

What exactly is this going to help out with?  You aleady get the probe
result line, how is doing 2 going to change anything except explode your
kernel log?  Why not just modify the one existing line instead?

And the comment "see below" should mean that you move the comment up
here so that it doesn't need to be repeated.

thanks,

greg k-h
