From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 02/16 v2] pramfs: super block operations
Date: Sat, 06 Nov 2010 15:59:51 +0100
Message-ID: <4CD56D67.9090106@gmail.com>
References: <4CD51847.20306@gmail.com> <20101106111627.GA13497@gandalf.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=seO1wZVBvadGYRn4NIuXKn/6xytxY2SqW2p/ceArGxA=;
        b=ondVQknbwZCHil/WjKar03D0qKImRGXhptvNOzOfuZXhZHFDvKx5AzRCLIEHkjiEPp
         vQMD+wd/CZg+rjGglHSxlK2hqXYjFeUKP/WpgqGhGlgm424usHoWcoO2dRGohkUDqZSc
         pQUCzItbDPBV3pc0nCMeyAzPJB/uCZX/OELhw=
In-Reply-To: <20101106111627.GA13497@gandalf.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Hogan <james@albanarts.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Il 06/11/2010 12:16, James Hogan ha scritto:
> Hi Marco,
> 
> On Sat, Nov 06, 2010 at 09:56:39AM +0100, Marco Stornelli wrote:
>> From: Marco Stornelli <marco.stornelli@gmail.com>
>> +static void pram_set_blocksize(struct super_block *sb, unsigned long size)
>> +{
>> +	int bits;
>> +
>> +	/*
>> +	* We've already validated the user input and the value here must be
>> +	* between PRAM_MAX_BLOCK_SIZE and PRAM_MIN_BLOCK_SIZE
>> +	* and it must be a power of 2.
>> +	*/
> 
> Should this comment have spaces after the tabs to be consistent with the
> other multiline comments (pram_ioremap) and the coding style?
> 

Ok, no problem.

Thanks for the review.

Regards,

Marco
