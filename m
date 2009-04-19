From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Wait for console to become available, v2
Date: Sun, 19 Apr 2009 09:23:36 -0700
Message-ID: <49EB5008.1090000@cisco.com>
References: <20090416190837.GA26734@cuplxvomd02.corp.sa.net> <874owlqcce.fsf@basil.nowhere.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <874owlqcce.fsf-3rXA9MLqAseW/qJFnhkgxti2O/JbrIOy@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1215; t=1240158223; x=1241022223;
	c=relaxed/simple; s=sjdkim4002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org;
	z=From:=20David=20VomLehn=20<dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
	|Subject:=20Re=3A=20[PATCH]=20Wait=20for=20console=20to=20b
	ecome=20available,=20v2
	|Sender:=20;
	bh=Za0ya9Jd7LUEtGmdIpYexpSiZdnTRE7yvUSkvaYTVY4=;
	b=k+fqu0VpJhGBilRy7jOv3WD/3P7jExyxTh1fZShLPQYF1btwApDz5iOy4v
	MNbjDgNs1a0kRhOKeF9to37cbaZP0SesHLsWmWlgczYfcN8DI+FBi4fey4S7
	a7uhFdTpYn;
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Andi Kleen wrote:
> VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> writes:
>> History
>> v2	Wait for the preferred console rather than any console. Make the
>> 	delay interval a tunable.
> 
> CONFIG tunables are usually a bad idea. What should a binary distribution
> kernel set? Better make it a boot option with a reasonable default.

Your point about boot options is well taken; I released a more recent 
version of this patch with boot options last Friday and would appreciate 
your comments.

> Also a setting to panic in this case might be useful, normally a system
> without console is not very useful and needs to be rebooted anyways.

Umm, those of us in the embedded space have the, perhaps misguided, 
notion that our systems are quite useful without consoles...

But, more to the specific point, the console code is pretty smart. If 
you set your delay interval too short and the console comes up later, 
you won't see output to /dev/console, but you *will* see kernel printk 
output, including the message that no console could be opened. This 
would, hopefully, point the user to the problem. I can also make the 
message more specific about which parameter to set in that case.

> 
> -Andi


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
