Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC4E37FF78;
	Wed,  1 Apr 2026 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032410; cv=none; b=cn8sj5vHjPAzS1WbbCs92VkJ0lu7C9qv5csyP0ZUZcWvNq3sb4rRcTYXOKPaG2SPAdXX5fiZroygdBgXXR2AEuQoCeIIRbJN8PSNf9X7jVAqeppuJBQIjbS2GFMJMqVz0E63KCS6Z7oV2ilzQtc/eLfRjsimdycAUgd3COoRBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032410; c=relaxed/simple;
	bh=eydskx00AGmLrI86s8w5D755rPXuR+AtTf41eG0gFUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nv+uSOhZ1LLv153oSYeXNTt6zojgJHywbyub6kHK0NvkVe8JenrUFXglBlcWRvbqXvMtGcV0cGQh5WcbK9gM2guYebHaisX1uwr1j2k4PJ713ti9SFEC5C5P1nKfMe3hOXnhSWjL2COQNK0J82aqa6TJ5fzH45+sWEgX+aH8lts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etWnhKk4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etWnhKk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2520C4CEF7;
	Wed,  1 Apr 2026 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775032410;
	bh=eydskx00AGmLrI86s8w5D755rPXuR+AtTf41eG0gFUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=etWnhKk4SVXPjT6Ibqi2zmMsu13pQiKi5dCa4XucemyOW5ockGZBU5rtIYNk090vn
	 y/3Ma72gWjdeT9UmmLL84RVPfOMxYquffHOgvMaLJGExTdwUfP2XkDwHI4M5UWH7n6
	 up4yuYfrf2pQT5bClIhT/JlGvI0R2kpnnQbid6So6aPrI5k58hWc+iFPyCRIBknE3V
	 US0+bYNQrGJubfijBM2JqtWnpNFPnkI8nUxPWk3xS4ImvaQyV/rSyNq/f9uLY3vaL1
	 6HW1IZ+lUaM891Pmj4O7qr/uaDZsHnaQhsqXr/24sH7Rn4V4PWLYNgQfpSULV/yNS1
	 s4H+G+DKKWu4Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, "pmladek@suse.com" <pmladek@suse.com>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, Shashank Balaji
 <shashankbalaji02@gmail.com>, "john.ogness@linutronix.de"
 <john.ogness@linutronix.de>, "francesco@valla.it" <francesco@valla.it>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early boot
In-Reply-To: <20260331200519.58930ece@gandalf.local.home>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com> <87zf3ud92r.ffs@tglx>
 <MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyuvboo2.ffs@tglx>
 <MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyus9xft.ffs@tglx> <87ldf78tc5.ffs@tglx>
 <20260331200519.58930ece@gandalf.local.home>
Date: Wed, 01 Apr 2026 10:33:26 +0200
Message-ID: <87h5pv84h5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Steven!

On Tue, Mar 31 2026 at 20:05, Steven Rostedt wrote:
> On Wed, 01 Apr 2026 01:36:26 +0200
> Thomas Gleixner <tglx@kernel.org> wrote:
>> That's ~12ms of time which is not accounted for in the overall boot time
>> until the machine reaches the init process:
>> 
>> [   12.289141] Run /init as init process
>
> 12 seconds! Holly crap, that would fail every Chromebook requirement we
> have. In most cases, we shoot for a 3 second boot up and 8 second max.
> That's from hitting the power button to login screen. FYI, 30ms is
> considered a really long time.

Which 30ms are you talking about?

The first timestamp is 12ms into the boot on bare metal as you can see
from the quoted text above. On a 4 CPU VM running on that very same host
it's 15ms due to the VM exit costs.

Which means with your 3 seconds aim, that's ~0.4% of the overall
time. Even with your 30ms it's still only 1% according to my old school
understanding of math.

> Point being, I'm sure Tim is worried about devices that require fast boot
> up times. Not machines with 256 CPUs.

You're clearly missing the point.

As I've demonstrated the time until the first time stamp is available
has nothing to do with the number of CPUs and is more or less constant:

VM with 4 CPUs:

[    0.015122] last_pfn = 0x280000 max_arch_pfn = 0x400000000

VM with 32 CPUs:

[    0.015150] e820: remove [mem 0x000a0000-0x000fffff] System RAM

The costs of the number of CPUs comes later in the boot process:

VM with 4 CPUs:

[    0.995082] Run /init as init process

VM with 32 CPUs:

[    3.329398] Run /init as init process

No?

Thanks,

        tglx
