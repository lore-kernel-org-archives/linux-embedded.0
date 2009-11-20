From: stas <stas@lvk.cs.msu.su>
Subject: Re: How to move two valuables to x86 CPU register ebx, ecx by
 using AT&A inline asm.
Date: Fri, 20 Nov 2009 09:04:10 +0300
Message-ID: <1258697050.16509.36.camel@sotona>
References: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
	 <4B05187F.6030809@einfochips.com>
	 <cb9ecdfa0911190219r11fa165v331a590889edcfd0@mail.gmail.com>
	 <4B051C40.5040003@einfochips.com>
	 <cb9ecdfa0911190311j6cc50c34hfc7e398cbf0a1072@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <cb9ecdfa0911190311j6cc50c34hfc7e398cbf0a1072@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: Viral Mehta <viral.mehta@einfochips.com>, kernelnewbies@nl.linux.org, linux-embedded@vger.kernel.org

It seems to me that this example code is not free of errors. After the
third ":" we should list registers "ebx" and "ecx" to let gcc know they
could change in asm section. There can be no difference in -O0 but may
have large impact on result in -O{2,3} modes.
Actually resulting code may not include "push <some reg>"->"asm
section"->"pop <some reg>" code. In the compile time gcc would decide
when and what should be on registers. So it may look like "movl smth,
reg"->"asm section"->"do nothing with reg, because we don't need it any
more or directly put some value using movl".

__asm__ volatile (
	"movl (%0), %%ebx\n\t"
	"movl (%1), %%ecx\n\t"
	"outl %%ebx, $0xb2\n\t"
	"outl %%ecx, $0xb6\n\t"


	:
	: "r"(var_a), "r"(var_b)
	: "ebx", "ecx"
);

There is another way. You can select registers should be used to pass
arguments into the asm section (you can select registers to get results
too). That should look much more pretty.

The SAME code:
__asm__ volatile (
	"outl %%ebx, $0xb2\n\t"
	"outl %%ecx, $0xb6\n\t"
	:
	: "b"(var_a), "c"(var_b)
);

And much more pretty way:

/* taken from linux-2.6./include/asm-generic/io.h
If you want to use it in user-space just replace u8 with unsigned char,
u16 with unsigned short. In kernel space just insert #include directive.
*/
static inline void outb(u8 v, u16 port)
{
        asm volatile("outb %0,%1" : : "a" (v), "dN" (port)); 
}

...
outb(var_a, 0xb2);
outb(var_b, 0xb6);

> Thank you. I got error because the valuable I actually pass is a
> member of structure point. ex.
> 
>        __asm__ volatile ("movl (%0), %%ebx\n"
>          "movl (%1), %%ecx\n"
>          : : "r"(ptr->cnt), "r"(ptr->blk) );
> 
> I reassigned ptr->cnt and ptr->blk to local unsigned int valuable and
> compile successfully. BTW, the first ':' is mean output operands,
> second ':' is mean input operands but how about third ':'. Does it
> mean which registers had been changed in inline asm code? So, does gcc
> do push and pop to retain these registers in the front and end of asm
> code?
>     I have tried to compile inline asm in user space application and
> use gcc -S flag to translate c code to asm code. How do I translate
> kernel driver to asm code without compile to obj file?
> 
> Thank your help
> BR, H. Johnny
> 
> 2009/11/19 Viral Mehta <viral.mehta@einfochips.com>:
> > [root@viral temp_c_files]# gcc foo.c
> > [root@viral temp_c_files]# cat foo.c
> > #include <stdio.h>
> > int main()
> > {
> >       unsigned int val = 10;
> >       unsigned int tmp = 5;
> >
> >       __asm__ volatile ("movl (%0), %%ebx\n"
> >         "movl (%1), %%ecx\n"
> >         : : "r"(val), "r"(tmp) );
> > }
> >
> > [root@viral temp_c_files]#
> > Thanks,
> > Viral Mehta,
> > Embedded Software Engineer,
> > Tel. No. 91 79 26563705, Ext. 423
> > www.einfochips.com <http://www.einfochips.com>
> > Prepare and Prevent rather than Repair and Repent
> >
> >
> > Johnny Hung wrote:
> >>
> >> It doesn't works. :(
> >>
> >> 2009/11/19 Viral Mehta <viral.mehta@einfochips.com>:
> >>
> >>>
> >>> How about putting \n at the end ?
> >>>
> >>> Just try out,
> >>>
> >>> __asm__ volatile ("movl %0, %%ebx\n"
> >>>        "movl %1, %%ecx\n"
> >>>
> >>>
> >>>
> >>>
> >>> Thanks,
> >>> Viral Mehta,
> >>> Embedded Software Engineer,
> >>> Tel. No. 91 79 26563705, Ext. 423
> >>> www.einfochips.com <http://www.einfochips.com>
> >>> Prepare and Prevent rather than Repair and Repent
> >>>
> >>>
> >>> Johnny Hung wrote:
> >>>
> >>>>
> >>>> Hi All:
> >>>>   I want to move two local valuables to x86 arch CPU ebx, ecx
> >>>> register and do outb cpu instruction by using AT&A inline asm in
> >>>> kernel driver.  The following code was I wrote but gcc report syntax
> >>>> error:
> >>>> ==
> >>>>   unsigned int val = 10;
> >>>>   unsigned int tmp = 5;
> >>>>   ....
> >>>>   __asm__ volatile ("movl %0, %%ebx"
> >>>>         "movl %1, %%ecx"
> >>>>         "outb $0x27, $0xb2"
> >>>>         :
> >>>>         :"r"(val), "r"(tmp)
> >>>>         :"%ebx", "%ecx"
> >>>>  );
> >>>>
> >>>> Does anyone can point me out. Any reply is appreciated.
> >>>>
> >>>> BRs, H. Johnny
> >>>>
> >>>> --
> >>>> To unsubscribe from this list: send an email with
> >>>> "unsubscribe kernelnewbies" to ecartis@nl.linux.org
> >>>> Please read the FAQ at http://kernelnewbies.org/FAQ
> >>>>
> >>>>
> >>>>
> >>>> Email Scanned for Virus & Dangerous Content by :
> >>>> www.CleanMailGateway.com
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> >>> --
> >>> _____________________________________________________________________
> >>> Disclaimer: This e-mail message and all attachments transmitted with it
> >>> are intended solely for the use of the addressee and may contain legally
> >>> privileged and confidential information. If the reader of this message
> >>> is not the intended recipient, or an employee or agent responsible for
> >>> delivering this message to the intended recipient, you are hereby
> >>> notified that any dissemination, distribution, copying, or other use of
> >>> this message or its attachments is strictly prohibited. If you have
> >>> received this message in error, please notify the sender immediately by
> >>> replying to this message and please delete it from your computer. Any
> >>> views expressed in this message are those of the individual sender
> >>> unless otherwise stated.Company has taken enough precautions to prevent
> >>> the spread of viruses. However the company accepts no liability for any
> >>> damage caused by any virus transmitted by this email.
> >>> _____________________________________________________________________
> >>>
> >>>
> >>>
> >>
> >>
> >> Email Scanned for Virus & Dangerous Content by : www.CleanMailGateway.com
> >>
> >>
> >>
> >
> > --
> > _____________________________________________________________________
> > Disclaimer: This e-mail message and all attachments transmitted with it
> > are intended solely for the use of the addressee and may contain legally
> > privileged and confidential information. If the reader of this message
> > is not the intended recipient, or an employee or agent responsible for
> > delivering this message to the intended recipient, you are hereby
> > notified that any dissemination, distribution, copying, or other use of
> > this message or its attachments is strictly prohibited. If you have
> > received this message in error, please notify the sender immediately by
> > replying to this message and please delete it from your computer. Any
> > views expressed in this message are those of the individual sender
> > unless otherwise stated.Company has taken enough precautions to prevent
> > the spread of viruses. However the company accepts no liability for any
> > damage caused by any virus transmitted by this email.
> > _____________________________________________________________________
> >
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


