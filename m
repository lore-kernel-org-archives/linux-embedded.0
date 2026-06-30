Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282A47E792;
	Tue, 30 Jun 2026 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782852085; cv=none; b=g21IQEm13EdI44yO9HQZBcSSmVMDOBTH1NYbkCPlwf4OrsNk7DI7qvW3rl5tOcw5zAz5kMiFF6BNG+oM0RIxuCXNlJcdMAD0mHZOMbVZ9Cs5OxDsnZUh9ck079qAEfL2ICjXyMTAcQ25uZe7Iz3SJ6d4g2Z7tymCFkgr2Nbp2Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782852085; c=relaxed/simple;
	bh=Z9yfRYNmIwv+atHhc4TifIPYETVUiFBgfexfenc4tIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbvUwFDPDTxWLfBfkkIsGRBEHPastnfDPCPOXPaiexm6JYyrgjLFR8Fx3sW/y+r1JSXhjHWZZZn4WfHxZmwXkMKuoKt58J1L1XlmIQJD9EvvxF9zi+BKfIUnD1RiTv1dV0twRfa6pAhPJjHqK/PxoXV5yi8FWX5pmEJ758mqZ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ikoSK0Oz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ikoSK0Oz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E95F1F000E9;
	Tue, 30 Jun 2026 20:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782852083;
	bh=H7ATUd9cqlkhdahtwVkw4nMYeN1a4Ty93BXOFzaf7ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ikoSK0OzjLXNbd4YwkFkWzIHmqaYEN+FAnxC/unO27JOILKej3+1eUGzw4WYPAd5b
	 rOhX/jUrn7zlQ2Np4wyms453C/u8D2Z+sBDGqgxa+vnbKTgvVQBOsNik+bvjO1UrgN
	 V8kcfXt02dJVbTbBVqpLGa082RCrezB12J76EOy8=
Date: Tue, 30 Jun 2026 22:40:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Francesco Valla <francesco@valla.it>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Tim Bird <tim.bird@sony.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-embedded@vger.kernel.org
Subject: Re: [PATCH] driver core: add driver name to probe debug print
Message-ID: <2026063044-resonate-subtitle-d005@gregkh>
References: <20260629-probe_driver-v1-1-fc58117581b5@valla.it>
 <2026063043-slouchy-outgoing-a958@gregkh>
 <akPnMERmg-QO6kjC@bywater>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akPnMERmg-QO6kjC@bywater>

On Tue, Jun 30, 2026 at 06:00:17PM +0200, Francesco Valla wrote:
> Hello Greg,
> 
> thank you for the quick feedback.
> 
> On Tue, Jun 30, 2026 at 12:21:39PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Jun 29, 2026 at 11:51:18PM +0200, Francesco Valla wrote:
> > > The initcall_debug command line option is a useful tool while debugging
> > > and optimizing the initialization of a new system, mainly because it
> > > allows to see probe failures and deferrals without recompiling the
> > > kernel (e.g., with CONFIG_DEBUG_DRIVER). However, matching a device
> > > with the driver it is being probed with can become difficult, since
> > > some devices use names that are not explicit, at least at a first sight
> > > (e.g.: '1-0:1.0' or '1-0060').
> > > 
> > > Add an additional debug print to inform the user which driver is being
> > > used for a device, allowing for a quick match. The print is inserted in
> > > the same really_probe_debug() wrapper that is already used to report
> > > the result of the probe, and is thus not affecting executions not using
> > > the initcall_debug option.
> > > 
> > > Suggested-by: Tim Bird <tim.bird@sony.com>
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > > Hello,
> > > 
> > > this very small patch comes from a discussion started at the end of
> > > 2024 after a Boot Time SIG meeting [1]; I decided to reduce the patch
> > > proposed there by Tim to the bare minimum, as this should already be
> > > enough information for a developer to work with.
> > > 
> > > I was unsure on whether to add information to the existing print or
> > > introduce a new one; while IMO technically worse, I opted for this
> > > second solution, since the existing print *might* be viewed as
> > > userspace-facing ABI. I'll be happy to do otherwise if there is
> > > consensus.
> > > 
> > > Thank you!
> > > 
> > > Regards,
> > > Francesco
> > > 
> > > [1] https://lore.kernel.org/linux-embedded/MW5PR13MB563277AF5972FD2B56026CF9FD3C2@MW5PR13MB5632.namprd13.prod.outlook.com/
> > > ---
> > >  drivers/base/dd.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > > index 60c005223844..3c0930020050 100644
> > > --- a/drivers/base/dd.c
> > > +++ b/drivers/base/dd.c
> > > @@ -782,6 +782,9 @@ static int really_probe_debug(struct device *dev, const struct device_driver *dr
> > >  	ktime_t calltime, rettime;
> > >  	int ret;
> > >  
> > > +	/* Don't change this to pr_debug() - see comment below. */
> > > +	printk(KERN_DEBUG "probing %s with driver %s\n", dev_name(dev), drv->name);
> > 
> > So you now get 2 lines per driver probe attempt?
> > 
> > What exactly is this going to help out with?  You aleady get the probe
> > result line, how is doing 2 going to change anything except explode your
> > kernel log?  Why not just modify the one existing line instead?
> > 
> 
> I was being overzealous with the "don't break the userspace ABI" rule
> and included the existing print into this kind of ABI. Given your
> response, though, this might not be the case. I'll wait a couple of days
> to see if anyone has something to add and then send a V2 that adds the
> driver name to the existent print (solution that I technically prefer).

printk() messages are NOT a userspace ABI so all should be fine.
Especially for debugging messages :)

thanks,

greg k-h
