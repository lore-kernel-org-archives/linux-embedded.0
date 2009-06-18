From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Thu, 18 Jun 2009 08:35:35 +0200
Message-ID: <2ea1731b0906172335p1b6f2085j294df002ab2b71e0@mail.gmail.com>
References: <4A33A7A2.1050608@gmail.com> <4A3936A0.9050709@nortel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ljiSmP1Gn5PiIEo1V4hL0hUyiGmz8gHoBdbAw5cTzhM=;
        b=Ws48yDa2craE2XW83uMJsO7CBZ4CzRFrERXWyWd5ad1nQ6+0qVL8/j/HQQEPDypNx4
         D4jUEYH+Inv2hgfHyIfGdTAu1JlQm7vN+Iwu/VkylncSMu+Oup0rO9fqrF+VfH+Ke/cP
         LYip6WU52/r2c+GcmsZIJIiEbURBF58mOsH8g=
In-Reply-To: <4A3936A0.9050709@nortel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Friesen <cfriesen@nortel.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Daniel Walker <dwalker@soe.ucsc.edu>

2009/6/17 Chris Friesen <cfriesen@nortel.com>:
> Marco wrote:
>> This is a second attempt at mainlining Pramfs. The first attempt was
>> back in early 2004 by MontaVista. Since then the kernel code has alm=
ost
>> been completely rewritten. So my first item on the list was porting =
the
>> code on a recent kernel version. After that I added the XIP support.
>>
>> Now some FAQs:
>>
>> What is the goal of this filesystem?
>>
>> Many embedded systems have a block of non-volatile RAM separate from
>> normal system memory, i.e. of which the kernel maintains no memory p=
age
>> descriptors. For such systems it would be beneficial to mount a
>> fast read/write filesystem over this "I/O memory", for storing
>> frequently accessed data that must survive system reboots and power
>> cycles. An example usage might be system logs under /var/log, or a u=
ser
>> address book in a cell phone or PDA.
>
> Nice to see something like this submitted to mainline. =A0We use some=
thing
> similar to provide persistent storage for crash recovery debug data f=
or
> boards which don't have local storage.
>
> In many cases kdump can provide good information, but it's not
> sufficient for "flight recorder" type data if the kernel gets reboote=
d
> by a hardware mechanism (watchdog, for instance) that doesn't give a
> pre-interrupt.

I'm very happy that this fs has the approval of the kernel community. :=
)

>
> I'm a bit concerned about your PTE modifications on every write
> though...we do things like log every exception and scheduler operatio=
n
> to persistent memory, and I think the overhead of changing the
> protection on every write would be a killer. =A0Instead, we make exte=
nsive
> use of checksums at various different levels so that the recovery app
> can determine which data is valid.
>

It's a trade-off between security and performance. Checksum it's a
good way to understand if a data is valid or not (indeed it's used in
this fs), but with this schema you can prevent the system to do
something wrong. This option, however, can be enabled/disabled via
kconfig.

> Also, I'd like to ensure that direct memory access to the memory area
> would be available.

What do you exactly mean with this? Can you explain to me a bit deeper?

> There are some things (like the sched/exception logging mentioned abo=
ve) where we want to make accesses as fast as possible.
>
> Chris
>
>

Marco
