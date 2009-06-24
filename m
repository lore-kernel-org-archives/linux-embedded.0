From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Wed, 24 Jun 2009 18:49:11 +0200
Message-ID: <4A425907.2060105@gmail.com>
References: <4a4254e2.09c5660a.109d.46f8@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=WORJXLDhMIrhxAwms4T5gnHHAxA3slp0HtKsRxH++io=;
        b=M8fXAnXV2z5Ru+ScX13F8EYIQuZDuHZadNQND9DRuAVnDpVVD3nVHObbM7Ou9Q4vii
         uj/ruBn2lppGK/qqMBT+2aULljgMtYrDRHVCxXxtQP7eEm6Gk7UvjwLsRNLf9H7A7jGh
         MHy996Ilol7m7PjnU7RH5240VYMA/pckNwbc4=
In-Reply-To: <4a4254e2.09c5660a.109d.46f8@mx.google.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pavel@ucw.cz
Cc: tim.bird@am.sony.com, jamie@shareable.org, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

>> Pavel Machek wrote:
>>> On Mon 2009-06-22 14:50:01, Tim Bird wrote:
>>>> Pavel Machek wrote:
>>>>>> block of fast non-volatile RAM that need to access data on it using a
>>>>>> standard filesytem interface."
>>>>> Turns a block of fast RAM into 13MB/sec disk. Hmm. I believe you are
>>>>> better with ext2.
>>>> Not if you want the RAM-based filesystem to persist over a kernel
>>>> invocation.
>>> Yes, you'll need to code Persistent, RAM-based _block_device_. 
>> First of all I have to say that I'd like to update the site and make it
>> clearer but at the moment it's not possible because I'm not the admin
>> and I've already asked to the sourceforge support to have this possibility.
>>
>> About the comments: sincerely I don't understand the comments. We have
>> *already* a fs that takes care to remap a piace of ram (ram, sram,
>> nvram, etc.), takes care of caching problems, takes care of write
> 
> Well, it looks pramfs design is confused. 13MB/sec shows that caching
> _is_ useful for pramfs. So...?

caching problems means to avoid filesystem corruption, so dirty pages in
the page cache are not allowed to be written back to the backing-store
RAM. It's clear that there is a performance penalty. This penalty should
be reduced by the access speed of the RAM, however the performance are
not important for this special fs as Tim Bird said, so this question is
not relevant for me. If this issue is not clear enough on the web site,
I hope I can update the information in the future.

> 
>> You are talked about journaling. This schema works well for a disk, but
>> what about a piece of ram? What about a crazy kernel that write in that
>> area for a bug? Do you remember for example the e1000e bug? It's not
> 
> I believe you need both journaling *and* write protection. How do you
> handle power fault while writing data?
> 								Pavel

Ah now the write protection is a "needed feature", in your previous
comment you talked about why not use ext2/3.......

Marco
