Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD9928D8F1
	for <linux-embedded@vger.kernel.org>; Mon,  9 Mar 2026 17:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773077265; cv=none; b=VLEXkp6ZnMHTEMZWOC+2jcP9O/p/CZqHTUt098+HRpuDUTYkwTiqS+Nor/ZVHxq7kcu8hMdbn5wSXYLmILPhgiph9ZP7sq6PWo0WbxBoLtIM7GfZR31EOolwANr7q9Lf08GOk0ZNBRRj5aUvmpFpMrUc0Z8WoBI4Adj/xHtLt/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773077265; c=relaxed/simple;
	bh=D6vOzrUfUxGRl39AhuAsmPqUbwOzOY+xNTdDwRNq3qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3K3l2Ae5JwkQ309Qvf5Ggomfb3XVqvxua9yJ9t825bfGcdWBuZNZF7iTDRVR9G+mpMG3DU1X9EflaTmquguOL+NieOl9jub5RJk31Kkf24faJ6WnZC1v622RyKvm0JKKyLkTpxUNasanFa+cXp4NraQHf+J06u9ldMwKc5BQ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcCtO3nl; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcCtO3nl"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae46fc8ec1so59041525ad.3
        for <linux-embedded@vger.kernel.org>; Mon, 09 Mar 2026 10:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773077262; x=1773682062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nezdDOkBXnIOMjD4Tthu6LYbtu4WMDL/OCtUkkPr37k=;
        b=dcCtO3nlRHMpLaT54eLvs6djqbvRhDPyKDtXKrD8ebVxW5Mp7ZSUNBqUlVI4OzPgkN
         d8akPKEyqk8MuGsmfEXAu7D8bVXoyTJNLriRVXTK5hGSabSZfQgjfuoFApQT8R5Mt3lX
         qj6G+1GHMBNexhnq6Qh+tWGTqa/0aNbN9Ac/oWLV+UEVGI9LxiHpwNXPFW750t+peLj9
         m0a5pE0lzEzr/zrx3BUZrEmAWDPJWHjYn2Q/F5n33WmPI/M7MUYJMmIW09H7efug+RGe
         Fvypg7FtuhoCiiviy0PuKyvbEbf9ek54bqyysWpv/EUOOcEd+lmdDVD5WgT0zmuAK8DX
         JkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773077262; x=1773682062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nezdDOkBXnIOMjD4Tthu6LYbtu4WMDL/OCtUkkPr37k=;
        b=RnSVF0Z32JKqZXR1Mcy+lSZQoJ/wQfHexWDNsz91IMqRwbp6PTaPIUTv4sqQ8oM39k
         fTkoW5fOMELAGjFuZR2sTCGgNwl3bWXD0T1xH4zXsbmrNUawoh98LK2vN8E3B9E5MB/L
         GpD6gCf+7iVViCoyl4MNYWrZDM88OQTdzt58iw1rlSiQ+ijZe7UBjP3PD44dO0BosHED
         C+QvJ4aSBFx7eCxoC49GS2PVFjx0A3nSZdUFzwFQkyiw33UE4AeUMYk1YkawWs/v0S7x
         eOyyHvCUgrKTOnXPEiZgJpE8sOpa01aJp4FAzCVG57UcmQ2pSCWo4elUqQOw6XInOtTY
         0+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiJBP/GQlkwjF4E2c9/YfHtqR611EhkEFUR1vlovACb4Hb7Ym44lrvcAGA9rG7a1P7KYD6fubBY+frkYVpJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpO3D1dHYsxaV9rV+OXV8u5xoz2L8LoYcT+cAmKELqPgk8MmYS
	TlXc9FpTb/TYO4Oc9Fb9IX64INuze4sEYZcuXznvTjcyNmj/EmZ4FA6G
X-Gm-Gg: ATEYQzywZ7TW1jkVY6Td76sWTvDbNtIUihp+wBoX0qXyUYIhR55BIXn+C1FMnx5spov
	JLW+MfagJ/DbOcQb2do/teLPVr/dwYPJE8J65M8GyozQRou3UL97Bzn5oUTOBcT2TyaVYknyVHO
	PRWPCeulRcnXpgWj0K9xmr5OgpbLfvqgwBxM88oZTRrw+kPdwZs8N9vs2CrDB1dNh8IhASJO5Tn
	uzkODUrUxBY16X+l5TtEX+iWWncf0/Ui5WiUD6daTFTTcVbXbTCin92nwhkMujj86ZXcIugJDfE
	xpuXzPw7b3Ih3LMvp6Hd4+Xs0e6rNiL1GTgq83XqkFpT4KPBlI3Rux7mMtKX2U6p7IL+LlSGsHN
	hv8jd3PoQaL4BCiMGTH+l+Afnx/QGv5YmxIdKU6xfF/lCw7LrTDRG9jlubz9rJGa0r/6hC7sIvW
	RAHkfxiNmNfaXobvnudH1pt0DlYMCmR/I9STM1g269EhD6ACYZFH6uC4u+MrALLruLqgrm3ekMO
	iQxiw==
X-Received: by 2002:a17:903:2b0b:b0:2ae:5dba:c8c1 with SMTP id d9443c01a7336-2ae823677d9mr113542955ad.7.1773077262091;
        Mon, 09 Mar 2026 10:27:42 -0700 (PDT)
Received: from fedora (p4582043-ipxg23101hodogaya.kanagawa.ocn.ne.jp. [153.205.170.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8b9e4sm116529645ad.64.2026.03.09.10.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 10:27:41 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:27:27 +0900
From: Shashank Balaji <shashankbalaji02@gmail.com>
To: Tim Bird <tim.bird@sony.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linuxtronix.de,
	senozhatsky@chromium.org, francesco@valla.it, geert@linux-m68k.org,
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Message-ID: <aa8C_1eUDoSgMGIv@fedora>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210234741.3262320-1-tim.bird@sony.com>

Hi Tim,

Tested-by: Shashank Balaji <shashankbalaji02@gmail.com>

...on top of rc3 on an AMD Ryzen 7 4800H laptop. This patch conflicts
with these commits with trivial fixes:

032a730268a3 init/main.c: wrap long kernel cmdline when printing to logs
60325c27d3cf printk: Add execution context (task name/CPU) to printk_info
499f86de4f8c init/main: read bootconfig header with get_unaligned_le32()

Comment below.

On Tue, Feb 10, 2026 at 04:47:41PM -0700, Tim Bird wrote:
> During early boot, printk timestamps are reported as zero before
	<snip>
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 1d765ad242b8..5afd31c3345c 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -46,6 +46,7 @@
>  #include <linux/ctype.h>
>  #include <linux/uio.h>
>  #include <linux/sched/clock.h>
> +#include <linux/early_times.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/panic.h>
> @@ -75,6 +76,13 @@ EXPORT_SYMBOL(ignore_console_lock_warning);
>  
>  EXPORT_TRACEPOINT_SYMBOL_GPL(console);
>  
> +#ifdef CONFIG_EARLY_PRINTK_TIMES
> +cycles_t start_cycles;
> +u64 start_ns;
> +u32 early_mult, early_shift;
> +u64 early_ts_offset;
> +#endif
> +
>  /*
>   * Low level drivers may need that to know if they can schedule in
>   * their unblank() callback or not. So let's export it.
> @@ -639,7 +647,7 @@ static void append_char(char **pp, char *e, char c)
>  static ssize_t info_print_ext_header(char *buf, size_t size,
>  				     struct printk_info *info)
>  {
> -	u64 ts_usec = info->ts_nsec;
> +	u64 ts_usec = adjust_early_ts(info->ts_nsec);
>  	char caller[20];
>  #ifdef CONFIG_PRINTK_CALLER
>  	u32 id = info->caller_id;
> @@ -1352,7 +1360,11 @@ static size_t print_syslog(unsigned int level, char *buf)
>  
>  static size_t print_time(u64 ts, char *buf)
>  {
> -	unsigned long rem_nsec = do_div(ts, 1000000000);
> +	unsigned long rem_nsec;
> +
> +	ts = adjust_early_ts(ts);
> +
> +	rem_nsec = do_div(ts, 1000000000);
>  
>  	return sprintf(buf, "[%5lu.%06lu]",
>  		       (unsigned long)ts, rem_nsec / 1000);
> @@ -2242,6 +2254,8 @@ int vprintk_store(int facility, int level,
>  	 * timestamp with respect to the caller.
>  	 */
>  	ts_nsec = local_clock();
> +	if (!ts_nsec)
> +		ts_nsec = early_cycles();

ts_nsec goes on to be stored in a struct printk_info's ts_nsec which is
documented to be "timestamp in nanoseconds":

	/*
	 * Meta information about each stored message.
	 *
	 * All fields are set by the printk code except for @seq, which is
	 * set by the ringbuffer code.
	 */
	struct printk_info {
		u64	seq;		/* sequence number */
		u64	ts_nsec;	/* timestamp in nanoseconds */
		u16	text_len;	/* length of text message */
		u8	facility;	/* syslog facility */
		u8	flags:5;	/* internal record flags */
		u8	level:3;	/* syslog level */
		u32	caller_id;	/* thread id or processor id */
	#ifdef CONFIG_PRINTK_EXECUTION_CTX
		u32	caller_id2;	/* caller_id complement */
		/* name of the task that generated the message */
		char	comm[TASK_COMM_LEN];
	#endif

		struct dev_printk_info	dev_info;
	};

Since with this patch, ts_nsec can either be a timestamp in ns or a
cycle count, the comment should be updated. Ideally, I'd like the member
name to be changed as well to reflect the new semantic. I'm thinking 
ts_raw or ts_ns_or_cyc... naming is hard :)

Thanks,
Shashank
