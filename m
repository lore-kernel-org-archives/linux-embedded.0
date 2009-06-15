From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 15 Jun 2009 19:42:54 +0200
Message-ID: <4A36881E.8010009@gmail.com>
References: <OFD1325B2C.7A926EF9-ON882575D6.00567314-882575D6.00571BC3@us.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=kqA7nhETKGa7RP8fZpNqP6Hb9R4o0w2HptVsZIpV6rc=;
        b=Zr8wCQmEtN8KC6N5kYemTOoY1LAn3LDL630MO/R5cIiGWLYRLbY1yhvLrp6PkW99yx
         OBsOMZ9ly5kwYh+RtJQMrotR7dZXXB8mB7VmWxVF5rF/Eu9IGGY2EADot6pu6E0iM6a+
         ZFNGG/Jijpl8JeKglRW1lT2xonc9nZvixruag=
In-Reply-To: <OFD1325B2C.7A926EF9-ON882575D6.00567314-882575D6.00571BC3@us.ibm.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bryan Henderson <hbryan@us.ibm.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Daniel Walker <dwalker@soe.ucsc.edu>, Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Bryan Henderson wrote:
>> Marco wrote:
>>>    To enable direct
>>>    I/O at all times for all regular files requires either that
>>>    applications be modified to include the O_DIRECT flag on all file
>>>    opens, or that a new filesystem be used that always performs direct
>>>    I/O by default."
>> This could be done as well by just introducing a "direct_io_only"
>> mount option to a file-system which would need this feature.
> 
> But it's possible that there's just no advantage to having a block device 
> in the stack here.  When unix block devices were invented, their main 
> purpose was that they could reorder reads and writes and do buffering and 
> caching -- all things essential for disk drives.  We don't want to stretch 
> the concept too far.
> 

Yes I agree, we can't in this case talk about read and write reordering,
buffering and caching because we're talking about something completely
different from a classic disk. The issues of this kind of fs are more
similar to the tmpfs issues.

Marco
