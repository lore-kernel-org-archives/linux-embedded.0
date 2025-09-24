Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1472718B0A;
	Wed, 24 Sep 2025 00:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758673988; cv=none; b=ZPXCRRUjjP/xhvsONOGi5Apquy2IP3MVoopwb5i1HK3HgHGAQvoOYa5ez/uuIeKhysoEpiBq9XtNCtWED7kNFJGE7lMK4UR3qqkySp2Z6hEhEvW+xu1xvyNiwaoxixB918HrYjw3m16VlYwPdarqZm7hkmcuSCnNd7o8aFQAMRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758673988; c=relaxed/simple;
	bh=GYh+T60aPVzE/4gFL57fQ4DILcdLAVjkFQXNdxEKZKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaBQhNkeaPHCG7+0rUcAJsbOLsvbQxqZzfp9Ulp2w91yI5nyzAmwO6ix1x9qcMKIQsuIR3kuZ3EgnUM/T8Slowngf/9mHvLzQoEj6Oh6jraax0fgADS0S24EgMFl7H9PAJsK2/VM9e6yT2mjAY5Oixu1R6q5eT6ANuBjpd/FcU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpnOoacW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpnOoacW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F80C4CEF5;
	Wed, 24 Sep 2025 00:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758673987;
	bh=GYh+T60aPVzE/4gFL57fQ4DILcdLAVjkFQXNdxEKZKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpnOoacWt6ieLP9kUKOys+y24d8NOLIUMbdXZGlU94O6nOnfzzuD4u160s2u03o6M
	 bdUyBuUe8YbQRuugD66ABP57GkEL3TRbu6Qy10MVDt9nEO0X8HKIUPuiFPZnot+tVK
	 ebdudW2+8TXLd1UxCNxKfnjjUpYGOhAnPjnqTJHlxNOg1YVCvzHTsktoz8/9zB4lqM
	 W6TLd1CfhK/TBn32eaNVyEWFgJTvnuZHehR5A5vosISvUMA+poJchlsCq/BHEU4hM1
	 45Zwo7E1SZaEFB8vOfNuAZeF11LcUeJVopgq255in4xaOJI3BPGcsaFBxWj7Di5gAb
	 rHfqs4ItQr1Zw==
Received: by venus (Postfix, from userid 1000)
	id E10E11805CF; Wed, 24 Sep 2025 02:33:02 +0200 (CEST)
Date: Wed, 24 Sep 2025 02:33:02 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stefan Schmidt <stefan@datenfreihafen.org>, 
	Jan Lubbe <jlu@pengutronix.de>, stefan.schmidt@linaro.org, linux-embedded@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	RD Babiera <rdbabiera@google.com>, Amit Sunil Dhamne <amitsd@google.com>, kernel@collabora.com
Subject: Re: Call for Participation: Embedded & IoT micro-conference at Linux
 Plumbers 2025
Message-ID: <77modncqnoeumho6pi6dygr3hnw6dskd6romu4agmi5jro7p54@i5y4gpd22xrm>
References: <2a353817-f1da-4e7c-8b2c-0853779ec054@datenfreihafen.org>
 <j5dtkmnu55ycmqpaseazots7mevqyt5lafclvguxj6oz5r5cts@n563dsnvwuu7>
 <CABx5tq+U_hcmxXDCGpTawsu5C0bDknC=p1Rq3FrtVuJq9gj2Pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABx5tq+U_hcmxXDCGpTawsu5C0bDknC=p1Rq3FrtVuJq9gj2Pw@mail.gmail.com>

Hi Brian,

On Tue, Sep 23, 2025 at 07:38:14PM -0400, Brian Masney wrote:
> Hi Sebastian,
> 
> On Tue, Sep 23, 2025 at 7:03 PM Sebastian Reichel <sre@kernel.org> wrote:
> > I would like to present / discuss fusb302 (or other chips handled via
> > the TCPM framework) using boards that are mainly powered via USB-C and
> > not having any backup power source. This kind of setup is often found
> > on Rockchip boards (e.g. Libre Computer ROC-RK3399-PC, Radxa ROCK 5B
> > or ArmSoM Sige 5) and quite a pain, because a hard-reset effectively
> > kills the board power.
> >
> > I would present the problem(s), what I've done so far to get it working
> > to some degree with the upstream kernel and then discuss how to improve
> > the situation.
> >
> > I think to become a worthwhile discussion the session would need some
> > people that know the USB-PD specification and kernel subsystem, such as:
> >
> >  * Heikki Krogerus (USB-C maintainer)
> >  * Greg Kroah-Hartman (USB maintainer)
> >  * RD Babiera or Amit Sunil Dhamne (Google is actively working on
> >    ensuring TCPM code being compatible with the USB-PD specification
> >    and they were unhappy about some of my changes :))
> >
> > P.S.: I'm not sure how the CfP for the LPC micro-conferences works.
> > Please tell me if this mail is not good enough and I need to insert
> > something into some system.
> 
> You need to submit a proposal to
> https://lpc.events/event/19/abstracts/. You'll have to create an
> account, and there will be a "Submit new abstract" button at the
> bottom right of the page.

Ah, I was confused by the page not listing the embedded MC. I see
it appears in the drop down when trying to submit a new abstract.
Thanks for the hint - DONE.

> I went through the process for a talk that I submitted: "Fixing Clock
> Tree Propagation in the Common Clk Framework". It's related to this
> work:
> https://lore.kernel.org/linux-clk/20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com/T/

On most platforms I worked on we tried to have an exclusive PLL root
clock for DRM to avoid these issues. But sounds like a good topic!

Greetings,

-- Sebastian
