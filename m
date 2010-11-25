From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 04/16 v4] pramfs: file operations
Date: Thu, 25 Nov 2010 13:12:38 +0100
Message-ID: <AANLkTiks+N38Si0K1nhcOhtg9wOOf5tmAaUk+ZYvCJC0@mail.gmail.com>
References: <4CE79BD0.3030200@gmail.com>
	<20101124075818.GB2212@linux-sh.org>
	<AANLkTinF2NX9e7deTvDa8zQ0PA4u0ch0xrNWk0FaqvGV@mail.gmail.com>
	<20101124083024.GE2212@linux-sh.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=/TQa3mwwYjkqCCXtJ3SKfLA6LpIOc7Va8ZH89n+xrsE=;
        b=n/QZWiJGhL7KtEE0uDsJeceOsGCKj8WL4U4qsAdIWyHtQaRAfPyvPhzz2/e4KH40Zp
         nYGaId/bexcFBNvTjCvW7a14uXAkDEItcROejrz+qyD8DwLVZZHpmulkPAjh06iqlerZ
         xjUlzPQ1/qYFa5t988Ds9ytYhSGa0Gw+gkypk=
In-Reply-To: <20101124083024.GE2212@linux-sh.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mundt <lethal@linux-sh.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Tim Bird <tim.bird@am.sony.com>, Greg Kroah-Hartman <gregkh@suse.de>

2010/11/24 Paul Mundt <lethal@linux-sh.org>:
> On Wed, Nov 24, 2010 at 09:11:13AM +0100, Marco Stornelli wrote:
>> 2010/11/24 Paul Mundt <lethal@linux-sh.org>:
>> > most of this from ext2, I'm curious why you opted to hardcode this
>> > instead of maintaining the flexibility that ext2 XIP has over this.
>>
>> First of all because it was simpler :) In addition there was some
>> design problem to use it in combination with the memory protection.
>
> Do you have more details on this? You can easily check for unsupportable
> configurations with mount options and bail out accordingly.
>
>> The difference with ext2 is that we aren't talking about a general
>> purpose fs used (mainly) on normal desktop/server systems, but a
>> specific fs for embedded world, so I think some little constraints are
>> ok.
>>
> I'm not sure what your point is. It's not a general purpose file system,
> but that's not an excuse for taking shortcuts. Out of the boards on my
> desk, I have at least 3 that could make use of this file system where I
> could use both XIP and non-XIP for different stores out of the box. I
> wouldn't exactly call it a corner case. Also, as Tony's patch set
> demonstrates, these sorts of non-volatile data stores are common enough
> in the server space to make pramfs an option there, too. Please lose this
> mentality that because something was originally tasked for embedded it's
> perfectly acceptable to ship a crippled interface.

I'm not responsible if someone uses something outside its scope, you
can use FAT on a flash but you can't claim reliability. However since
I'm a collaborative person I'll try to fix it, implementing where
possible a mount option.

>
> As it is, this is something that will have to be rewritten one way or the
> other, but whether that happens in or out of staging/ is not such a big
> concern.
>

Good.

Marco
