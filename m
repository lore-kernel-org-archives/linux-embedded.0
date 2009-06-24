From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: How the kernel printk works before do console_setup.
Date: Thu, 25 Jun 2009 08:56:43 +1000
Message-ID: <1245884203.21200.18.camel@pasglop>
References: <cb9ecdfa0906232050n6fcfee31ubeee4bcd9b8c0dfe@mail.gmail.com>
	 <4A41B3A5.9010807@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A41B3A5.9010807@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Johnny Hung <johnny.hacking@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org


> Before the console is set up, the printk data is formatted
> and put into the kernel log buffer, but not sent to any console.
> Any messages printk'ed before that are buffered but do not
> appear.  When the console is initialized, then all buffered
> messages are sent to the console, and subsequent printks cause
> the message to go to the log buffer, but then immediately
> get sent from there to the console.
> 
> Under certain conditions you can examine the log buffer of
> a kernel that failed to initialize it's console, after a
> warm reset of the machine, using the firmware memory dump
> command.

On ppc, we have tricks to display things earlier :-)

We can initialize the serial ports way before console_setup() (and we do
in most cases) and we use what we call the "udbg" console until the real
one takes over. The "udbg" console is a very small layer which outputs
via a provided "putc" routine. Platforms can provide their own here, we
have a collection of standard ones for legacy UARTs (it should be
automatically setup in that case by the code in legacy_serial), Apple
ESCCs, etc... We even have compile time options that allow that stuff to
be initialized before start_kernel...

Cheers,
Ben.


> See http://elinux.org/Kernel_Debugging_Tips#Accessing_the_printk_buffer_after_a_silent_hang_on_boot
> for some tips on accessing the log buffer of a previous boot.
> 
> Note also, that if the serial console does not come up,
> but the kernel successfully boots, and you can get a network
> login on the machine, you can always print out the kernel log
> buffer messages using 'dmesg' at a user-space shell prompt.
> 
> Hope this helps!
>  -- Tim
> 
> =============================
> Tim Bird
> Architecture Group Chair, CE Linux Forum
> Senior Staff Engineer, Sony Corporation of America
> =============================
> 
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
