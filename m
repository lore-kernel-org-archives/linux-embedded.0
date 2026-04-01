Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC5B3BA252;
	Wed,  1 Apr 2026 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035162; cv=none; b=kOOMf4BD1uTIUMHKre0qcMM+W+T0eh9ar2aeOs3h4zwzwPES5SXuTSV9S0cj2mOUM8Mi1GyRrFYjvzFvlU9XbC0RtyAf4OINp57eWKZ2h8ITiC+9zzr0L1TEJ5ALV7zccmF4ghWKdCkhQmDT56U2cCg0Jg9jDPgBXgrZ9nzRJao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035162; c=relaxed/simple;
	bh=ctKWbwUDJ9jvtiaYq9nPdocx24JYSHsstYD/kH+8twU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VF4nB6LX7eUXhwD5gx6ZvGLuZa5vkjPM1b1KdgUuK8NKkVo6Fv2kGgEABhj7te1RLa0XkbyFkZJY5edsn+Ng7MsJN5FvSeKPZRhnCtrRLHhcKHj6xZHVrY4CkjUSLIZA6uyQBFo7/MhMuL5aFmYwEoskWEuvwweW4zYPYrmY27Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrjNEZUZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrjNEZUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D87FC4CEF7;
	Wed,  1 Apr 2026 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775035161;
	bh=ctKWbwUDJ9jvtiaYq9nPdocx24JYSHsstYD/kH+8twU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HrjNEZUZcEMEQxA8fdGCiVJBhtSdl+AdDoTer3od7MU5BRnexw1oX/3hPYw9QN+/i
	 cBKVzqb0HcDHW/BXcunUWayXEPV3ZXlwYVqJrl2KJmfRBkIYX+QSnnsXI1IQyOj/T7
	 NsjYzaLpxbjT/vCua9H7eVxl5Bzu/A2oev0C9autHcuD8y5OGWYxQXhRhNE4oMKVH+
	 opiteK0Qop7UWLPZeymPp/v8UrFx9Ok0M5e3ViKQtibVnNWwkmXFqcXqm9HkNnbqr1
	 ut3eUrzZ4evdGT2qWB7oEXbOP2wADofWKH8xf9wH5NkjDeO0viYA9CKLaELbA6oTfi
	 vZN2gUFSF0rZQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, "pmladek@suse.com" <pmladek@suse.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, Shashank Balaji <shashankbalaji02@gmail.com>,
 "john.ogness@linutronix.de" <john.ogness@linutronix.de>,
 "francesco@valla.it" <francesco@valla.it>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "linux-embedded@vger.kernel.org"
 <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early boot
In-Reply-To: <acxx9Bt0N3nhtLgN@redhat.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com> <87zf3ud92r.ffs@tglx>
 <MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyuvboo2.ffs@tglx>
 <MW5PR13MB5632B55CAD0BEA34188EE88EFD52A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87jyus9xft.ffs@tglx> <87ldf78tc5.ffs@tglx> <acxx9Bt0N3nhtLgN@redhat.com>
Date: Wed, 01 Apr 2026 11:19:18 +0200
Message-ID: <87eckz82cp.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Brian!

On Tue, Mar 31 2026 at 21:16, Brian Masney wrote:
> With this patch set, on a 32GB RAM arm64 system we have the linear map
> creation time went from ~350ms to 25ms. Again, the boot time was all
> reported as 0 in dmesg.

Impressive!

> What Tim is trying to do is to identify if we have points like this on
> other systems, or if boot regressions are introduced in the future.

I completely understand that and as I clearly said from the very
beginning I'm not trying to prevent that at all.

What I'm arguing against is the approach of creating an ad hoc wart in
printk as that's creating yet another long term maintenance burden.

Thanks,

        tglx
