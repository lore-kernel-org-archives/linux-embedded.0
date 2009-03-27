From: VomLehn <dvomlehn@cisco.com>
Subject: USB console and network devices unsupported for boot
Date: Fri, 27 Mar 2009 11:27:58 -0700
Message-ID: <20090327182758.GA10454@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1008; t=1238178479; x=1239042479;
	c=relaxed/simple; s=sjdkim1004;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20USB=20console=20and=20network=20devices=20unsup
	ported=20for=20boot
	|Sender:=20;
	bh=qKdKIYL52rvT/kxTwisXoWshMaJg+/m1awfHtjkXtk0=;
	b=AI+gglC+jzOUV5JlAaRws80xnby3puOlwEPWT8XoADrKLLYoDQRu975pvh
	fUeCZZGdJ3iiesAtRTvUTv48FceKG1luRH7RNoq9oYxp1NqaahDg/00rOwz3
	xy6kGqdICg8xS8XtdXfuxqOpVuuZYn9rTtKVgXw/CODeywcj9WjZQ=;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Mailing List <linux-embedded@vger.kernel.org>
Cc: Tony Colclough <colclot@cisco.com>, Andrew Morton <akpm@linux-foundation.org>

I've been tracking down a problem with kernels 2.6.28 and 2.6.29 and it looks
like there is a race condition with using USB boot devices. Specifically:

o	The console specified with console=ttyUSB0 does not work
o	Using ip=169.254.0.21::169.254.0.21:255.255.0.0:zeus:eth0: does not
	configure eth0.

Both of these issues arise because the required USB devices aren't ready
when the rest of the kernel wants to initialize them and there is no way
to make the initialization wait for the devices. I opened a bug for this
and you can see the discussion of this issue, with alternative approaches, at:

	http://bugzilla.kernel.org/show_bug.cgi?id=12944

but the bottom line is that this is not regarded as a bug.

My question: are USB serial consoles and auto-configured network devices in
common use or is my application a special case? If the former, we need to push
for a better resolution. Otherwise, I'll go off and figure out something that
works for my application.
--
David VomLehn
