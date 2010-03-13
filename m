From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH v2] char drivers: Ram oops/panic logger
Date: Sat, 13 Mar 2010 09:49:53 +0100
Message-ID: <4B9B51B1.8010904@gmail.com>
References: <4B968834.3040609@gmail.com> <21eaeb5a1003091808s2d7638cxd524952a7d84b378@mail.gmail.com> <2ea1731b1003100002w104633ffy1ae46ef3d245e5b5@mail.gmail.com> <21eaeb5a1003100120x6cd3f69ak598954af3c9fe955@mail.gmail.com> <2ea1731b1003100415i46dd8fcem85b85f49fb1a479@mail.gmail.com> <20100312144854.cb94d9b4.akpm@linux-foundation.org> <20100312233144.GG6491@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=mfiexVlnutLiAon9BCjyzGoCPvk0oJdAAqOyupjxSeE=;
        b=Ci9zqrBQNmu94YeeSMOTpioL1QgUpA8IU0uP73LOnaYf4ioqashb2Q8XHR3xWn6W/R
         yqDqZo59cQLJlC4JrERucVw5O2aKvoURlS7fOwtAkTlI3AheVkbLc2TksTl7fWxFvKBa
         6s2Hcgzbjs28RNvQvz7gP1Xz4bsMsLS2OSrj0=
In-Reply-To: <20100312233144.GG6491@shareable.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yuasa Yoichi <yuasa@linux-mips.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Il 13/03/2010 00:31, Jamie Lokier ha scritto:
> That'd be fine if the kernel link scripts choose the address, as long
> as it's consistent between different compiles and similar
> configurations.  That'd be a bit simpler than the admin having to know
> the memory map well enough to choose an address.
> 
> -- Jamie
> 

I agree, but the bootloader should be aware of it. I mean, usually
bootloaders at boot, reset the RAM, so you have to tell to the
bootloader that you are using a piece of RAM as persistent RAM, for
example U-Boot has got a specific option CONFIG_PRAM. I don't know if
all the process can be completely transparent to the admin in all
situations.

Marco
