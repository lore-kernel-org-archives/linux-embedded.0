From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH] devtmpfs: support !CONFIG_TMPFS
Date: Fri, 12 Mar 2010 12:38:08 +0100
Message-ID: <87aaud22jj.fsf@macbook.be.48ers.dk>
References: <1268389504-22179-1-git-send-email-jacmet@sunsite.dk>
	<4B9A2548.7050401@msgid.tls.msk.ru>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:from:to:cc
         :subject:references:date:in-reply-to:message-id:user-agent
         :mime-version:content-type;
        bh=ktQgF9wRGE7oo9NkddQeXoT6P7Gv7aXxssv+KtyGQ4Y=;
        b=DoOUebNVMLjVSA5L2M+fdNT37v71leDCQ5xctWuFpzsX2R5pDjeOwVAPapw/uGCmLJ
         xUmA4RmrLgu3Zs01sQ6Mh/Ey0Eg5HnWy9dnBINTLPVjg1KPTgX+FWTUEuwb00yj4HeIB
         Dj3Sg519tlE8JF/Mqc1nlS98qh5yXpcgx+ivM=
In-Reply-To: <4B9A2548.7050401@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Fri, 12 Mar 2010 14:28:08 +0300")
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: kay.sievers@vrfy.org, gregkh@suse.de, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

>>>>> "Michael" == Michael Tokarev <mjt@tls.msk.ru> writes:

Hi,

 >> +#ifdef CONFIG_TMPFS
 >> return get_sb_single(fs_type, flags, data, shmem_fill_super, mnt);
 >> +#else
 >> +	return get_sb_single(fs_type, flags, data, ramfs_fill_super, mnt);
 >> +#endif
 >> }

 Michael> May be completely not to the point or even wrong, but I were
 Michael> starring at this change for quite some time trying to understand
 Michael> what's the difference.  Can we do it like this:

 Michael> #ifdef CONFIG_TMPFS
 Michael> # define devtmpfs_fill_super shmem_fill_super
 Michael> #else
 Michael> # define devtmpfs_fill_super ramfs_fill_super
 Michael> #endif
 Michael>   	return get_sb_single(fs_type, flags, data, devtmpfs_fill_super, mnt);

 Michael> ?

Sure, if people find that cleaner - Kay?

-- 
Bye, Peter Korsgaard
