From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 08/16 v4] pramfs: headers
Date: Wed, 24 Nov 2010 09:23:02 +0100
Message-ID: <AANLkTikXxzcr+Ybru9vCt0+w6s-UYVNEudxvecF-0Xse@mail.gmail.com>
References: <4CE79C2F.5090001@gmail.com>
	<20101124080658.GC2212@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=fdDLx8c7uV5Hv0JyUXYhKG5KjPbU1FwETWtuVQ8IcQk=;
        b=jNyVYn7krKxsv+jBfnmW4CpbbgHf+bPub7DZvwiK/qRSr0kG3LlAh5DQQ4UCAH6udX
         YkmxMZC/1tsH6HtbZVlSITLAay2K4SIGJmrwP98R/yHz93FLfJaVMlX3ZqLwLgpor4xH
         biMqBbVHy3DRsaPtUQ0bjHUzhGb4yy1riRwNs=
In-Reply-To: <20101124080658.GC2212@linux-sh.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Paul Mundt <lethal@linux-sh.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@suse.de>, Tim Bird <tim.bird@am.sony.com>

2010/11/24 Paul Mundt <lethal@linux-sh.org>:
> On Sat, Nov 20, 2010 at 11:00:15AM +0100, Marco Stornelli wrote:
>> +/*
>> + * Debug code
>> + */
>> +#define pram_dbg(s, args...) pr_debug("PRAMFS: "s, ## args)
>> +#define pram_err(s, args...) pr_err("PRAMFS: "s, ## args)
>> +#define pram_warn(s, args...) =A0 =A0 =A0 =A0pr_warning("PRAMFS: "s=
, ## args)
>> +#define pram_info(s, args...) =A0 =A0 =A0 =A0pr_info("PRAMFS: "s, #=
# args)
>> +
> Please kill off all of this and just use KBUILD_MODNAME centrally.

I didn't know this way to do, I'll look at it.

>
>> +#ifdef CONFIG_PRAMFS_WRITE_PROTECT
>> +extern void pram_writeable(void *vaddr, unsigned long size, int rw)=
;
>> +
>> +#define wrprotect(addr, size) pram_writeable(addr, size, 0)
>> +
>> +#else
>> +
>> +#define wrprotect(addr, size) do {} while (0)
>> +
>> +#endif /* CONFIG PRAMFS_WRITE_PROTECT */
>> +
> Perhaps this should be pram_wrprotect()? Does this really benefit fro=
m
> being a config option instead of a mount option? Will this handle
> multiple mounts with some write protected and others not?

See my previous response.

>
>> +#ifdef CONFIG_PRAMFS_WRITE_PROTECT
>> +static inline void pram_memunlock_range(void *p, unsigned long len)
>> +{
>> +#ifndef CONFIG_X86
>> + =A0 =A0 local_irq_disable();
>> +#endif
>> + =A0 =A0 preempt_disable();
>> + =A0 =A0 pram_writeable(p, len, 1);
>> +}
>> +
> This needs some explaining, or killing. While the latter is preferabl=
e,
> we can also work with the former.
>

Maybe I didn't understand, you mean preemt_disable() without disabling
the interrupt?
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
