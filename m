From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: How to move two valuables to x86 CPU register ebx, ecx by
 using AT&A inline asm.
Date: Fri, 20 Nov 2009 10:43:40 +0000
Message-ID: <1258713820.10091.487.camel@macbook.infradead.org>
References: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
	 <4B05187F.6030809@einfochips.com>
	 <cb9ecdfa0911190219r11fa165v331a590889edcfd0@mail.gmail.com>
	 <4B051C40.5040003@einfochips.com>
	 <cb9ecdfa0911190311j6cc50c34hfc7e398cbf0a1072@mail.gmail.com>
	 <1258697050.16509.36.camel@sotona>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1258697050.16509.36.camel@sotona>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: stas <stas@lvk.cs.msu.su>
Cc: Johnny Hung <johnny.hacking@gmail.com>, Viral Mehta <viral.mehta@einfochips.com>, kernelnewbies@nl.linux.org, linux-embedded@vger.kernel.org

On Fri, 2009-11-20 at 09:04 +0300, stas wrote:
> It seems to me that this example code is not free of errors. After the
> third ":" we should list registers "ebx" and "ecx" to let gcc know
> they could change in asm section.
> 
> __asm__ volatile (
>         "movl (%0), %%ebx\n\t"
>         "movl (%1), %%ecx\n\t"
>         "outl %%ebx, $0xb2\n\t"
>         "outl %%ecx, $0xb6\n\t"
> 
> 
>         :
>         : "r"(var_a), "r"(var_b)
>         : "ebx", "ecx" 

That's not good enough. Because the compiler could choose to use %ebx
for passing in 'var_b', and then it would get clobbered before you move
it to %ecx in the second instruction.

You'd need to make it an earlyclobber too.

> 
> The SAME code:
> __asm__ volatile (
>         "outl %%ebx, $0xb2\n\t"
>         "outl %%ecx, $0xb6\n\t"
>         :
>         : "b"(var_a), "c"(var_b)
> );

That's the better approach, although yours didn't do what Johnny's
original seemed to. Jiri Slaby posted something which looks correct.

> /* taken from linux-2.6./include/asm-generic/io.h
> If you want to use it in user-space just replace u8 with unsigned char,
> u16 with unsigned short. In kernel space just insert #include directive.
> */
> static inline void outb(u8 v, u16 port)

And that's just an entirely gratuitous use of our kernel nonsense-types.
Just use the proper C types uint16_t and uint8_t instead.

Or just 'unsigned char' and 'unsigned short', for that matter -- I
believe Linux would blow up horribly if those types ever changed from
8-bit and 16-bit respectively.

-- 
dwmw2
