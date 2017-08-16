From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: RE: [PATCH v2 1/5] cramfs: direct memory access support
Date: Wed, 16 Aug 2017 15:44:29 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1708161541590.17016@knanqh.ubzr>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org> <20170816173536.1879-2-nicolas.pitre@linaro.org> <SG2PR06MB1165518B81E3855C36CBC9A18A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=5MvwliUQ1rBsdp6kpxjWtMnFi6ywzY6a5NL939Fl4NI=;
        b=AqNT7eijV6BC/hMwksYhNHRH7iGKIKfdet+WVZMUQAru0shBhNuqXiN8gOLkyTTED5
         FsE5QcGiDvfIe4atwbzyrOolsP2yqqjO5xBeVR5K8cXGuhCxku8JPnk37BqCYzRQBv/h
         a8bdyjyye8h4Ja2UI9rtA7eE+gANIL+gcKXmY=
In-Reply-To: <SG2PR06MB1165518B81E3855C36CBC9A18A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, 16 Aug 2017, Chris Brandt wrote:

> On Wednesday, August 16, 2017, Nicolas Pitre wrote:
> > +	bool "Support CramFs image over a regular block device" if EXPERT
> > +	depends on CRAMFS && BLOCK
> > +	default y
> > +	help
> > +	  This option allows the CramFs driver to load data from a regular
> > +	  block device such a disk partition or a ramdisk.
> > +
> 
> 
> trailing whitespace

Yeah... Fixed it and the others in my git repo, thanks.
This is something that can be done with git apply --whitespace=fix so I 
won't repost unless I get more comments.


Nicolas
