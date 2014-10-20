From: Borislav Petkov <bp@alien8.de>
Subject: Re: v3.18-rc1 bloat-o-meter
Date: Mon, 20 Oct 2014 11:06:37 +0200
Message-ID: <20141020090637.GA3654@pd.tnic>
References: <alpine.DEB.2.02.1410201018230.24954@ayla.of.borg>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1413796019; bh=yg+igbWxijHu0bLWsyYvmRW9PUwFFKc2ajZfzJTgEUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=EimIg6H0KFDFcDgRi9fkeSQvyMbeJnSN91fQ9E
	HA+UtHr1r5mUnqWQkFbYKPk073LR4VD3KkgDv4FtVAx65l/XUX4aY58mBWOVQVAvXqj
	kM3fHnZa6J0K5pjY5+DNURi6g4B4PwcuOfSP+HyVGyJFT1lkKzgSR1zYA6ja3Q2164=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1413796018; bh=yg+igbWxijHu0bLWsyYvmRW9PUwFFKc2ajZfzJTgEUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=OzzSJiONzRFJTtmckL+cGHagb6lnBUjyVwqcgW
	A6953GECDdSYKjBoZQrxjEn6hvqgNLLcv8jnPZ+dxzDNM70wDaL62TtX2oTBXFVWrrc
	7V6AX8LwiC3Lc5xaRwFb2YxlEv0wLV/GpEfilH8WUqMgURFI/bZ/y2WsZOQMOjaZ4o=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1410201018230.24954@ayla.of.borg>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-embedded@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org

On Mon, Oct 20, 2014 at 10:37:19AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Below is the bloat-o-meter output when comparing an m68k/atari_defconfig
> kernel for v3.17 and v3.18-rc1.

That looks cool, can I run this for other arches too?

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
