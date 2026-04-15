Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D903491C9;
	Wed, 15 Apr 2026 21:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776288641; cv=none; b=UZdVduvTMVH4wrYUmUjVEgnoWyLZNOSu+x6Gqf48IyrS8PAh1OZ4lwA70poiIGyF4fEa/ms1VkpYIJQF9ffBdFPi5P1G/51lDxyXE3v10zlxjhPtpSLcyIu75G+Zrt6g0qyIdftr3fPRuIgQUapWMpbdeNPos0KlLjJwigtpnoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776288641; c=relaxed/simple;
	bh=CRUO25gAhYff+XHSuxFT5AwDZuKcg+D03rQsxVq2lI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XiHplYDDJ7cnDu3rM/26klV7HkeIiRNTkeDBckBgSE4g9hdyluLUX4NhAtNOTaHK1hvZpg7VUZY5C0xmZX/u2F1HV5X2Pkj0bqn+p5QqbwGfHEethepb9WuHWmo6Q0kd4036rKL9GCoLc0N7T7dJMi5zWittjwQDFc7f8d1Bric=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MP7SHCZz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MP7SHCZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF9FC19424;
	Wed, 15 Apr 2026 21:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776288640;
	bh=CRUO25gAhYff+XHSuxFT5AwDZuKcg+D03rQsxVq2lI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MP7SHCZzDPxjHEDio5ShJaFcYlgOdwTsuSA/4hdevUp9kNW/qHC/MUYF0jP8h66vJ
	 pR7419tPDQT7Y5GT/znUb2t1el/4L+GMkwvneOLZmz3wUZuu4bdsQK7Jxy2UhFtjBb
	 78yJMtpRk4IYTZh5mQLcaVytsjIgoK14zPx7ii4PBcXDHKGKDndK1HLWWRLbgzAfzz
	 WWeWstU7uH28hu9Iyc7P5HM3HhzTY6vMX36aW+dDvDgwKhG2S2EdrTnugcOmcJukRa
	 QVP6pU6qVdTKWfhatM7pnp4rYFMBlXl/SlERYaC/BrkKp6/0tGSREx6mbxlMxs00x+
	 ZjcjLNIWAcacg==
From: Thomas Gleixner <tglx@kernel.org>
To: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Cc: Tim Bird <tim.bird@sony.com>, pmladek@suse.com, rostedt@goodmis.org,
 john.ogness@linutronix.de, senozhatsky@chromium.org, francesco@valla.it,
 geert@linux-m68k.org, shashankbalaji02@gmail.com,
 linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
In-Reply-To: <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
References: <20260410203741.997410-1-tim.bird@sony.com>
 <20260410203741.997410-2-tim.bird@sony.com> <87qzohdv6i.ffs@tglx>
 <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
Date: Wed, 15 Apr 2026 23:30:36 +0200
Message-ID: <87bjfjap37.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 15 2026 at 02:19, Roberto A. Foglietta wrote:
> While keeping architectures separate is for abstraction layer best
> practice, in very specific cases abstraction can be a meaningless
> concept or much less important than having a single file for a single
> feature (the complementary way of organising stuff). Because in Linux
> the abstraction layer approach applies for architectures, the gap
> between aesthetic and a specific case like an early boot macros set
> hack for debugging is to clarify the exception from the general rule
> in the header itself.

Please spare me this AI bullsh*t.

There is absolutely ZERO justification for this at all. End of story.

Thanks,

        tglx
