Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C28381B02;
	Wed,  1 Apr 2026 15:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056310; cv=none; b=IFlfg4CBI4g6cRy1dw2cN45pJo/1yjlfsHWpbPFpJAaSvojM4AXNANLAPA8OakW0zgFFNZZUr3+w+dRa/n/cvyAvWRqaNnUUS9flSdqjFIagc7fu/krYdxPPs/slqRLFi3DEbqfnQ8f2NiaVjoQ0ug7qamwus5Fxt/hu75IcEC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056310; c=relaxed/simple;
	bh=9nwN/SjMaEI+D4DBGqbZm5bH7vSqEmv+2X7IQrBmUBM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TpRZtWPXtUt9N7a21oD56osHYxU6cgPjh9FxUTl8ij8H/X06Z/evGM3y+Y+Pxg2QU01sK40pdRl3WTh+8e9MGn3VLXwItI00KkaewvaTr/S/XxcPFPCYy9eNkkvIWRnxnxU4YR/dyLPlMHHsjZMJYEWeliQIB3uINOY1N/E+nI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 622745B883;
	Wed,  1 Apr 2026 15:11:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 3F42120027;
	Wed,  1 Apr 2026 15:11:44 +0000 (UTC)
Date: Wed, 1 Apr 2026 11:12:44 -0400
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
Message-ID: <20260401111244.5057a89c@gandalf.local.home>
In-Reply-To: <87h5pv84h5.ffs@tglx>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
	<20260210234741.3262320-1-tim.bird@sony.com>
	<87zf3ud92r.ffs@tglx>
	<MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<87jyuvboo2.ffs@tglx>
	<MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<87jyus9xft.ffs@tglx>
	<87ldf78tc5.ffs@tglx>
	<20260331200519.58930ece@gandalf.local.home>
	<87h5pv84h5.ffs@tglx>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 3F42120027
X-Stat-Signature: ha8wtzwindo4t6sexetxbkc39ntoac4t
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19zYNHaFHDH/V1oDcWh9nj4v/9LtevW5hQ=
X-HE-Tag: 1775056304-57142
X-HE-Meta: U2FsdGVkX18I6/cE7tU27mp0VRHwQGOAGWF4EehLgiSRH7P6cYNy8KA6EIIJGdUzHJw4J6VbD/hnMl+AEKWaeq6ZRF+jtuBdMCjsCwzXjdyDDQO/xFNPABfh4jfXrMgceqa0aH9oGTW0fSNdHRugHYj9DTyA/MWJqwLPkELXakqjtyVrmAJ7Pxi20CLm3/kjMaBMWAsWwYxa5ryY5wLRcRtRxeqRQ0hBI1qEKxQNtsLlLLKOKLTTNM9LVnv5YaT80/l6TbSKm7iifhBWpM4ylKsv/psir7dvt0mbcHYB/1PyQpG3kPHrTdZEZjGBCT6xRXjgVkMh4dw127Aq3R3VPs07Aoj2RbJ+

On Wed, 01 Apr 2026 10:33:26 +0200
Thomas Gleixner <tglx@kernel.org> wrote:

> Steven!
> 
> On Tue, Mar 31 2026 at 20:05, Steven Rostedt wrote:
> > On Wed, 01 Apr 2026 01:36:26 +0200
> > Thomas Gleixner <tglx@kernel.org> wrote:  
> >> That's ~12ms of time which is not accounted for in the overall boot time
> >> until the machine reaches the init process:
> >> 
> >> [   12.289141] Run /init as init process  
> >
> > 12 seconds! Holly crap, that would fail every Chromebook requirement we
> > have. In most cases, we shoot for a 3 second boot up and 8 second max.
> > That's from hitting the power button to login screen. FYI, 30ms is
> > considered a really long time.  
> 
> Which 30ms are you talking about?

Sorry, that was from your previous email:

   The existing early TSC enablement on x86 starts providing printk
   timestamps at about 30ms after boot out of the box when I remove
   'earlyprintk' from the command line on the same VM/host combo I tested
   the PoC. That too uses sched clock and not some special mechanism.

We actually try to account for pretty much every 10ms and if there's a 30ms
gap somewhere, we look to see what it was doing.

> 
> As I've demonstrated the time until the first time stamp is available
> has nothing to do with the number of CPUs and is more or less constant:

So my question is, if something changes in this time frame, where it goes
from 30ms to 300ms, how would we find out?

Again, for Chromebooks, we get these timestamps from the firmware and it's
very useful.

-- Steve

