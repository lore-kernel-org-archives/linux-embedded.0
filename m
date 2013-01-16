From: Baurzhan Ismagulov <ibr@radix50.net>
Subject: Re: How to use DEBUG macros in compressed/head.S
Date: Wed, 16 Jan 2013 11:30:34 +0100
Message-ID: <20130116103034.GA5161@yssyq.radix50.net>
References: <94B6F8A1EDC14A8CB9308D5F65F19892@VIU9IM6TKCWEEDX>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <94B6F8A1EDC14A8CB9308D5F65F19892@VIU9IM6TKCWEEDX>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-embedded@vger.kernel.org
Cc: registcn@gmail.com

Hello zhaoyilong,

I do get your mails.

On Wed, Jan 16, 2013 at 04:17:39PM +0800, zhaoyilong wrote:
> CONFIG_DEBUG_ICEDCC is closed by default, so I am sure  the code runs=
 tothe
> following branch:
=2E..
> .macro kputc,val
=2E..
> .macro kphex,val,len
=2E..
> .macro debug_reloc_start
=2E..

What do you mean by "branch"? Those are macro definitions that are
expanded inline by the assembler.


>     To debug this,I want to test the macro kputc provided in this fil=
e=97=97
> using ok kernel.

So you have a vendor kernel that works on your board? That is good.


> I add a line "kputc #'a' " after the tag ".text", then make error say=
s
> "undefined reference to `putc' ",it seems that compiler cant find "pu=
tc"
> used in
> the definition of macro =93kputc=94.
>     This is an ok kernel,so I cant say the serial port is not open=97=
=97can
> this mean "putc" is defined already?.

We don't have your vendor's kernel, so no one except your vendor can
tell. Possibly DEBUG support for head.S is broken in that tree.


> 1?Why the error "  undefined reference to `putc'  " disappeared?

What do you mean by "disappeared"? Do I understand correctly, the vendo=
r
kernel didn't build with DEBUG enabled, and still doesn't? And the
mainline kernel does build? If so, the vendor kernel is broken w.r.t.
DEBUG in head.S.


> 2?Why it stops at"Uncompressing Linux... done, booting the kernel."?

Often it's an exception somewhere. It may be an exception in kputc. So
it's important to know whether kputc works in a working kernel, which
you can't test since the vendor kernel doesn't build with DEBUG in
head.S.


> 3?Can this error ( undefined reference to `putc'  ) mean the serial p=
ort is
> not open? Where is it defined ?
> Is it refer to the C function or just an assembly macro?

Since it's called from the assembly code, I'd assume it's a macro. Grep
for it in the mainline kernel and see whether it exists at the same
location in the vendor kernel.


That said, in my experience, the problem start later. So if your goal i=
s
to port the board support code from the vendor kernel to the mainline
one (which is a good idea), start with it: Copy the board support file
to the mainline kernel and run that kernel. If it doesn't work, there i=
s
a couple of things to check, such as machine id and serial console. If
you can get a JTAG debugger (e.g., an OpenOCD one), it would help.


With kind regards,
Baurzhan.
