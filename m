From: Rich Felker <dalias@libc.org>
Subject: Re: [PATCH] fs/binfmt_elf_fdpic.c: provide NOMMU loader for regular
 ELF binaries
Date: Tue, 6 Oct 2015 21:23:05 -0400
Message-ID: <20151007012305.GU8645@brightrain.aerifal.cx>
References: <20150929231649.GA7821@brightrain.aerifal.cx>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150929231649.GA7821@brightrain.aerifal.cx>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Matt Mackall <mpm@selenic.com>, David Woodhouse <dwmw2@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Oleg Endo <oleg.endo@t-online.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

Ping.

On Tue, Sep 29, 2015 at 07:16:49PM -0400, Rich Felker wrote:
> From: Rich Felker <dalias@libc.org>
> 
> The ELF binary loader in binfmt_elf.c requires an MMU, making it
> impossible to use regular ELF binaries on NOMMU archs. However, the
> FDPIC ELF loader in binfmt_elf_fdpic.c is fully capable as a loader
> for plain ELF, which requires constant displacements between LOAD
> segments, since it already supports FDPIC ELF files flagged as needing
> constant displacement.
> 
> This patch adjusts the FDPIC ELF loader to accept non-FDPIC ELF files
> on NOMMU archs. They are treated identically to FDPIC ELF files with
> the constant-displacement flag bit set, except for personality, which
> must match the ABI of the program being loaded; the PER_LINUX_FDPIC
> personality controls how the kernel interprets function pointers
> passed to sigaction.
> 
> Files that do not set a stack size requirement explicitly are given a
> default stack size (matching the amount of committed stack the normal
> ELF loader for MMU archs would give them) rather than being rejected;
> this is necessary because plain ELF files generally do not declare
> stack requirements in theit program headers.
> 
> Only ET_DYN (PIE) format ELF files are supported, since loading at a
> fixed virtual address is not possible on NOMMU.
> 
> Signed-off-by: Rich Felker <dalias@libc.org>
> ---
> 
> This patch was developed and tested on J2 (SH2-compatible) but should
> be usable immediately on all archs where binfmt_elf_fdpic is
> available. Moreover, by providing dummy definitions of the
> elf_check_fdpic() and elf_check_const_displacement() macros for archs
> which lack an FDPIC ABI, it should be possible to enable building of
> binfmt_elf_fdpic on all other NOMMU archs and thereby give them ELF
> binary support, but I have not yet tested this.
> 
> The motivation for using binfmt_elf_fdpic.c rather than adapting
> binfmt_elf.c to NOMMU is that the former already has all the necessary
> code to work properly on NOMMU and has already received widespread
> real-world use and testing. I hope this is not controversial.
> 
> I'm not really happy with having to unset the FDPIC_FUNCPTRS
> personality bit when loading non-FDPIC ELF. This bit should really
> reset automatically on execve, since otherwise, executing non-ELF
> binaries (e.g. bFLT) from an FDPIC process will leave the personality
> in the wrong state and severely break signal handling. But that's a
> separate, existing bug and I don't know the right place to fix it.
> 
> 
> 
> --- fs/binfmt_elf_fdpic.c.orig	2015-09-29 22:13:06.716412478 +0000
> +++ fs/binfmt_elf_fdpic.c	2015-09-29 22:38:24.122986621 +0000
> @@ -103,19 +103,36 @@
>  core_initcall(init_elf_fdpic_binfmt);
>  module_exit(exit_elf_fdpic_binfmt);
>  
> -static int is_elf_fdpic(struct elfhdr *hdr, struct file *file)
> +static int is_elf(struct elfhdr *hdr, struct file *file)
>  {
>  	if (memcmp(hdr->e_ident, ELFMAG, SELFMAG) != 0)
>  		return 0;
>  	if (hdr->e_type != ET_EXEC && hdr->e_type != ET_DYN)
>  		return 0;
> -	if (!elf_check_arch(hdr) || !elf_check_fdpic(hdr))
> +	if (!elf_check_arch(hdr))
>  		return 0;
>  	if (!file->f_op->mmap)
>  		return 0;
>  	return 1;
>  }
>  
> +#ifndef elf_check_fdpic
> +#define elf_check_fdpic(x) 0
> +#endif
> +
> +#ifndef elf_check_const_displacement
> +#define elf_check_const_displacement(x) 0
> +#endif
> +
> +static int is_constdisp(struct elfhdr *hdr)
> +{
> +	if (!elf_check_fdpic(hdr))
> +		return 1;
> +	if (elf_check_const_displacement(hdr))
> +		return 1;
> +	return 0;
> +}
> +
>  /*****************************************************************************/
>  /*
>   * read the program headers table into memory
> @@ -191,8 +208,16 @@
>  
>  	/* check that this is a binary we know how to deal with */
>  	retval = -ENOEXEC;
> -	if (!is_elf_fdpic(&exec_params.hdr, bprm->file))
> +	if (!is_elf(&exec_params.hdr, bprm->file))
> +		goto error;
> +#ifdef CONFIG_MMU
> +	/* binfmt_elf handles non-fdpic elf except on nommu */
> +	if (!elf_check_fdpic(&exec_params.hdr))
> +		goto error;
> +#else
> +	if (exec_params.hdr.e_type != ET_DYN)
>  		goto error;
> +#endif
>  
>  	/* read the program header table */
>  	retval = elf_fdpic_fetch_phdrs(&exec_params, bprm->file);
> @@ -269,13 +294,13 @@
>  
>  	}
>  
> -	if (elf_check_const_displacement(&exec_params.hdr))
> +	if (is_constdisp(&exec_params.hdr))
>  		exec_params.flags |= ELF_FDPIC_FLAG_CONSTDISP;
>  
>  	/* perform insanity checks on the interpreter */
>  	if (interpreter_name) {
>  		retval = -ELIBBAD;
> -		if (!is_elf_fdpic(&interp_params.hdr, interpreter))
> +		if (!is_elf(&interp_params.hdr, interpreter))
>  			goto error;
>  
>  		interp_params.flags = ELF_FDPIC_FLAG_PRESENT;
> @@ -306,9 +331,9 @@
>  
>  	retval = -ENOEXEC;
>  	if (stack_size == 0)
> -		goto error;
> +		stack_size = 131072UL; /* same as exec.c's default commit */
>  
> -	if (elf_check_const_displacement(&interp_params.hdr))
> +	if (is_constdisp(&interp_params.hdr))
>  		interp_params.flags |= ELF_FDPIC_FLAG_CONSTDISP;
>  
>  	/* flush all traces of the currently running executable */
> @@ -319,7 +344,10 @@
>  	/* there's now no turning back... the old userspace image is dead,
>  	 * defunct, deceased, etc.
>  	 */
> -	set_personality(PER_LINUX_FDPIC);
> +	if (elf_check_fdpic(&exec_params.hdr))
> +		set_personality(PER_LINUX_FDPIC);
> +	else
> +		set_personality(PER_LINUX);
>  	if (elf_read_implies_exec(&exec_params.hdr, executable_stack))
>  		current->personality |= READ_IMPLIES_EXEC;
>  
