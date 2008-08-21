From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 07:42:39 -0700
Message-ID: <6934efce0808210742v14a093e8vde31f9eea0555f99@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com> <20080821083916.GF5706@disturbed>
	 <6934efce0808210719s6458dc77w2c0755a4bf90bf8a@mail.gmail.com>
	 <c384c5ea0808210731k17ccc836u60c4803c3abfea31@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759959AbYHUOmw@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=fBwJLueREw5hNQm0Q8gEI8D2szh0m7cC/2eV5z9cGTk=;
        b=KKgA7iBYvS8ngREJM1Ur2Rk+qibyEx7YBUNLpEIPyWmd6E5ynzk0WvNNOfYU6Yii/5
         UT+MlfPFnII8gWB0yKXNKkm6dN4cjfxnYBVVjCPt91vTNunEcPRQyTp4CUE65yWla9L0
         qK0TQkqkwU5B0A5bvmuRHralns3ZKLyzRTy+M=
In-Reply-To: <c384c5ea0808210731k17ccc836u60c4803c3abfea31@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> What if the use-case did not cover all cases of XIP use?
>
> If a compressed page is attempted to be executed, will the filesystem
> fall back to decompression to RAM and execution from RAM, or will this
> result in a faulty system?

No this will not result in a faulty system.  It is perfectly
acceptable to have all pages in a file XIP, no pages in a fill XIP,
and anywhere in between.

> The design choices look real good. Congrats on the achievement.

thanks!
