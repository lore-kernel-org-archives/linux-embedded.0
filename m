Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0251DFDBB
	for <linux-embedded@vger.kernel.org>; Tue,  3 Dec 2024 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218981; cv=none; b=q8ZNVAanay6fIKm8sHP39mReSTrrhYC5mC0iGKaJ6fuJzn3iAh9lJTG4wI+tH4KVnAClEB675RnZD+k9bX9tagTW82phNNG20/Ih5u1OdxwL8xNc6jrcGKsBUMgRYDldlxwyy8W+QhQTYJHSXJulppL0YYRxH0hM8JYLHcUBLuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218981; c=relaxed/simple;
	bh=eI/zlvotZwgY5z3hpeCnHw7eRH68Seup4RbHSkhiGkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEoV7AxESH96gT+gZa/J/ZJXqPkkf5THWgoMw0VOnAenXlKRH8FtEkCtpaX5totcOli7puEYTJYg53IY5wYqPd8KgKVoZw+/Cs0XxXHP8L5KaIgwFMDgxNoZk1uzIms7a7I5xi2WmKZaWZBx7MTACCpLwquuID/LXyfjPgTC7W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LPzoQvbu; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LPzoQvbu"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d0e75335e3so2714590a12.3
        for <linux-embedded@vger.kernel.org>; Tue, 03 Dec 2024 01:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733218977; x=1733823777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BZ65AI7tC1O9ChcL3cBFeeFnnzp7y2faeUES++bs0As=;
        b=LPzoQvbuVyWF12nFcV4LxWmRbEMOc3zBmmZPKZ5Or6awjzlk0Xoj7h4IK8pt2OkgLu
         yrZLRmVts603gf+EXs2CnjeKCxhH3btsHb79DTz+4YnqA5aEVVGClZRqCLaWFWcinUQw
         +KdntxFvRus6KNq96W2ueyNUElbHzfgDwU5LrAjzK7XB5foGYkr/988tnqWTJ7hKFJVt
         6jx3QdTpdTPiZ7UkflOGGy6ywkMawDOWryfXa5xvaWeT5LkegIdGsBFyAigRCqnPcxc2
         KTZWYLexlVX4VRPORnPmEAF6URNFa850TmVQfDfOm8y1p+yCmldqUCa+WOG0zeRYCenW
         9rMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733218977; x=1733823777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ65AI7tC1O9ChcL3cBFeeFnnzp7y2faeUES++bs0As=;
        b=dho4BbXbUF4jr8TrHrSkVJWuWe+Zm8LUisQF8s9eLo/yy6Y2b35/JzPqWxmtSnXyqX
         B1ZeAFldnSMnBTJD2hkfHnv95K4FWcsC7kr9F3mc5Z5p8D112ldHxRpMAr7DvxPktXPR
         JuMrkWyeoPLuad/XCa1BFmLCJWIs+29UbN8ap7xY5aTOqECtTivbmHfvCaw2/2g6HKJQ
         qTSOTY2eGsavlIVMrG9iXlK/zJ40tF1yQVJG+cg9qgAk3h/QlrTV6xmjJqoTj3iP1EX9
         jSlOaCNwyhHqPFFI8hyyic/HBZIUmtoxdvjt3rr6V+Gouhs1npCP3cYu56AHy6OMUHQy
         IZNg==
X-Forwarded-Encrypted: i=1; AJvYcCVMfEq4OE4G6YO83DTnYj3xy/8wJ23Bfxgk0eC0U202dehTp17zmwi3gt3WBStyD+xzJuRmkqX6WpgkKJTt5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0fBYZcmeWLiXvosvNfdAmP6z/m8k2uNjPbm7p1bPog7AEyCHQ
	MeMwWeFmT/VqrZQaLdfeJiLibhR/uMSroJTStWnfHG0CqKygYbX8bdXK4lLtwws=
X-Gm-Gg: ASbGnctkzMC6kNePJXG/8t1TSJpk9+H70yx2xmTOzbV680w1k0X2QH9czIkaF4o/ABE
	TPml8ljeDMkrbnQn0R8XbEinI4uf9Id1NATc1RR563U/oIzLk+5aorRTXK6wHpgGXMx5R+ldOf9
	rOpmpJFTluXdwPTN3c8gvnKe/cSx+P/eaSqPhpNGkDsx/QeGKHyUmKUPIXW45O3NQT+Zy4ZGvxA
	ZA4DJIiIr1HxpG8Ewdr+l3JaBBRYAqIEpvnSQVT8VtA1BMVLEM=
X-Google-Smtp-Source: AGHT+IEWivrrnwu01aHjd05LieGWf9F73ovQH7u5YJJEWQyT7aV4tCY7q79YBHBj7VdFuUyY7CbEHg==
X-Received: by 2002:a05:6402:34d4:b0:5d0:b9c7:479a with SMTP id 4fb4d7f45d1cf-5d10cb7d34fmr1417735a12.25.1733218977310;
        Tue, 03 Dec 2024 01:42:57 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d098330dd2sm6011293a12.14.2024.12.03.01.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:42:56 -0800 (PST)
Date: Tue, 3 Dec 2024 10:42:54 +0100
From: Petr Mladek <pmladek@suse.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Isaac J. Manjarres" <isaacmanjarres@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>, surenb@google.com,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Re: [PATCH v2] printk: Improve memory usage logging during boot
Message-ID: <Z07SnoKSwHQ_y2j2@pathway.suse.cz>
References: <20240930184826.3595221-1-isaacmanjarres@google.com>
 <ZvwZV5MDlQYGJv9N@pathway.suse.cz>
 <CAMuHMdX_r05iUFw6-Jj8Utry5bHdE6=U46uB4Za1NTsdZOuOMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdX_r05iUFw6-Jj8Utry5bHdE6=U46uB4Za1NTsdZOuOMw@mail.gmail.com>

On Sun 2024-12-01 12:40:13, Geert Uytterhoeven wrote:
> Hi Petr et al,
> 
> CC linux-embedded
> 
> On Tue, Oct 1, 2024 at 5:55 PM Petr Mladek <pmladek@suse.com> wrote:
> > On Mon 2024-09-30 11:48:24, Isaac J. Manjarres wrote:
> > > When the initial printk ring buffer size is updated, setup_log_buf()
> > > allocates a new ring buffer, as well as a set of meta-data structures
> > > for the new ring buffer. The function also emits the new size of the
> > > ring buffer, but not the size of the meta-data structures.
> > >
> > > This makes it difficult to assess how changing the log buffer size
> > > impacts memory usage during boot.
> > >
> > > For instance, increasing the ring buffer size from 512 KB to 1 MB
> > > through the command line yields an increase of 2304 KB in reserved
> > > memory at boot, while the only obvious change is the 512 KB
> > > difference in the ring buffer sizes:
> > >
> > > log_buf_len=512K:
> > >
> > > printk: log_buf_len: 524288 bytes
> > > Memory: ... (... 733252K reserved ...)
> > >
> > > log_buf_len=1M:
> > >
> > > printk: log_buf_len: 1048576 bytes
> > > Memory: ... (... 735556K reserved ...)
> > >
> > > This is because of how the size of the meta-data structures scale with
> > > the size of the ring buffer.
> > >
> > > Even when there aren't changes to the printk ring buffer size (i.e. the
> > > initial size ==  1 << CONFIG_LOG_BUF_SHIFT), it is impossible to tell
> > > how much memory is consumed by the printk ring buffer during boot.
> > >
> > > Therefore, unconditionally log the sizes of the printk ring buffer
> > > and its meta-data structures, so that it's easier to understand
> > > how changing the log buffer size (either through the command line or
> > > by changing CONFIG_LOG_BUF_SHIFT) affects boot time memory usage.
> > >
> > > With the new logs, it is much easier to see exactly why the memory
> > > increased by 2304 KB:
> > >
> > > log_buf_len=512K:
> >
> > printk: log buffer data + meta data: 524288 + 1835008 = 2359296 bytes
> >
> > > log_buf_len=1M:
> >
> > printk: log buffer data + meta data: 1048576 + 3670016 = 4718592 bytes
> 
> Thanks, this is very useful information!
> 
> Isn't this kernel log message bookkeeping becoming a bit too excessive?
> E.g. on a small system:
> 
>     printk: log buffer data + meta data: 65536 + 204800 = 270336 bytes
> 
> Why is the meta data that big (> 3*log buffer)?
> 
>     #define PRB_AVGBITS 5    /* 32 character average length */
> 
>     unsigned int descs_count = log_buf_len >> PRB_AVGBITS;
>     meta_data_size = descs_count * (sizeof(struct prb_desc) +
> sizeof(struct printk_info));
> 
>     struct prb_data_blk_lpos {
>             unsigned long   begin;
>             unsigned long   next;
>     };
> 
>     struct prb_desc {
>             atomic_long_t                   state_var;
>             struct prb_data_blk_lpos        text_blk_lpos;
>     };

I am afraid that we could not do much about the size of this part.
All the variables are important parts of the lockless machinery.

> i.e. 12 bytes on 32-bit, 24 bytes on 64-bit.
> 
>     #define PRINTK_INFO_SUBSYSTEM_LEN       16
>     #define PRINTK_INFO_DEVICE_LEN          48
> 
>     struct dev_printk_info {
>             char subsystem[PRINTK_INFO_SUBSYSTEM_LEN];
>             char device[PRINTK_INFO_DEVICE_LEN];
>     };

This is probably the lowest hanging fruit. It should be possible
to write these dev_printk-specific metadata into the data buffer
a more efficient way and only for records created by dev_printk().

It would require adding "dict_len" into "struct printk_info"
and reserving space for both "text_len" and "dict_len".

We bundled it into the metadata because these are metadata.
We wanted to keep the design as clean as possible. We focused
mainly on the stability and maintainability of the code.
And it was really challenging to get it all working.

>     struct printk_info {
>             u64     seq;            /* sequence number */

I do not recal the details. But I think that we need to
explicitely store the 64-bit "seq" number in the metadata
because of the lockless algoritm. It helps to solve
problems with wrapping of the counter in
"atomic_long_t state_var".

It was not stored before. The following global values were
enough when the log buffer was synchronized by "logbuf_lock"
spin lock:

	static u64 log_first_seq;
	static u64 log_next_seq;

>             u64     ts_nsec;        /* timestamp in nanoseconds */
>             u16     text_len;       /* length of text message */
>             u8      facility;       /* syslog facility */
>             u8      flags:5;        /* internal record flags */
>             u8      level:3;        /* syslog level */
>             u32     caller_id;      /* thread id or processor id */

These metadata used to be stored in the "data" buffer next to the
message. Here is the declaration from v6.9:

	struct printk_log {
		u64 ts_nsec;		/* timestamp in nanoseconds */
		u16 len;		/* length of entire record */
		u16 text_len;		/* length of text buffer */
		u16 dict_len;		/* length of dictionary buffer */
		u8 facility;		/* syslog facility */
		u8 flags:5;		/* internal record flags */
		u8 level:3;		/* syslog level */
	#ifdef CONFIG_PRINTK_CALLER
		u32 caller_id;            /* thread id or processor id */
	#endif
	}

>             struct dev_printk_info  dev_info;

As I wrote above. It should be possible to store these metadata more
effectively in the data buffer.

But note that it is only about the internal kernel code. These change
would require also updating external tools, for example "crash" tool.

>     };
>
> for a whopping 88 bytes.  So that totals to 100 bytes per entry
> on 32-bit, and 112 on 64-bit, for an average of 32 characters per
> printed message...

It would be interesting to know how much if these are wasted because
either struct dev_printk_info is empty or the entries are shorter.

Best Regards,
Petr
