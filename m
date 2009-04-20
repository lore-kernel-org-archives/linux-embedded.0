From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch] Wait for console to become available, ver 3
Date: Mon, 20 Apr 2009 15:29:48 -0700
Message-ID: <20090420222948.GA11068@cuplxvomd02.corp.sa.net>
References: <20090420143010.697c7380.akpm@linux-foundation.org> <Pine.LNX.4.44L0.0904201744410.6832-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.0904201744410.6832-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=981; t=1240266589; x=1241130589;
	c=relaxed/simple; s=sjdkim3002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org;
	z=From:=20David=20VomLehn=20<dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
	|Subject:=20Re=3A=20[Patch]=20Wait=20for=20console=20to=20b
	ecome=20available,=20ver=203
	|Sender:=20;
	bh=CMZgZCiLBUCld+wquw/2zHxmrvWMpTQ5IGr3BuIvmCw=;
	b=b8ilOzF7bLVb+KFEeixG9ExA8qqSUeloFdIpyRky2Ns3hyDmdiFTpQhcxH
	7lAFc6RAtIp7ViObONpQvQTUVhS30jK9GhutPLYM+6kMd3CUejST9Ffy3ih9
	rl08oNf0TK;
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> Personally, I'm in favor of adding a boot parameter.  Things could be 
> simplified slightly by treating a negative value (or a missing value) 
> as indicating an infinite timeout; then only one new parameter would be 
> needed instead of two.

I'm allergic to the idea of a user interface using negative one to mean
infinity. It's an bizzare idea that makes sense only to programming
wankers. Such as ourselves. Having a missing value mean infinitity is a
not whole lot better.

I do agree with the idea of adding one boot parameter rather than two. How
about keeping the consoledelay parameter, but allow it to either take a
string, such as "forever", or an integer, which is the number of milliseconds
to delay?  I think that will make sense to a lot more people.

Note that, as far as the implementation goes, using a -1 to mean an infinite
wait may very well make sense. I just don't think it makes sense where decent
people can see it.
--
David VomLehn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
