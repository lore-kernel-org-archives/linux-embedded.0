Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9E535AC19
	for <linux-embedded@vger.kernel.org>; Tue, 10 Mar 2026 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139406; cv=none; b=lR/Fd8Xrnw53bzE537a4/pRVtHZwfC+bDK9ti4+fHw7X2XE19OsF3Ni5SNqzH2wGCCpPnKSxU4Avb/xGkhJJMcWwkMXR667e97ZqyISxTcs4ng8gw5GDTg5AtU43/zv4VxlEL4dzIMYMNBG/jwGJQrVs3CBUNGdO0/RUfTS9l1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139406; c=relaxed/simple;
	bh=hJmNPM0PPEtKKRmbjvZKMNh1FUwafoUhWzAwf5nP1Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ho5+PxJ/7rK3STPz01fKDTFQgBaz5BIsw8xtkhmH5Sx6D96PsHQahWLSmYkzbHx9ov5W0di5eAtOiUqk6YKOF0f7f3R1IozUHSTHXzOQJeSksvBc41dFq68xXQ/gkbLJb3tS8Zc7jVrxxDKxFEVf57Ylsn6ZX1f/eeB/iaw2hvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OsTeNtQ8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OsTeNtQ8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b6d9c981so6242706f8f.1
        for <linux-embedded@vger.kernel.org>; Tue, 10 Mar 2026 03:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773139403; x=1773744203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bNsnNefxFtQwEZkYSGSY+g+1450IDnt0jt+/dU56Lyk=;
        b=OsTeNtQ8l5H6XyOBklLrB9Xhz/1dqwQwBjRh1T6w6y7ID7J9s+nJulmr6SEnOQFRro
         IAaOx/iiyDq82L0P8AyQVY51V3VzO82sv1ylh6TG9pmBlhhi9hKePMHO9YPQMbsN1wev
         vCTxqCpqUZ+HfYkAiA/qYtyMM7DZD+Uz4cabdahT4kmkTlKL4L07JxL8DQ/Utt3o8rk2
         rTdimQMWgAR/nCv0+hkiSuo/ho2KmbLZQXjNEXadyHWgOiECC22Y/xjyUreiaC6jTbBU
         4KLoAL5LBVdY/tAS8Kwn2FWB3zsp9XS2e+BPFMAh7xQHDcPJKgOFoT6fCEb+qArEpSNu
         /BnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139403; x=1773744203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNsnNefxFtQwEZkYSGSY+g+1450IDnt0jt+/dU56Lyk=;
        b=hVKZDeRBoSwpMbwDZPyxg3gdJUh1RDOgbNrWYFVZp/LL9qSidevHUdeSpl+VtUmSuC
         xki1Nj4zBnjk1LKDM4mx6XONpRoWUEjnAIiJQbvx90vLuE+ceA51kVI+wntvh5YvsMNr
         p+9gR8PIiHR6SplWjVnqcj8h7RgmEMnflD+W5V1/ymkMD/vUwo/1xL/gzstmdRq+I3Y+
         vfica5lhtQgKJKM9mhHrgRjakfwywFlvo/Lfx8TneJOatXt5/EVt8GMszRr+eYkUiG8y
         4wqoVwhDr0rcbb/CgdpUTJYBtBJjt/bQCNorR1aW9A8LSSBIPjbrzvO5PJiGgr829TIO
         7nPA==
X-Forwarded-Encrypted: i=1; AJvYcCUBCwww09LnLLDMNXH3dMFbkBNb8ChdpM+Jjn8WfwQiH1rVCdCZ0LSl7ubUXZnT6q6PcEVlbbnxpt7bJYmk/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0H+sJDoccbAXhwB2VT56KcqWTVpLp2xKymBtnxoeaGMzVGS8e
	JQ4mI4+Q7zJ+rxceyouz5eJ3Y/9x31j0yK+U54Eg6uQa1Z75dykYWKCda89GtEAE+WNGtQIPD6S
	hn2Ra
X-Gm-Gg: ATEYQzxOksytPQOQgLE8xrjbczJVtVTsma3vKwVsjLwyYwW8HB2DudePfYYab323jsN
	Sa4bRJgUjByLL8jPWuO9yg+wF/D5XoT3gKE7JC6LrGdLq2TNMtZhIEa+EHuoU1BGdiezmck1u/A
	dd0gWIY9APZ46ggDgIjIw/IY0mLfpOzoTJyjY5VHDRa7+0whJDUnnBCZM6J2jDdav89ZbiZ9UEP
	xSXV+nDWyll1CkDtFs5GFMyKEmKU9RT0MMd76BqiFk/OoNq9KgEwL7nZnj3olAF84tWPnNXDWqZ
	pkJZhPFIbPpqygtIu0P18sQyQJlB/3pzYgF0CqN8PUsxQQG+ID64Maf8hpAZrl+CyDx2PEG7n+q
	HKBRSpXjFykrlLqQloKqnLp0lLRU4MHAwd6WhpocT4qbhcrDHytBwSHK50W53n6KsbJ1c48RqDw
	ArCASGzoiESbJLbQw5qpXODzbZ1w==
X-Received: by 2002:a5d:5f93:0:b0:439:a95b:3c47 with SMTP id ffacd0b85a97d-439eff1be54mr5304701f8f.10.1773139403378;
        Tue, 10 Mar 2026 03:43:23 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm38866624f8f.30.2026.03.10.03.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:43:22 -0700 (PDT)
Date: Tue, 10 Mar 2026 11:43:21 +0100
From: Petr Mladek <pmladek@suse.com>
To: Shashank Balaji <shashankbalaji02@gmail.com>
Cc: Tim Bird <tim.bird@sony.com>, rostedt@goodmis.org,
	john.ogness@linuxtronix.de, senozhatsky@chromium.org,
	francesco@valla.it, geert@linux-m68k.org,
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Message-ID: <aa_1yWC0KX95gbA2@pathway.suse.cz>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <aa8C_1eUDoSgMGIv@fedora>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa8C_1eUDoSgMGIv@fedora>

On Tue 2026-03-10 02:27:27, Shashank Balaji wrote:
> Hi Tim,
> 
> Tested-by: Shashank Balaji <shashankbalaji02@gmail.com>
> 
> ...on top of rc3 on an AMD Ryzen 7 4800H laptop. This patch conflicts
> with these commits with trivial fixes:
> 
> 032a730268a3 init/main.c: wrap long kernel cmdline when printing to logs
> 60325c27d3cfq printk: Add execution context (task name/CPU) to printk_info
> 499f86de4f8c init/main: read bootconfig header with get_unaligned_le32()

Good to know.

> On Tue, Feb 10, 2026 at 04:47:41PM -0700, Tim Bird wrote:
> > During early boot, printk timestamps are reported as zero before
> 	<snip>
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 1d765ad242b8..5afd31c3345c 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -2242,6 +2254,8 @@ int vprintk_store(int facility, int level,
> >  	 * timestamp with respect to the caller.
> >  	 */
> >  	ts_nsec = local_clock();
> > +	if (!ts_nsec)
> > +		ts_nsec = early_cycles();
> 
> ts_nsec goes on to be stored in a struct printk_info's ts_nsec which is
> documented to be "timestamp in nanoseconds":
> 
> 	/*
> 	 * Meta information about each stored message.
> 	 *
> 	 * All fields are set by the printk code except for @seq, which is
> 	 * set by the ringbuffer code.
> 	 */
> 	struct printk_info {
> 		u64	seq;		/* sequence number */
> 		u64	ts_nsec;	/* timestamp in nanoseconds */
> 		u16	text_len;	/* length of text message */
> 		u8	facility;	/* syslog facility */
> 		u8	flags:5;	/* internal record flags */
> 		u8	level:3;	/* syslog level */
> 		u32	caller_id;	/* thread id or processor id */
> 	#ifdef CONFIG_PRINTK_EXECUTION_CTX
> 		u32	caller_id2;	/* caller_id complement */
> 		/* name of the task that generated the message */
> 		char	comm[TASK_COMM_LEN];
> 	#endif
> 
> 		struct dev_printk_info	dev_info;
> 	};
> 
> Since with this patch, ts_nsec can either be a timestamp in ns or a
> cycle count, the comment should be updated.

Yup, great catch!

> Ideally, I'd like the member
> name to be changed as well to reflect the new semantic. I'm thinking 
> ts_raw or ts_ns_or_cyc... naming is hard :)

Hmm, we could not change it easily because it would break user space
tools for reading kernel crash dump.

Alternative solution would be usign an union.

	union {
		u64	ts_nsec;
		u64	ts_cycles;
	};

Best Regards,
Petr
