Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244F8191;
	Wed,  1 Apr 2026 00:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775001873; cv=none; b=dR8YWMZkriMpoPPZyaVPEz9lfnornxghVSqeEqtXs/KBroPdrCeD4RpSIgXoX5Aj1AZgMZhduYEKluPMth6Vt472x4alzV9KQuYRCH24IJPXN5YmKjbhpXxZFwnpgECwJgCNGFG/Jq7DpRXtK28Xr5lkzNtgKDpbkSXA/Jx9z/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775001873; c=relaxed/simple;
	bh=bxCkB+fETS3QuefKtPInhun9squZVXL4Y6YCPXeA1v0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SCub1OToFDiHURkWuTNqvwQFMuy6+/mGlhqTBf65pMRR0fubLnlnXMbhLu83QRjNYxNnqp//rP+mGxW8mHsWAQAvSckzMLM3Czq6gKcBn0lGV8XI4AAQLnEZmCvOumkt9Mrf5dZ+guE03uIqYTOcu70Hbtk8UpjuhmOXaXYfhDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 2964413ACC4;
	Wed,  1 Apr 2026 00:04:23 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id D905120026;
	Wed,  1 Apr 2026 00:04:20 +0000 (UTC)
Date: Tue, 31 Mar 2026 20:05:19 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, "pmladek@suse.com" <pmladek@suse.com>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, Shashank Balaji
 <shashankbalaji02@gmail.com>, "john.ogness@linutronix.de"
 <john.ogness@linutronix.de>, "francesco@valla.it" <francesco@valla.it>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Message-ID: <20260331200519.58930ece@gandalf.local.home>
In-Reply-To: <87ldf78tc5.ffs@tglx>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
	<20260210234741.3262320-1-tim.bird@sony.com>
	<87zf3ud92r.ffs@tglx>
	<MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<87jyuvboo2.ffs@tglx>
	<MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<87jyus9xft.ffs@tglx>
	<87ldf78tc5.ffs@tglx>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: rp4soiux5tge7tbfu3a934yq8z41bj19
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: D905120026
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1//oHW5CBuXIROfzC3nm6BoNNbXGBv+v7M=
X-HE-Tag: 1775001860-506310
X-HE-Meta: U2FsdGVkX19atJ9LChtPBxQ3X5mhnDf5BzIKxV2MYJdSiSONYVLzGOvyLKwrPwyM7VixcLvaomDhUIHoTzQoB224rbUvEDjvw6AqzoXrYKkfDfxgds9jxd/zletAm9f96xLzIG6UqP8RWQOZN7uIW8n548iNHH9JmxA5sVvdhjuNSZjt2cWjsWifUceOZ1J8A9FZnmpJpbGjHmuIlPzWa6fl8Yw+ZI8g/aEUn5NjqE0EpG/HK7sWMQ/L/jc/Gcqdx27BA7vKRuA1jmoq7uBLzZaknaRhZ3SRF8HSs9N+aNSjVOEMCk3snHRnQ6058SO/PtPEBzqwxjU/BuHY6Sj/2qbt7I9Q+lsDC6UHvdJY8lWrLVQ4zFk3vg==

On Wed, 01 Apr 2026 01:36:26 +0200
Thomas Gleixner <tglx@kernel.org> wrote:

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

12 seconds! Holly crap, that would fail every Chromebook requirement we
have. In most cases, we shoot for a 3 second boot up and 8 second max.
That's from hitting the power button to login screen. FYI, 30ms is
considered a really long time.

We spend a lot of time looking at every thing that slows down the boot
process, and yes we do a lot of tricks in user space as well (see
ureadahead[1]).

I'm sure there's various devices that have issues between the kernel C
starting point and where timing begins. When I was looking into boot times,
I did find that the biggest issue with boot up was the initcalls. They are
all serial. If one sleeps, it causes everything to back up. I would love to
have initcalls have more parallelism, but there's a lot of code that
depends on things running in serial :-(

Point being, I'm sure Tim is worried about devices that require fast boot
up times. Not machines with 256 CPUs.

I haven't needed to look at what is happening before time stamps are
running, as we track that time via the firmware timestamps. I'm just
pointing out that the machine you used in this example isn't the target of
the work that is looking into fast bootup times.

-- Steve

[1] https://github.com/rostedt/ureadahead
