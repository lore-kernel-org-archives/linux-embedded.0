From: "Christian MICHON" <christian.michon@gmail.com>
Subject: Re: mainlining min-configs...
Date: Wed, 11 Jun 2008 10:59:11 +0200
Message-ID: <46d6db660806110159k284b2ee9s62e118b8d09258bb@mail.gmail.com>
References: <48447615.5050806@am.sony.com>
	 <20080604194002.GF4189@cs181133002.pp.htv.fi>
	 <4849CCA3.7040102@am.sony.com> <200806062329.54019.rob@landley.net>
	 <484DDAD9.2000306@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Jpduso2HETfa8IOGuXJj1THpBZMgqpha9pKSLWO+/ws=;
        b=bXy+I5eLZDYMxHWVlJ4rcT7Ni3QArO0BNy4LJbEOl4Mf3VQJPyKTmkYnYgxRfbH6vB
         w0vQ/sgm1xRq0liwAA9pDjdoiclk+bhfxZp7BXh2luE6iyi7mazvdEHmNniVGfpilYJl
         kdu21UDy8joyVGfzawR2m4ASclTliR8/qtQq0=
In-Reply-To: <484DDAD9.2000306@am.sony.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Rob Landley <rob@landley.net>, linux-tiny <Linux-tiny@selenic.com>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Adrian Bunk <adrian.bunk@movial.fi>

On Tue, Jun 10, 2008 at 3:37 AM, Tim Bird <tim.bird@am.sony.com> wrote:
> Any chance of getting your minimal configs from Firmware Linux mainlined?
>
> Does anyone else think this would be valuable?  If not in mainline, it
> would be nice to collect them somewhere, to compare what options different
> developers decide turn on or off.
>  -- Tim
>

this is very valuable. DetaolB uses this concept. Download the latest
iso of DetaolB, boot it and look for /proc/miniconfig.gz.
you'll see an example for 2.6.23 there.

you can find old patches there:
http://downloads.sourceforge.net/detaolb/detaolb_v03-linux-2.6.21.patch

-- 
Christian
--
http://detaolb.sourceforge.net/, a linux distribution for Qemu with Git inside !
