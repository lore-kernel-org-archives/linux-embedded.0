From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] fs/binfmt_elf_fdpic.c: fix brk area overlap with stack on
 NOMMU
Date: Wed, 26 Aug 2015 11:26:02 +1000
Message-ID: <55DD15AA.5040503@uclinux.org>
References: <20150820191106.GA9655@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150820191106.GA9655@brightrain.aerifal.cx>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rich Felker <dalias@libc.org>, linux-embedded@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Matt Mackall <mpm@selenic.com>, David Woodhouse <dwmw2@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

Hi Rich,

On 21/08/15 05:11, Rich Felker wrote:
> From: Rich Felker <dalias@libc.org>
> 
> On NOMMU archs, the FDPIC ELF loader sets up the usable brk range to
> overlap with all but the last PAGE_SIZE bytes of the stack. This leads
> to catastrophic memory reuse/corruption if brk is used. Fix by setting
> the brk area to zero size to disable its use.
> 
> Signed-off-by: Rich Felker <dalias@libc.org>

It would make sense to run this by David Howells <dhowells@redhat.com>,
I think he wrote this code (added to CC list).

I have no problem with it, so:

Acked-by: Greg Ungerer <gerg@uclinux.org>

> ---
> 
> There is no reason for the kernel to be providing a brk area at all on
> NOMMU; the bFLT loader does not provide one, uClibc never uses brk on
> NOMMU targets, and musl libc goes out of its way to avoid using brk
> that might run into the stack.

I recall a long time back someone was playing with the idea of setting
the brk to the unused parts of the last data area page. (Somewhat like
this code seems to be trying). That scheme still allocated the full
requested stack size (IIRC) though. And that would have been on bFLT
executables. Anyway, just some historical reference, not really
relevant now.

Regards
Greg



> --- fs/binfmt_elf_fdpic.c.orig	2015-08-20 18:05:19.089888654 +0000
> +++ fs/binfmt_elf_fdpic.c	2015-08-20 18:10:01.519871432 +0000
> @@ -374,10 +388,7 @@ static int load_elf_fdpic_binary(struct
>  		PAGE_ALIGN(current->mm->start_brk);
>  
>  #else
> -	/* create a stack and brk area big enough for everyone
> -	 * - the brk heap starts at the bottom and works up
> -	 * - the stack starts at the top and works down
> -	 */
> +	/* create a stack area and zero-size brk area */
>  	stack_size = (stack_size + PAGE_SIZE - 1) & PAGE_MASK;
>  	if (stack_size < PAGE_SIZE * 2)
>  		stack_size = PAGE_SIZE * 2;
> @@ -400,8 +411,6 @@ static int load_elf_fdpic_binary(struct
>  
>  	current->mm->brk = current->mm->start_brk;
>  	current->mm->context.end_brk = current->mm->start_brk;
> -	current->mm->context.end_brk +=
> -		(stack_size > PAGE_SIZE) ? (stack_size - PAGE_SIZE) : 0;
>  	current->mm->start_stack = current->mm->start_brk + stack_size;
>  #endif
>  
> 
