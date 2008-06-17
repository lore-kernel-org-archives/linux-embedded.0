From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Tue, 17 Jun 2008 11:51:48 -0700
Message-ID: <485807C4.6080609@cisco.com>
References: <48580116.9070504@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48580116.9070504@am.sony.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=2578; t=1213728713; x=1214592713;
	c=relaxed/simple; s=rtpdkim2001;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Recommendation=20for=20activating=20a=2
	0deferred=20module=20init=20in=20the=20kernel
	|Sender:=20
	|To:=20Tim=20Bird=20<tim.bird@am.sony.com>;
	bh=wTU/By2mFHChKr08fL7IjS4Yfj31btJlaLIylH+n6es=;
	b=ia6E3sN1aaagowNvnVtE7rkQk5MpyloOMoBk8Vg1K8bGARvjR09p3XQelz
	VaXZA8GnDm/zSDjorfmufU5K27IZpj3SNDWTiXiONDtfTf1Xot5GpqR/blAI
	wriXcNTlT9;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

Tim Bird wrote:
> Hi all,
> 
> I am working with a product team on bootup time issues.  One technique that we
> are forward-porting from an old kernel (and that I thought I might work on
> mainlining) is to compile modules statically into the kernel, but defer their
> initialization until after boot time.
...
> One of the main sub-systems that we defer initialization of this way is USB,
> and this saves quite a bit of time.  (Of course the same, or slightly more CPU
> cycles are eventually used during bootup time.  But this lets us get to user
> space quicker so we can start user-visible applications faster.)
> 
> I'm not that happy using an ioctl for this trigger.  What is the preferred
> method of activating a kernel feature like this? I presume something in /proc
> or /sys, but I'm not sure.

 From your description, it seems as though you always want to do the
initialization, you just may want to delay it until well after starting up user
space. If something like this were performance-critical, an ioctl might be 
justified, but this would be a one-time trigger. I think that making this as 
closely analogous to loading a kernel module as possible is a good conceptual 
approach. Since you might choose, at run time, whether or not to load a kernel 
module, it makes sense to do this on a device-by-device basis. To me, that 
suggests doing something in /sys.

My first impression was that this was an awful kludge, but drawing the parallel 
to loadable modules makes me not only happier, but also leads me into wondering 
if there shouldn't be a generic framework for supporting this. So, instead of 
using module_init, there might be some other macro that indicated that this 
driver was to be initialized in a deferred, and optional, fashion.

-- 
David VomLehn, dvomlehn@cisco.com
The opinions expressed herein are likely mine, but might not be my employer's...




     - - - - -                              Cisco                            - - - - -         
This e-mail and any attachments may contain information which is confidential, 
proprietary, privileged or otherwise protected by law. The information is solely 
intended for the named addressee (or a person responsible for delivering it to 
the addressee). If you are not the intended recipient of this message, you are 
not authorized to read, print, retain, copy or disseminate this message or any 
part of it. If you have received this e-mail in error, please notify the sender 
immediately by return e-mail and delete it from your computer.

