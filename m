From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH v2] fs/binfmt_elf_fdpic.c: provide NOMMU loader for
 regular ELF binaries
Date: Tue, 13 Oct 2015 22:55:45 +1000
Message-ID: <561CFF51.40909@uclinux.org>
References: <20151008163810.GX8645@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151008163810.GX8645@brightrain.aerifal.cx>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Rich Felker <dalias@libc.org>, linux-embedded@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Matt Mackall <mpm@selenic.com>, David Woodhouse <dwmw2@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Oleg Endo <oleg.endo@t-online.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Rich,

On 09/10/15 02:38, Rich Felker wrote:
> From: Rich Felker <dalias@libc.org>
>
> The ELF binary loader in binfmt_elf.c requires an MMU, making it
> impossible to use regular ELF binaries on NOMMU archs. However, the
> FDPIC ELF loader in binfmt_elf_fdpic.c is fully capable as a loader
> for plain ELF, which requires constant displacements between LOAD
> segments, since it already supports FDPIC ELF files flagged as needin=
g
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

I have no problem with this, so from me:

Acked-by: Greg Ungerer <gerg@uclinux.org>

> ---
>
> This patch was developed and tested on J2 (SH2-compatible) but should
> be usable immediately on all archs where binfmt_elf_fdpic is
> available. Moreover, by providing dummy definitions of the
> elf_check_fdpic() and elf_check_const_displacement() macros for archs
> which lack an FDPIC ABI, it should be possible to enable building of
> binfmt_elf_fdpic on all other NOMMU archs and thereby give them ELF
> binary support, but I have not yet tested this.

There is a couple of other details that will currently stop this from
working on other arches too.

=2E kernel/ptrace.c has some fdpic specific code (wanting PTRACE_GETFDP=
IC)
=2E arch specific mm_context_t may not have members =91interp_fdpic_loa=
dmap'=20
or 'exec_fdpic_loadmap'

Should be easy to fix those.

It would be good to get some testing and verification on other
fdpic supported arches (frv or blackfin or microblaze for example).

Regards
Greg


> The motivation for using binfmt_elf_fdpic.c rather than adapting
> binfmt_elf.c to NOMMU is that the former already has all the necessar=
y
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
> The previous version of this patch had a bug which broke loading of
> non-ET_DYN FDPIC binaries that slipped through my testing. This
> version fixes the regression and has been tested with both FDPIC and
> non-FDPIC ELF files.
>
>
> --- fs/binfmt_elf_fdpic.c.orig	2015-09-29 22:13:06.716412478 +0000
> +++ fs/binfmt_elf_fdpic.c	2015-10-07 05:11:33.702236056 +0000
> @@ -103,19 +103,36 @@
>   core_initcall(init_elf_fdpic_binfmt);
>   module_exit(exit_elf_fdpic_binfmt);
>  =20
> -static int is_elf_fdpic(struct elfhdr *hdr, struct file *file)
> +static int is_elf(struct elfhdr *hdr, struct file *file)
>   {
>   	if (memcmp(hdr->e_ident, ELFMAG, SELFMAG) !=3D 0)
>   		return 0;
>   	if (hdr->e_type !=3D ET_EXEC && hdr->e_type !=3D ET_DYN)
>   		return 0;
> -	if (!elf_check_arch(hdr) || !elf_check_fdpic(hdr))
> +	if (!elf_check_arch(hdr))
>   		return 0;
>   	if (!file->f_op->mmap)
>   		return 0;
>   	return 1;
>   }
>  =20
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
>   /******************************************************************=
***********/
>   /*
>    * read the program headers table into memory
> @@ -191,8 +208,18 @@
>  =20
>   	/* check that this is a binary we know how to deal with */
>   	retval =3D -ENOEXEC;
> -	if (!is_elf_fdpic(&exec_params.hdr, bprm->file))
> +	if (!is_elf(&exec_params.hdr, bprm->file))
>   		goto error;
> +	if (!elf_check_fdpic(&exec_params.hdr)) {
> +#ifdef CONFIG_MMU
> +		/* binfmt_elf handles non-fdpic elf except on nommu */
> +		goto error;
> +#else
> +		/* nommu can only load ET_DYN (PIE) ELF */
> +		if (exec_params.hdr.e_type !=3D ET_DYN)
> +			goto error;
> +#endif
> +	}
>  =20
>   	/* read the program header table */
>   	retval =3D elf_fdpic_fetch_phdrs(&exec_params, bprm->file);
> @@ -269,13 +296,13 @@
>  =20
>   	}
>  =20
> -	if (elf_check_const_displacement(&exec_params.hdr))
> +	if (is_constdisp(&exec_params.hdr))
>   		exec_params.flags |=3D ELF_FDPIC_FLAG_CONSTDISP;
>  =20
>   	/* perform insanity checks on the interpreter */
>   	if (interpreter_name) {
>   		retval =3D -ELIBBAD;
> -		if (!is_elf_fdpic(&interp_params.hdr, interpreter))
> +		if (!is_elf(&interp_params.hdr, interpreter))
>   			goto error;
>  =20
>   		interp_params.flags =3D ELF_FDPIC_FLAG_PRESENT;
> @@ -306,9 +333,9 @@
>  =20
>   	retval =3D -ENOEXEC;
>   	if (stack_size =3D=3D 0)
> -		goto error;
> +		stack_size =3D 131072UL; /* same as exec.c's default commit */
>  =20
> -	if (elf_check_const_displacement(&interp_params.hdr))
> +	if (is_constdisp(&interp_params.hdr))
>   		interp_params.flags |=3D ELF_FDPIC_FLAG_CONSTDISP;
>  =20
>   	/* flush all traces of the currently running executable */
> @@ -319,7 +346,10 @@
>   	/* there's now no turning back... the old userspace image is dead,
>   	 * defunct, deceased, etc.
>   	 */
> -	set_personality(PER_LINUX_FDPIC);
> +	if (elf_check_fdpic(&exec_params.hdr))
> +		set_personality(PER_LINUX_FDPIC);
> +	else
> +		set_personality(PER_LINUX);
>   	if (elf_read_implies_exec(&exec_params.hdr, executable_stack))
>   		current->personality |=3D READ_IMPLIES_EXEC;
>  =20
>
