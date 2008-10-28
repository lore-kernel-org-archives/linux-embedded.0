From: "Fredrik Johansson" <frejo242@gmail.com>
Subject: Re: USB, Host and Device on the same machine
Date: Tue, 28 Oct 2008 08:42:11 +0100
Message-ID: <53e45cc30810280042q278d6c9cu74bbb3ba1a665186@mail.gmail.com>
References: <53e45cc30810240018w1c3c73c2nf9a9b606e0e7dea4@mail.gmail.com>
	 <200810270944.47246.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=aEFGbgAVNy2obwDy1JCHva1nZYApFGK9xFnIcw0tbts=;
        b=Hnol/HaqZ8Q0Jxxybs1g0d62CPDirCXKy8Z2HUmpovLfGYJk8TF058B4oOrarmitcX
         t96N19OaYLdxbLFP47cE9+LS01rc8Z6qBTCD2Z/nNOyW9LZNyxlmI88s5IFx+XZKaXGs
         HvmoT68LWWNRiDWj7VNVuoSWbG7HC2xt3Q864=
In-Reply-To: <200810270944.47246.david-b@pacbell.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Brownell <david-b@pacbell.net>
Cc: linux-embedded@vger.kernel.org

> If the OTG controller exposes EHCI as its host interface, it
> sure *ought* to be managed by the EHCI driver.  Maybe you
> should be submitting a patch adding OTG glue to EHCI?
>
> If it's not exposing EHCI as its host interface, then it seems
> your OTG driver is quite buggy...
>

Thanks for the advice.
The OTG controller was exposed as a host and it was my fault...
It was a miss in my kernel config where I had enabled host
functionality on the OTG controller, disabling host functionality
solved the problem since I only want to use it as a device.

Regards

Fredrik Johansson
