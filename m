Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFCA3624D4;
	Wed,  1 Apr 2026 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775072244; cv=none; b=sSK6QypSSSCT8A8JqqNOrxAEgwGVvzxuQwQ4TyQFV90E332og8bwQTwVSlr9WAwl+Gqh1KE6uHsZ2vZhNe0/cyvt4GnPqgPmnDdVKtSNdabY8KFct9+zEUJbAtp0UFVN7aufvbPGkR03juGd0+q4/tCYdMHKVmoqQB+vd4hZIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775072244; c=relaxed/simple;
	bh=eKiFTT1ZlkeE5A5Gd+8gkkUl2okHYY0q+wXdr6il8xQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oilEG4P7mNGggWipZO+msVHJ/oI47Ix0o7zAHYLLEV+wVucX1L1IUge6bdP10Sd3HWLaFdDGGc58M91Yohov1edDlLfTo5fzGWWMUZypTUyTCshykW/WbBr1SVSMNvlNJl+qITQ88Mn1hQZdJT8AxebdSUDXtvzlJVB7cCGRxk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=umVDHa8g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="umVDHa8g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29DE4C4CEF7;
	Wed,  1 Apr 2026 19:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775072243;
	bh=eKiFTT1ZlkeE5A5Gd+8gkkUl2okHYY0q+wXdr6il8xQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=umVDHa8gUXwRGSI+9JpfG/Xazi8yFmBXEhLpWU7yrAvfN6qz1FKcjioR9Ctf9DS2u
	 amWG2D8VViEmr+Pki0AY5M5dLiqzSVz2Tbq2/U0i258pQ9NNhUdNf8fb4Qlk/b6yQD
	 zPtJ1bKx7KkkIqaTvIENamru679rIU9PPvapvaLSAeFrlWcvjWulZtvYs4U2rMqSOu
	 QK1qzl9051sEAF86R0daqFGoAgx1H0dE9lSK+2mlCQBz5h4vzNDAnDRg91KVqX21G0
	 aE+kASEsiNy6mIer8K0qGAFq3y2Wu1T9CQjTE+y/BQH7QJvt2Jz8OE/WY7UkBtlHJQ
	 nMbQQiEwo5gMQ==
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
In-Reply-To: <20260401111244.5057a89c@gandalf.local.home>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com> <87zf3ud92r.ffs@tglx>
 <MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyuvboo2.ffs@tglx>
 <MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyus9xft.ffs@tglx> <87ldf78tc5.ffs@tglx>
 <20260331200519.58930ece@gandalf.local.home> <87h5pv84h5.ffs@tglx>
 <20260401111244.5057a89c@gandalf.local.home>
Date: Wed, 01 Apr 2026 21:37:20 +0200
Message-ID: <87tstu79qn.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 01 2026 at 11:12, Steven Rostedt wrote:
> On Wed, 01 Apr 2026 10:33:26 +0200
> Thomas Gleixner <tglx@kernel.org> wrote:
>> As I've demonstrated the time until the first time stamp is available
>> has nothing to do with the number of CPUs and is more or less constant:
>
> So my question is, if something changes in this time frame, where it goes
> from 30ms to 300ms, how would we find out?
>
> Again, for Chromebooks, we get these timestamps from the firmware and it's
> very useful.

I understand all of that and I'm not opposed to make that happen if it's
integrated properly into sched clock as I demonstrated with the PoC
hack.

Thanks,

        tglx
