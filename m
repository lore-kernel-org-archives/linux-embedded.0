From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 08/14] Pramfs: Makefile and Kconfig
Date: Sun, 14 Jun 2009 09:16:08 +0200
Message-ID: <4A34A3B8.2050502@gmail.com>
References: <4A33A802.8040507@gmail.com> <1244901732.5982.221.camel@desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=KE+0jM/A5IYML0ZF5sk2GHXNUh90QzjoU3dn8i7JatA=;
        b=utbCsVqnAPr/ffSlebkkmkQ61UQeiz32PTe+w4fqQFkkbsuhejrKXgRHqpkNdoEeam
         TV45Fm/DT1Gs7+Bw4yNBvst9alGX0+c/HZGcdFXuwPCb9hCEBYeVCVPuMF8oII3ZUS5R
         eWtbS1YFd+wJMNLj/aoTQ2U+2HdoghpcyT0Pk=
In-Reply-To: <1244901732.5982.221.camel@desktop>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Walker <dwalker@fifo99.com>
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>

Daniel Walker wrote:
> On Sat, 2009-06-13 at 15:22 +0200, Marco wrote:
>> From: Marco Stornelli <marco.stornelli@gmail.com>
>>
>> Makefile and Kconfig.
>>
>> Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
>> ---
>>
> 
> You should move this patch to 11 of 14, as I think that is the point
> when the filesystem can actually be enabled and function. If this series
> is only applied up to this patch you can get build failures if you
> enabled PRAMFS, XIP, or any of the other features. Also breaking out the
> individual features menuconfig options like XIP, and write protect, etc,
> into their respective patches would be nice.
> 
> Daniel
> 
> 

Ok Daniel thanks for your comments. Actually I split the patches by
functionality because I think that for this series it's a little bit
complicated to follow a sequence so as not to have building failure but
I can try. I think the only part I can split is the XIP. I think there
will be a lot of comments so I'll wait for other comments before to
re-submit other patches.

Marco
