From: Rich Felker <dalias@libc.org>
Subject: Re: [PATCH] fs/binfmt_elf_fdpic.c: fix brk area overlap with stack
 on NOMMU
Date: Tue, 25 Aug 2015 22:16:42 -0400
Message-ID: <20150826021642.GN32742@brightrain.aerifal.cx>
References: <20150820191106.GA9655@brightrain.aerifal.cx>
 <55DD15AA.5040503@uclinux.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55DD15AA.5040503@uclinux.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-embedded@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Matt Mackall <mpm@selenic.com>, David Woodhouse <dwmw2@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

On Wed, Aug 26, 2015 at 11:26:02AM +1000, Greg Ungerer wrote:
> Hi Rich,
> 
> On 21/08/15 05:11, Rich Felker wrote:
> > From: Rich Felker <dalias@libc.org>
> > 
> > On NOMMU archs, the FDPIC ELF loader sets up the usable brk range to
> > overlap with all but the last PAGE_SIZE bytes of the stack. This leads
> > to catastrophic memory reuse/corruption if brk is used. Fix by setting
> > the brk area to zero size to disable its use.
> > 
> > Signed-off-by: Rich Felker <dalias@libc.org>
> 
> It would make sense to run this by David Howells <dhowells@redhat.com>,
> I think he wrote this code (added to CC list).

Thanks. I have another follow-up patch to submit soon that uses the
existing ELF_FDPIC_FLAG_CONSTDISP code in binfmt_elf_fdpic.c to load
normal, non-FDPIC ELF files on NOMMU, so I'll make sure to CC him on
that too.

> I have no problem with it, so:
> 
> Acked-by: Greg Ungerer <gerg@uclinux.org>
> 
> > ---
> > 
> > There is no reason for the kernel to be providing a brk area at all on
> > NOMMU; the bFLT loader does not provide one, uClibc never uses brk on
> > NOMMU targets, and musl libc goes out of its way to avoid using brk
> > that might run into the stack.
> 
> I recall a long time back someone was playing with the idea of setting
> the brk to the unused parts of the last data area page. (Somewhat like
> this code seems to be trying). That scheme still allocated the full
> requested stack size (IIRC) though. And that would have been on bFLT
> executables. Anyway, just some historical reference, not really
> relevant now.

For what it's worth, musl's malloc rounds the initial brk up to a page
boundary, but the dynamic linker recovers any partial page at the end
of the data segment and donates it to malloc without brk's help. So
even though brk will fail and malloc will fall back to mmap, this
otherwise-wasted space does get recovered and used.

Rich
