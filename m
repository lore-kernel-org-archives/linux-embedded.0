From: Borislav Petkov <bp@alien8.de>
Subject: Re: v3.18-rc1 bloat-o-meter
Date: Mon, 20 Oct 2014 11:16:53 +0200
Message-ID: <20141020091653.GA3524@pd.tnic>
References: <alpine.DEB.2.02.1410201018230.24954@ayla.of.borg>
 <20141020090637.GA3654@pd.tnic>
 <CAMuHMdV5VPEqJ2WeZTc=Tg_vSRJPYgzQib9m-_fnqLzJ_vpDdA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1413796634; bh=20aq1fKGQ/zgiC1OaNLBZ5sTVht6/oz5e/wxwxsh5LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=n/BxjOhCFM5tQm8wSjMWbbXvk4ri/AJQ6EBDKT
	Wnq0UgnvF7aY0b6BNbE6vgW+qfOxAlMejvz8fyA0cyZ67X6nZlRfKzuhmCRwS6O04Uk
	G2nwqxxqNnOMK0tMFL6dhQs4OUnujq9uGroGXyw8XiBytaLdqZgZ5MlYHJdc3sByh8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1413796634; bh=20aq1fKGQ/zgiC1OaNLBZ5sTVht6/oz5e/wxwxsh5LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=n/BxjOhCFM5tQm8wSjMWbbXvk4ri/AJQ6EBDKT
	Wnq0UgnvF7aY0b6BNbE6vgW+qfOxAlMejvz8fyA0cyZ67X6nZlRfKzuhmCRwS6O04Uk
	G2nwqxxqNnOMK0tMFL6dhQs4OUnujq9uGroGXyw8XiBytaLdqZgZ5MlYHJdc3sByh8=
Content-Disposition: inline
In-Reply-To: <CAMuHMdV5VPEqJ2WeZTc=Tg_vSRJPYgzQib9m-_fnqLzJ_vpDdA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Josh Triplett <josh@joshtriplett.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Mon, Oct 20, 2014 at 11:09:28AM +0200, Geert Uytterhoeven wrote:
> Sure. Compile two kernel images, and run
> 
>     scripts/bloat-o-meter <image1> <image2>

Ha, that's even upstream :-)

Thanks Geert!

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
