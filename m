From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Thu, 12 Nov 2009 19:00:17 +0100
Message-ID: <4AFC4D31.2000101@gmail.com>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754107AbZKLSGH@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=2CHrgDH4HW6FM980PqSBEx2//nzOzApKIoS8pF9B0YY=;
        b=o5YTAuzYeyUo8lkgr5VHZJdZ5ssRkaI/Mpb8kKkTUJ8wDOuyB7AB+4g8TFOlaB+HJX
         /RWivKAqJoMusk9+8Qv47lHEiSYFiM0EP7Kaco0R05q+bzJhc55V1U1pfbnq/4kqzbsK
         8YOtm3U+2f/hmBttciwUthJPW+80qrGZY9zQ0=
In-Reply-To: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

Sincerely, I don't understand why we should involve the kernel to gather
this kind of information when we can use other (user-space) tools, only
to have "all" in a single report maybe? I think it's a bit weak reason
to include this additional behavior in the kernel.

David VomLehn ha scritto:
> Allows annotation of panics to include platform information. It's no big
> deal to collect information, but way helpful when you are collecting
> failure reports from a eventual base of millions of systems deployed in
> other people's homes.
> 

Marco
