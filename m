From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 01/16 v2] pramfs: documentation
Date: Sat, 06 Nov 2010 15:59:15 +0100
Message-ID: <4CD56D43.2010803@gmail.com>
References: <4CD51832.7070309@gmail.com> <20101106103935.GA13172@gandalf.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=KkadXfeuzEb1f4ao4QcNyQEqmUfaZ2KkiISE9S2pcG0=;
        b=LZuVvxjxtw5c5oNQFEGonCHc64p0Ru5hMdLUtq/AVBydoTeBit+MipE3MShkCFtjdz
         lcRRQAKD0hnwSEjCmOpq+kiHkVyBjnIj2yd+kjCqZ15/wee1kXqyM/SgeWYdr1qJufAL
         HlPmWAuhYVNDAaOYbLGfv+XY04700sSN3Sk5M=
In-Reply-To: <20101106103935.GA13172@gandalf.local>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Hogan <james@albanarts.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Il 06/11/2010 11:39, James Hogan ha scritto:
> Hi,
> 
> On Sat, Nov 06, 2010 at 09:56:18AM +0100, Marco Stornelli wrote:
>> From: Marco Stornelli <marco.stornelli@gmail.com>
>> +PRAMFS is write protected. The page table entries that map the backing-store
>> +RAM are normally marked read-only. Write operations into the filesystem
>> +temporarily mark the affected pages as writeable, the write operation is
>> +carried out with locks held, and then the page table entries is +marked read-only again.
>> +This feature provides protection against filesystem corruption caused by errant
> 
> Looks like an accidental lost newline in the patch here, should that be
> "are marked" or is there some text missing?
> 

My fault, a problem during email formatting. I'll resend this patch.

Marco
