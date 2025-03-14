Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F001FF7B8
	for <linux-embedded@vger.kernel.org>; Fri, 14 Mar 2025 16:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741968206; cv=none; b=sEB6tXZ+wwRQOJ3U8H6leFbY0tGCp0TyyYDV3jvozFTDgACdaK5Gl+yUKso4O2jIi2HZ68qiaMOow/5tkgoTqIdAccTlLv4kH3VCAHTo0I3vH2/1BOPFS2MJHsx9Jsl1aVBQ00E5KhQr7/8hZ8VPGAmPLRIo5G00Rnu/RGSREhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741968206; c=relaxed/simple;
	bh=shA6m+iR4GKuYrqQkR3koW0Wlamlmd+SzwdgR7hIgZw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=k9cOTJOq1QCkhxEtQgnFs+PXYeycKOv0dVetBhKGgI3oEiTLmRYw54zxFyYG5MRZGV14C6bXxUkVrRSJY9hwP2HWwfIlQGhhRMGj/B/hp50/w18o6d7o09JBM+rxKMqeMbx7XWVk12fGVIr71lHqtEgcKL6XB0U+LQFQqgpjWZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=la3wUkFE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="la3wUkFE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22401f4d35aso45756565ad.2
        for <linux-embedded@vger.kernel.org>; Fri, 14 Mar 2025 09:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1741968203; x=1742573003; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=shA6m+iR4GKuYrqQkR3koW0Wlamlmd+SzwdgR7hIgZw=;
        b=la3wUkFED3VWCbqz2ENtHfAuwmMWIxlnUj3jvC3UQyN86L+9A2m4U+/jLUQSLOL2yM
         d9tkOakPrXWL87EJUFS1nJlfnG98HyW+P8ujL1nBJnSZJMMhFsXxzLeESUIIGFXkd2tY
         h46O8k3z0ZVRjOgQ9RgU+TjOed5+7eIemoxAIirEB+qeo48jFvYxttsekja0MzmtqKF0
         ikngntJiRUWtjtMxebqgWlDpODcH/zA6njZ7UHbKsRvfLFZMr3H58YOVa6Hmej/6AEqq
         aB/HOAi8fnHEiBl+WO/bKtjx/NUGF01fduAVoBRbVcxBo8G3BHJWIMNF73sv/GuIWS4o
         mzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741968203; x=1742573003;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shA6m+iR4GKuYrqQkR3koW0Wlamlmd+SzwdgR7hIgZw=;
        b=NO8SXThwc0XISsnUI73gM9Qo9EbV0Ffpuf7+hLEqJqvT2btsmt2SxJLe/j4WSsyq/0
         AEUFaF6+ggTieMu3VFISQotWFxq1rQN47cK4Ik4IsLdZJtWCDvU7VB7uxw9rtrDFGalf
         CrK04eBbUAt3/qcDk6vUffpix6sMP3zYIVa6E/6q6ESedR4YvwB9yEq8a+EbdkuPGyV7
         QpbQirkZV9X2V5eHw+GRARJ7gelzkLYtlaOyCz/3gO269QdZvhXacvVpyakGNCS0I8DM
         4l8+2jIopi4ZBIFRwYJ2qGGP5FLqv+sLTLaqc2rKsIo6vH02NsXLhmWpKg6FqU3TVfq8
         Ps8g==
X-Gm-Message-State: AOJu0YzvvYQ9DCd2qapwIKffh0HwzzZY59Ar7KEE4VhEY82Op9DqMC3H
	Ivoes3leby0jbnxR7LR6Tdz6ojHOsIYhw4ZlHfitMPSlBBwJrQt1rjiMMG9VZVtTBnyas1xX8sq
	kq/cewWRF1p3fIe00jh4zXhvrqJpOKl8pMP3vLRWgzprjvp+BKCN5Eg==
X-Gm-Gg: ASbGncsqNiCSoWpQtdayLXjFF6enjrRlkl54iKTgNwbDhS0Ixrw4ng9ElZ3jdPblJ3J
	G4TVv2NgitnEYpxn4uFRlIIBnJsCIfnLF4AhCn/eXzXMEL+VFmUe0t1POHhdv/MzpiKxdlv6g4F
	5SAxRbUhzrKXKlp9xQaO6H/SVGjVjMA9quT+go
X-Google-Smtp-Source: AGHT+IHVlxFDjbCcSV1fWgo0RpXwp9pengOI8/ImsB1iB95Utp9JslidKmUMru6qsL/FCREudKk1aWLlnQUZ6PbqQBA=
X-Received: by 2002:a17:903:22c1:b0:224:2524:3047 with SMTP id
 d9443c01a7336-225e0a6b2damr44347165ad.26.1741968203053; Fri, 14 Mar 2025
 09:03:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Michael Cobb <mcobb@thegoodpenguin.co.uk>
Date: Fri, 14 Mar 2025 16:03:12 +0000
X-Gm-Features: AQ5f1JqTTV-V7bkZBUX12rA0ZXPHkoTp-sfpSqKI94SMmwOfDfErdq4AMdv4aVs
Message-ID: <CAC251sXmJyNgkBCGGPqo=M=YhWsRm9+iiN44Op5B0XJJ135yUg@mail.gmail.com>
Subject: Effects of new nbcon console interface and boot times
To: linux-embedded@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

With the recent addition of the new "nbcon" interface to the Linux
console, there is now support for threaded console writes, handled by
a dedicated kthread. While the motivation behind the nbcon interface
was to support bringing real-time preemption into the mainline kernel,
I have been interested in investigating what impact nbcon has on boot
times. I thought this may be of interest to some of you. Some key
points that I have found:

- `register_console()` registers a newly initialised serial port as a
console for printk output. At which point, the printk buffer is
flushed out to the serial device. Even with an nbcon console, this
initiall flushing is handled by `console_flush_all()` in a synchronous
manner, and this is the cause of delays during system boot up. I have
also confirmed this as register_console can take > 10 seconds to
execute at lower baudrates when there are many printk messages to
flush.

- The nbcon printer kthread does not take over the task of writing to
consoles until after `register_console()` has set up the console.

- Depending on how late in the boot process the serial port drivers
are actually initialised, there can be a lot of messages already in
the printk buffer that need to be flushed. I found that with a
Raspberry Pi 3B+, for example, due to dependencies on clocks and other
system hardware, the serial drivers were actually initialised as part
of `deferred_initcall` very late on in the boot process.

I believe it should be possible for nbcon-enabled consoles to have the
initial printk flushing be handled by the nbcon kthread, rather than
by `console_flush_all()` as is currently the case. Subsequent calls to
printk after `register_console()` already appear to execute faster due
to the actual work being offloaded to the kthread. This would, in
theory, significantly reduce boot times when using a serial console,
without having to resort to adjusting the loglevel and losing the
ability to debug boot issues.

If you would like to read more about this investigation, I have
written a blog post that you can find here:
https://www.thegoodpenguin.co.uk/blog/the-impact-of-non-blocking-consoles-nbcon-on-linux-boot-time/

I would be very interested to know if this is something that anyone
has picked up and is looking into?

Looking forward to hearing your thoughts on this.

Thanks,
Michael
