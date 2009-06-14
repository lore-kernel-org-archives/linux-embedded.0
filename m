From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 04/14] Pramfs: Mounting as root filesystem
Date: Sun, 14 Jun 2009 18:05:04 +0200
Message-ID: <4A351FB0.3060008@gmail.com>
References: <4A33A7D7.3040008@gmail.com> <200906140104.43463.arnd@arndb.de>	 <4A34B2FD.20701@gmail.com> <1244970445.3468.2732.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=iHAEGEZ9EUEsS7w2YaWehGV4X/y2JAQ7vaNrlpjclVw=;
        b=AA8LAiw23zTD3heliNt23uONIwFhtKgY0Uhfb2xBPGd3RNMzEgfVtDo/1DyZEcBZ7F
         kKLJbcE8/C2q0rU5Bq+dC3gUsoItCrsF5pqFNcnzdELB0B+KhgSMak31JRy7hWlqkQO1
         RP7Sd+/KPuXJ2dglHP5twoNrlwp9xCbICqWEc=
In-Reply-To: <1244970445.3468.2732.camel@macbook.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

David Woodhouse wrote:
> On Sun, 2009-06-14 at 10:21 +0200, Marco wrote:
>> Mmm...MEM_MAJOR and RAMDISK_MAJOR have the same value and pramfs works
>> in memory. We could simply use /dev/null (there was an error in the
>> submitted kconfig description, my intention was to use /dev/mem). In
>> that case I can use UNNAMED_MAJOR. PRAMFS root option is not enabled
>> if it's already enabled the NFS one. What do you think?
> 
> Why use a major number at all? See how we handle mtd and ubi devices in
> prepare_namespace() -- can't you do something similar?
> 

I can look at it.

Marco
