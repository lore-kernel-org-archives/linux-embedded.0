From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Wait for console to become available, v2
Date: Sun, 19 Apr 2009 16:17:11 -0700
Message-ID: <49EBB0F7.3050606@cisco.com>
References: <20090416190837.GA26734@cuplxvomd02.corp.sa.net> <874owlqcce.fsf@basil.nowhere.org> <49EB5008.1090000@cisco.com> <20090419163923.GS14687@one.firstfloor.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090419163923.GS14687-qrUzlfsMFqo/4alezvVtWx2eb7JE58TQ@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1208; t=1240183037; x=1241047037;
	c=relaxed/simple; s=sjdkim1004;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org;
	z=From:=20David=20VomLehn=20<dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
	|Subject:=20Re=3A=20[PATCH]=20Wait=20for=20console=20to=20b
	ecome=20available,=20v2
	|Sender:=20;
	bh=LKgucMAKZNb/KjIX6jL3H/39joAa061RHFRgL4+X9T0=;
	b=hMBVZhwpmKJq1oJnGls+k29c56z11w1IluS4aTozLcu+xZQT6EYSrJhPuY
	FzRg3dUpc1jJNheOvSzXY9olydqhvadtQsHLud+K1b+lKPhaxcYQiYHg2JbS
	LT/4ziPZbb9dw7ciW01r0LDQCxmwNgJeG+pVypc8r78q2AYhN7S0s=;
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Andi Kleen wrote:
> On Sun, Apr 19, 2009 at 09:23:36AM -0700, David VomLehn wrote:
>> Andi Kleen wrote:
>>> VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> writes:
...
>>> Also a setting to panic in this case might be useful, normally a system
>>> without console is not very useful and needs to be rebooted anyways.
>> Umm, those of us in the embedded space have the, perhaps misguided, 
>> notion that our systems are quite useful without consoles...
> 
> That seems more like a special case that shouldn't be default?

I have to disagree. Panicing because you can't open /dev/console is 
likely to mean that you get no output at all and so no chance to see a 
message explaining why the open failed. If the open failure is all that 
happened, the rest of the system may very well come up normally. You 
would then be able to look at the kernel log and diagnose the issue.

In any case, the purpose of this patch is fix USB consoles to work as 
they did before parallelized startup. This involves addressing a race 
condition that, theoretically, always existed but which previously 
hadn't been a problem. Changing the behavior when init_post() can't open 
/dev/console seems out of scope.

> -Andi

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
