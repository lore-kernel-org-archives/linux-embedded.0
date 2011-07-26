From: David Wagner <david.wagner@free-electrons.com>
Subject: Re: [PATCH] UBI: new module ubiblk: block layer on top of UBI
Date: Tue, 26 Jul 2011 14:58:57 +0200
Message-ID: <4E2EBA11.6000700@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com> <1311683250-7921-1-git-send-email-david.wagner@free-electrons.com> <20110726123453.GA18513@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110726123453.GA18513@infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com, dwmw2@infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, tim.bird@am.sony.com

On 07/26/2011 02:34 PM, Christoph Hellwig wrote:
>> TODO:
>>  * the modules keeps a table of the devices which length is the
maximum number
>>    of UBI volumes.  It should make use of a linked list.
>
> A linked list isn't very nice either.  Try using idr, which gives you
> both an allocator for the minor number space, and a way to look up
> the structure by that index.
>

I'll take a look ; is it really worth it, though ? I look in the table
only when a volume is created, resized, or removed (that is, rarely) and
there are really few items (I bet, between 1 and 8 ; max possible is 4096).

>> Advantages of ubiblk over gluebi+mtdblock_ro:
>
> This section should be in the main commit log, and not that part with
> the changelog which gets dropped.

Will do.

>> +int major;
>
> Please don't use global variables with generic names.  In this case you
> should neither make it global nor give it a generic name.
>

fixed.


Thank you for your feedback :)

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
