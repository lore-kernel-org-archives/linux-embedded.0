From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: [PATCH V2 00/16] Squashfs: compressed read-only filesystem
Date: Sun, 4 Jan 2009 20:04:49 +0100
Message-ID: <c384c5ea0901041104m31363264qd17d0181865c276@mail.gmail.com>
References: <E1Kv0C3-0006GU-ES@dylan>
	 <20081028192919.94def38b.akpm@linux-foundation.org>
	 <49606B7C.7050403@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760447AbZADTFT@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=l5W+jarIHgxckxE4jAofNViFuX3g01OiERCBSB2FC40=;
        b=feCdCb5WVSYl3CuzWu/cUkfd/oBvP7mOi/Zu8EVURWe2FzlqJyYG3F8FPkhGuSqm/Y
         CiYoJgnq3qJN71Yf3bImUJOqhlgqNTlBwhRfd/25Q8wMKxIdNdM3gEgvoRrmCavzdoUL
         S0E2C5Naa2ELSq+8qAPRQuZocGpAGN0c87XFE=
In-Reply-To: <49606B7C.7050403@lougher.demon.co.uk>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com, linux-next@vger.kernel.org, sfr@canb.auug.org.au

Hello,

On Sun, Jan 4, 2009 at 8:55 AM, Phillip Lougher
<phillip@lougher.demon.co.uk> wrote:
>> - what are the limitations of squashfs (please add this to the
>>  changelog of patch #1 or something).  Does it support nfsd? (yes, it
>>  does!)  xatrs and acls?  File size limits, entries-per-directory,
>>  etc, etc?
>
> Xattrs and acls are not supported, this is a todo.
> Filesize limits are in theory 2^64.  In practice about 2 TiB.
>
...
>
> Ok.  I'll re-spin the patches against 2.6.28 tomorrow (Sunday), and I'll
> prepare a tree for linux-next.
>

For use cases such as embedded firmware, the limitations are
non-interesting, and the compression savings are very interesting.
Especially where the resulting filesystem has to creep through slow
wires such as half duplex serial links etc.

Have been using squashfs 2.2 up to 3.4 without problems for years, for
distribution of Linux based firmwares into embedded devices.

Many thanks for your continued efforts on mainlining squashfs,

Regards,
-- 
Leon
