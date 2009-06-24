From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: How the kernel printk works before do console_setup.
Date: Tue, 23 Jun 2009 22:03:33 -0700
Message-ID: <4A41B3A5.9010807@am.sony.com>
References: <cb9ecdfa0906232050n6fcfee31ubeee4bcd9b8c0dfe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753770AbZFXFEB@vger.kernel.org>
In-Reply-To: <cb9ecdfa0906232050n6fcfee31ubeee4bcd9b8c0dfe@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-embedded@vger.kernel.org

Johnny Hung wrote:
> Hi All:
>     I have a powerpc arch platform. The default console is ttyS1 not
> ttyS0 in the platform. My question is how the kernel print debug
> message
> like DBG before parse kernel command line and do console_setup
> function. The command line passed to kernel about console info is
> console=ttyS1.
> So kernel can not print anything before parse cmd line and initial
> console but the result is against. Anyone point me or give me a clue
> is appreciate.

Before the console is set up, the printk data is formatted
and put into the kernel log buffer, but not sent to any console.
Any messages printk'ed before that are buffered but do not
appear.  When the console is initialized, then all buffered
messages are sent to the console, and subsequent printks cause
the message to go to the log buffer, but then immediately
get sent from there to the console.

Under certain conditions you can examine the log buffer of
a kernel that failed to initialize it's console, after a
warm reset of the machine, using the firmware memory dump
command.

See http://elinux.org/Kernel_Debugging_Tips#Accessing_the_printk_buffer_after_a_silent_hang_on_boot
for some tips on accessing the log buffer of a previous boot.

Note also, that if the serial console does not come up,
but the kernel successfully boots, and you can get a network
login on the machine, you can always print out the kernel log
buffer messages using 'dmesg' at a user-space shell prompt.

Hope this helps!
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
