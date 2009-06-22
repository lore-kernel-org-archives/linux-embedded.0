From: "Chris Friesen" <cfriesen@nortel.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 22 Jun 2009 17:26:45 -0600
Message-ID: <4A401335.1090307@nortel.com>
References: <4A3E6F28.4090404@gmail.com> <20090621205245.GC3254@elf.ucw.cz> <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com> <20090622172003.GB21149@elf.ucw.cz> <4A3FBFF0.40006@am.sony.com> <20090622173704.GC21299@elf.ucw.cz> <4A3FC84A.6060608@gmail.com> <20090622204031.GA24236@elf.ucw.cz> <4A3FFC89.4070006@am.sony.com> <20090622215753.GA25434@elf.ucw.cz> <20090622223855.GA25996@elf.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20090622223855.GA25996@elf.ucw.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Tim Bird <tim.bird@am.sony.com>, Marco <marco.stornelli@gmail.com>, Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Pavel Machek wrote:

> More politely said: "I believe you would be better off modifying
> ramdisk to include the functionality for persistence."  New filesystem
> should not really be neccessary. ext2 for performance, ext3 if you
> need robustness from journalling, maybe something else makes sense,
> too.

I agree that a persistent block device makes more sense.

However, as someone with some experience in using this type of
mechanism, a special filesystem (separate from the special block device)
could also be useful.  We often use things like circular buffers,
per-cpu areas, both log-structured and variable-length records, etc.  A
filesystem that would take care of this type of thing under the hood
might simplify a few things.

Also note that it's very useful for the kernel itself to be able to
access the contents of this persistent area...we use it for parts of the
log stream, various forms of "flight recorder" information, panic
tracebacks, etc. as well as making it available to select userspace apps.

Chris
