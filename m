Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375763AB281
	for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 19:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453868; cv=pass; b=QNV8CfHN0b1bItoNFA5pJtP4vGidONrKhipU3GzGEMH+U5CL038nNpE9DvF5ZhBpKu5uMu3SXIYuL4gCpIwT0qL9KJcJdDOuM2b8OhdfhXGMWAPqjFDh6SlPbJSVIx6rY+ix6fgWFkZukQgOwtyBBZl/R9FAWSGB5X8lQAN6Y4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453868; c=relaxed/simple;
	bh=mA08u9eug4aEkpOIhS3vC1u39+0VMLNAsuPUuW0JVJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/K4neW2f1/dkQCwsjRVMXyj69qpcmb4tOxZ5wUt6V4e7zmFBqNqWvQU0XeoMa2zvKldiO29wYikCiJTeDJboEb3MGTCr2LzAVpTLdCDC/X1vd8pABO1y3LU8XG/hMr6P5tqWAJvHXT9f3nMNAXmBwUXzeogK5hg//flNb7gZdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ufdv5gC2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FplaBgem; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ufdv5gC2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FplaBgem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776453866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pXZbUE92/DA0bP5Ktd9C+lrve2roa/EJ5OrYK+ccK0A=;
	b=Ufdv5gC2p4VAjumxTia9ewpm2VmeARiMzDDeQyl5ZkN49WOV+eIe8NnB7Dcrs2U+baCIbo
	Q5OJHjwfrJADcCfQSOmUMdUomBqTvMZY+Oxj9kut25YFQNBdpuMPJ9B/XI12kk79rwxlTa
	JemdYOHbJYtjbffZ9CuruZle4i5NnRY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-3n79rvL8MgahY0y8EEX75g-1; Fri, 17 Apr 2026 15:24:25 -0400
X-MC-Unique: 3n79rvL8MgahY0y8EEX75g-1
X-Mimecast-MFC-AGG-ID: 3n79rvL8MgahY0y8EEX75g_1776453864
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b8fbe7a6f41so85695366b.0
        for <linux-embedded@vger.kernel.org>; Fri, 17 Apr 2026 12:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776453864; cv=none;
        d=google.com; s=arc-20240605;
        b=OFQicsUAZ9No/BqQKdVvFDxOCMutSP/x0aGfWxiTwcMMRKeTCd+cPooQfOHdWG8bVz
         qiAZXbe1QoMEz7jgXps1a3XSsbwJOZWH8Nxf6srWPzrjsNZsOcx7BssSSzPrCRHTobNv
         ANkPteZkgpIj9quP+vW6wfojbDHUndWfbssh8AL1GM07IxV+j69UMJg3HfsgJ6H9BNwV
         5EIecKc5IPGv8b4q9g9qFQTXovfGe9xJVBdTxT0IFM8reXgX+sIjoKtRlTodDYMvFC/J
         HV7hHkFHDfsyKap5ZFIvZXcsamJ3n7n9MYeF/jk25Z/X8myYOwjf56t2vTZjgvTucxIK
         P5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXZbUE92/DA0bP5Ktd9C+lrve2roa/EJ5OrYK+ccK0A=;
        fh=/e7tqn9qVhBTwXepFscqdtyduxBcyj4JNqYwD5jWZGg=;
        b=DvZ2cfUYXMmlLkLr9ZrQEyesN5WVN+octPzhx/bBpn2Swq33IzZTgZ9aS78VZitukI
         8yVw9Ohv47CyhrJle+Xh7KJcUKL0UvgMaxeyKDcwPVBhCWB5nMh66hV+g1ANWIx0/6p7
         ioRqDZMNto/rG/DePy58NadAEhddCatwtmR/6eX5wy308go5ZGUPY4210MAteJ4Ad6DW
         mbNypLtX6U7U6LE4UGdIru95RjfeeZsUzFg/dKN7vus/Il/wq2KpPZbSYrU9Xds//lad
         pYiXNYHPQtkMOTNFoqhZdvyhz6kAwFlD+gVKhqsSyudGdwGlydJ0Bbpdx3djxwWvWN0G
         wqmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776453864; x=1777058664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXZbUE92/DA0bP5Ktd9C+lrve2roa/EJ5OrYK+ccK0A=;
        b=FplaBgemFy6Vqf6YvCN3vhFxv4InW1wOUjFn0IEqKfvi5ApV7LANABmSHWQChL220c
         xIH1Ut4uIxW70KrMK8JvSRSlQRgXFQjlORz3jcQrmU6RNIgbWEeGJWGog/D/21Q7aB/e
         AA9QcUt88ElSF529l7VD5g/yOw4GHZ2nyNU0xxLRjoCeotFYkAVwY2yoTqK+11hNyzDc
         DwVr7b9EBtZXJSWX/paOH8vZjZwqw+ggB+8LMu0tyZqbIYyV2Q3jXXGTHdtLg8v4Bfvf
         crqS/jQbTSmcSxDIgEWlyc3E0WVUanePYUxxJBld7LIhxHuPjYsOj29g8X9y+2moUxV9
         eD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776453864; x=1777058664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXZbUE92/DA0bP5Ktd9C+lrve2roa/EJ5OrYK+ccK0A=;
        b=pNpsezDp45PHiC+r5YPlC5D/YfvEGQaGmgegRq/aD6GAuDXpTCJuYVw2NOSf0Ft3i/
         Q9W3LSdlwoBFql7vk+4Aavpy9davVqLVp7uqAFXcCgplUwHkxQK8uqGDWRS+104PtZJL
         AzNb0hSE+ktjLAXp/hb0hkQ+MPkgG51WQvc9YDW/D0V18LrJz0ZnQ7xYaWYPFPyuCAmD
         7FX9mjtOOnvy7UhVVEHpS0+zJmGY95aLw/LAWk0jr+be6DkWCamF8p7uG9Fzi2NII9Y1
         uGe5/bmt/qdAA/ThiYukCtcXN6vzkPhZWfd8UUUJcSOpThuFXyOV12BPhVmnmD4TIUv0
         KfWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NDCF/qhXp+Cnu2p4oSGGflFm/MfM14gu9UPdQ6U/IPyGQYwQQvdG6LoIZ4aLD6eAW9lwPV/5KIUpovDeRkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ2YmRbXfoyIjqBcolehRyWSxcJIrAEGCSKY9byYDkbBWtCx7a
	C2kg/S3Bku/DYO5gyFwMIBm6UBtRT0KsYUwUcpAlvNTWdOK6uk7E7BCfXyeAzBML02MutkB+OAK
	TQZGH8oxUYcW9HHC/6zkDbjCf2GgLLhTeYbnvKjGj6eo7zoz+KAPFgzQEavYiDlinZS4esJ0gCH
	bnOvzJhKrCjN8QQK+/Bp+8WnNJYftfqupr8fdmOr+rcC8=
X-Gm-Gg: AeBDieuTUQ+nWVMgllnXnvmPpjkw6Z66PHbMmBRZUrwVAGEfHQOyuCDES96b82PnfXJ
	oSITOA0Uf82BE4tPSoebhncwLcCfdQuDb/DzNJzxy6W4C9OytPByowEQU7F3HGoKvS4oaUCyR9r
	lLI1STOusAFViz+8EJbOgWIeSZ5znW9a6Xk7niesDJ7ZMy1Qr+qCGxsUhlcSxh7dtPe92QimKkw
	gHcSy2MPhcyuBUP
X-Received: by 2002:a17:906:4796:b0:b9d:9972:4a8d with SMTP id a640c23a62f3a-ba4163a46d4mr241509666b.0.1776453863490;
        Fri, 17 Apr 2026 12:24:23 -0700 (PDT)
X-Received: by 2002:a17:906:4796:b0:b9d:9972:4a8d with SMTP id
 a640c23a62f3a-ba4163a46d4mr241508366b.0.1776453863006; Fri, 17 Apr 2026
 12:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410203741.997410-1-tim.bird@sony.com> <20260410203741.997410-2-tim.bird@sony.com>
 <87qzohdv6i.ffs@tglx> <aeINb8-a83R3QDXd@pathway.suse.cz>
In-Reply-To: <aeINb8-a83R3QDXd@pathway.suse.cz>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 17 Apr 2026 15:24:11 -0400
X-Gm-Features: AQROBzB3nHYVcSILOcA4XYovnz4h4UJ2bOy8QBqOm-Ix5oW1LQGToA1nHBGRmMY
Message-ID: <CABx5tqLZvNFvkeUXBzJkQS00Cb_WVKgxGwEPhA5sTLwkWja9vw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
To: Petr Mladek <pmladek@suse.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Tim Bird <tim.bird@sony.com>, rostedt@goodmis.org, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, francesco@valla.it, 
	geert@linux-m68k.org, shashankbalaji02@gmail.com, 
	linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Fri, Apr 17, 2026 at 6:37=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>    2. The early timestamps provided by the bogo cycles
>       are not synchronized with timestamps from
>       the proper time keeping.
>
>       Would it help to print a disclaimer, similar to,
>       for example, trace_printk() first use?
>       Something like:
>
> [    0.002912] **********************************************************
> [    0.002917] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
> [    0.002921] **
> [    0.002935] ** Using BOGO early timestamps
> [    0.002939] **
> [    0.002943] ** They are not properly calibrated and might use a source
> [    0.002949] ** with an unstable frequency.
> [    0.002953] **
> [    0.002957] ** They are not comparable with timestamps after
> [    0.002961] ** the timekeeping is initialized.
> [    0.002966] **
> [    0.002968] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
> [    0.002971] *******************************************************
> [    0.002975] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
> [    0.002998] Linux version 7.0.0-rc6-v8+ (tbird@timdesk) (aarch64-linux=
-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ub=
untu) 2.42) #20 SMP PREEMPT Fri Apr 10 11:57:48 MDT 2026
> [    0.003002] KASLR enabled
> [    0.003338] random: crng init done
> [    0.003866] Machine model: Raspberry Pi 4 Model B Rev 1.5
> [    0.004495] efi: UEFI not found.
> ...
> [    0.183552] Root IRQ handler: gic_handle_irq
> [    0.183561] GIC: Using split EOI/Deactivate mode
> [    0.183699] rcu: srcu_init: Setting srcu_struct sizes based on content=
ion.
> [    0.183958] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_=
cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
> [    0.183952] arch_timer: cp15 timer running at 54.00MHz (phys).
> [    0.183957] **********************************************************
> [    0.183962] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
> [    0.183967] **
> [    0.183971] ** End of BOGO early timestamps
> [    0.183976] **
> [    0.183982] ****   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE
> [    0.183989] **********************************************************
> [    0.000000] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps ever=
y 4398046511102ns
> [    0.000157] Console: colour dummy device 80x25
> [    0.000165] printk: legacy console [tty1] enabled
>
> My view is that it would be nice to make the life easier
> for the 50 developers who do very useful work.
>
> But we do not need to create and maintain any complicated
> code for this. If the bogo cycles are good enough.
> If they already have some users and have to stay anyway.
> If we make it clear that the early timestamps are bogus...
>
> IMHO, the main risk is that it won't be used just by the 50 developers
> but it will get misused and open some can of worms. I think that
> the risk might be acceptable but...
>
> What do you think, please?
> Am I too naive in this case?

Thanks for the nice summary of the discussions so far. From the
standpoint of the boot speed work that I have done so far, the bogo
cycles would be good enough in my opinion. It would have identified
that I issue that I described earlier in this thread.

Regarding the message, I would put a firmer message similar to what's
in drivers/iommu/iommu-debugfs.c that also has this message:

    If you see this message and you are not debugging the kernel,
report this immediately to your vendor!

That way this is unlikely to be enabled in distro kernels.

Brian

