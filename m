From: VomLehn <dvomlehn@cisco.com>
Subject: Re: USB console and network devices unsupported for boot
Date: Fri, 27 Mar 2009 12:55:28 -0700
Message-ID: <20090327195528.GA24379@cuplxvomd02.corp.sa.net>
References: <20090327182758.GA10454@cuplxvomd02.corp.sa.net> <49CD2508.10706@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49CD2508.10706@am.sony.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=599; t=1238183729; x=1239047729;
	c=relaxed/simple; s=sjdkim4002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20USB=20console=20and=20network=20devices
	=20unsupported=20for=20boot
	|Sender:=20;
	bh=FzwXHK0PB6PdZ/6/2TZJEyR5+0rfnWyDpLD9pvVMEtI=;
	b=rmU6abHQ7ECgdximp8N0mNzWugJAiH6R4B8xUyuA7K6iZ6OYZCzfLLPO0o
	Kxxqfbd1P5pQgmVG/alrxVTjugC2L6WZDlPuO963G3SP/iCgwrM2xVz0ayBg
	hm6XDhWUqL;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Tony Colclough <colclot@cisco.com>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Mar 27, 2009 at 12:12:08PM -0700, Tim Bird wrote:
> VomLehn wrote:
> > My question: are USB serial consoles and auto-configured network devices in
> > common use or is my application a special case? If the former, we need to push
> > for a better resolution. Otherwise, I'll go off and figure out something that
> > works for my application.
> 
> I'd say that they're not uncommon during development, but I
> (personally) don't know of any shipped products with either of
> these.

Good point. This is definitely a question about development phase use of USB.
--
David VomLehn
