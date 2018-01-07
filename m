From: Martin Kelly <martin@martingkelly.com>
Subject: Re: [PATCH] tools: fix cross-compile var export
Date: Sun, 7 Jan 2018 13:43:32 -0800
Message-ID: <737bf492-63bc-0f97-9811-b0c90b5f60c6@martingkelly.com>
References: <20180106201601.11074-1-martin@martingkelly.com>
 <20180107161140.GM6273@windriver.com>
 <549cf839-9ae7-78ce-58df-3d84fc7b3d05@martingkelly.com>
 <20180107190453.GN6273@windriver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=martingkelly-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BVf/wRt5O9Clb577UZSklRGNffncAhejxDtBDQplspc=;
        b=VqeaYmwufbG3PRw/lmSsXefaZnjlAEpISeDkwgsfse4jgcW8vJBgppI6qujuvx2bxx
         L4QsQOMRvUH5VSmlI9iwrStISRmGcZbnUvAus0aXEfxRSw/ejt9xXClQnpZ7ofzzHa42
         0Ewp6aGtXYSA5k2XR6HBfnqJfcROPUo/69IAXjQx9iuSqcdsjRPckHRr7OKd/TjnVl9+
         eUJsrRiGltx3TFCx5wfU5MqAt5zifQDCXlPcHtu0tJAfD9xk3uIAZtUvm9CrXwObOOAO
         UQppbEOFZog1OWE1pG85z3Qv6+LUmg0KdOnTL6mD+O3gpWPn9xWWRQRL0neL0M5kbR74
         KiSQ==
In-Reply-To: <20180107190453.GN6273@windriver.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-embedded@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Matt Mackall <mpm@selenic.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On 01/07/2018 11:04 AM, Paul Gortmaker wrote:
> [Re: [PATCH] tools: fix cross-compile var export] On 07/01/2018 (Sun 10:31) Martin Kelly wrote:
> 
> [...]
> 
>> With the change, we add do CC = $(CROSS_COMPILE)gcc if and only if CC is not
>> already set. I'm happy to add all these details to the commit description.
> 
> That is probably a step in the right direction.  I contribute to yocto
> on a regular basis and hence am sympathetic to these frustrating SDK
> type issues.  But after a quick scan of this patch it wasn't obvious to
> me that existing behaviour was preserved, or that it would be a pain to
> separate it into chunks. (key word here being "quick")
> 
> So I'd recommend updating the commit log, and adding a Cc: line for the
> maintainers of each subsystem below, and then if nobody complains you
> might get akpm to pick it up as he does for other patches w/o a clear
> maintainer or subsystem.
> 
> P

Thanks, I have done so. I also contribute to Yocto and indeed, SDK 
issues are all-to-common.
