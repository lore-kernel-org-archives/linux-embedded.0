From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Sources of entropy?
Date: Wed, 25 Mar 2009 10:06:10 -0700
Message-ID: <49CA6482.4090809@cisco.com>
References: <200903241847.29104.rgetz@blackfin.uclinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200903241847.29104.rgetz@blackfin.uclinux.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=909; t=1238000771; x=1238864771;
	c=relaxed/simple; s=sjdkim3002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Sources=20of=20entropy?
	|Sender:=20;
	bh=8z+lTQGXnUks0OTdCA3E+Rn6S1yuo9QUc6y9eLmxFEY=;
	b=fO28hji89a9b8TxxWQWwLxT02PF0pttscFbvDQ8podLRH7uqNLEWTVDEZ7
	Ex3c670z5s4jMR4fBTKpWgipVK3d8Z9DI/tAVrYAPxuTIIV9zeW5hVRgyiBv
	vE4uWHhC5p;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robin Getz <rgetz@blackfin.uclinux.org>
Cc: linux-embedded@vger.kernel.org

Robin Getz wrote:
> I'm just wondering what people using on standard embedded/headless/diskless 
> targets (which do not have hw random number generators) as a source of 
> entropy - since networking was removed as an entropy source circa 2.6.26
> 
> On my target:
> 
> root:/> cat /proc/sys/kernel/random/entropy_avail
> 0
> 
> is about all I get... (since I'm not running any userspace utils yet).
> 
> I have seen rngd, clrngd, audio_entropyd, & video_entroyd - but I was just 
> wondering what others were actually using. (I was cautioned that everything 
> was pretty CPU intensive, since they all have a FIPS testing to ensure 
> randomness)...

The answer on the box I'm working on is: very little. I need to generate 
  an Ethernet MAC address and had to come up with way so that few random 
bits I had were sufficient, in my particular environment, to avoid 
address collisions.
