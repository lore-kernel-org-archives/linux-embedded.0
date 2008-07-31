From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Thu, 31 Jul 2008 18:26:16 +0200
Message-ID: <20080731182616.4c20f0db@surf>
References: <20080731092703.661994657@free-electrons.com>
	<20080731093220.969460336@free-electrons.com>
	<20080731135319.GA20212@cs181140183.pp.htv.fi>
	<20080731162007.285938e0@surf>
	<20080731153757.GB20212@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20080731153757.GB20212@cs181140183.pp.htv.fi>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Adrian Bunk <bunk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, matthew@wil.cx, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org

Le Thu, 31 Jul 2008 18:37:57 +0300,
Adrian Bunk <bunk@kernel.org> a =C3=A9crit :

> I'm just not a fan of adding config options for each few kB of code -=
=20
> we have to maintain them and the more complex the configuration
> becomes the more often it breaks.

I'm not a fan of these too, but are there other solutions ?

> What became bigger was most likely not related to the patches you
> sent.

No, it is not.

> Where and why did the kernel become bigger?

It's not up-to-date with 2.6.26 and 2.6.27-rc1, but Bloatwatch
<http://www.selenic.com/bloatwatch/>, by Matt Mackall, is here to
answer these questions. I haven't made the analysis for
2.6.26->2.6.27-rc1.

> Why did CONFIG_FW_LOADER get enabled?
> Due to alnoconfig disabling CONFIG_EMBEDDED?

I don't know. Haven't made the analysis for now.

> A user will ask:
> I'm using $applications with $libraries, can I safely disable this
> option?

Hard to tell in the general case.

> And e.g. according to a quick grep through the sources uClibc's=20
> updwtmp() seems to cease working without flock().

Correct. But on many embedded systems, we don't care about logging past
user logins. We might even not care about logins at all.

> It costs us maintainance of the option and the #ifdef's and gives
> users one way more to shoot themselves into the foot in nontrivial to
> detect ways.

That's correct, and as I said previously, I fully understand the
maintainance problem of all these new configuration options. I must
admit that I do not really have more objective technical arguments that
would help us deciding whether the code size reduction vs. code
maintainance choice should be made in one direction or the other.

Sincerly,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
