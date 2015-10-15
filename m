From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH v2] fs/binfmt_elf_fdpic.c: provide NOMMU loader for
 regular ELF binaries
Date: Thu, 15 Oct 2015 12:09:30 +1000
Message-ID: <561F0ADA.40504@uclinux.org>
References: <20151008163810.GX8645@brightrain.aerifal.cx>
 <561CFF51.40909@uclinux.org> <20151013154940.GR8645@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151013154940.GR8645@brightrain.aerifal.cx>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Rich Felker <dalias@libc.org>
Cc: linux-embedded@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Matt Mackall <mpm@selenic.com>, David Woodhouse <dwmw2@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Oleg Endo <oleg.endo@t-online.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Rich,

On 14/10/15 01:49, Rich Felker wrote:
> On Tue, Oct 13, 2015 at 10:55:45PM +1000, Greg Ungerer wrote:
>> Hi Rich,
>>
>> On 09/10/15 02:38, Rich Felker wrote:
>>> From: Rich Felker <dalias@libc.org>
>>>
>>> The ELF binary loader in binfmt_elf.c requires an MMU, making it
>>> impossible to use regular ELF binaries on NOMMU archs. However, the
>>> FDPIC ELF loader in binfmt_elf_fdpic.c is fully capable as a loader
>>> for plain ELF, which requires constant displacements between LOAD
>>> segments, since it already supports FDPIC ELF files flagged as need=
ing
>>> constant displacement.
>>>
>>> This patch adjusts the FDPIC ELF loader to accept non-FDPIC ELF fil=
es
>>> on NOMMU archs. They are treated identically to FDPIC ELF files wit=
h
>>> the constant-displacement flag bit set, except for personality, whi=
ch
>>> must match the ABI of the program being loaded; the PER_LINUX_FDPIC
>>> personality controls how the kernel interprets function pointers
>>> passed to sigaction.
>>>
>>> Files that do not set a stack size requirement explicitly are given=
 a
>>> default stack size (matching the amount of committed stack the norm=
al
>>> ELF loader for MMU archs would give them) rather than being rejecte=
d;
>>> this is necessary because plain ELF files generally do not declare
>>> stack requirements in theit program headers.
>>>
>>> Only ET_DYN (PIE) format ELF files are supported, since loading at =
a
>>> fixed virtual address is not possible on NOMMU.
>>>
>>> Signed-off-by: Rich Felker <dalias@libc.org>
>>
>> I have no problem with this, so from me:
>>
>> Acked-by: Greg Ungerer <gerg@uclinux.org>
>=20
> Thanks!
>=20
>>> ---
>>>
>>> This patch was developed and tested on J2 (SH2-compatible) but shou=
ld
>>> be usable immediately on all archs where binfmt_elf_fdpic is
>>> available. Moreover, by providing dummy definitions of the
>>> elf_check_fdpic() and elf_check_const_displacement() macros for arc=
hs
>>> which lack an FDPIC ABI, it should be possible to enable building o=
f
>>> binfmt_elf_fdpic on all other NOMMU archs and thereby give them ELF
>>> binary support, but I have not yet tested this.
>>
>> There is a couple of other details that will currently stop this fro=
m
>> working on other arches too.
>>
>> .. kernel/ptrace.c has some fdpic specific code (wanting PTRACE_GETF=
DPIC)
>> .. arch specific mm_context_t may not have members
>> =E2=80=98interp_fdpic_loadmap' or 'exec_fdpic_loadmap'
>>
>> Should be easy to fix those.
>=20
> I see. For archs that lack an FDPIC ABI, I'm not sure it makes sense
> to add these things unless/until someone developes an FDPIC ABI. Woul=
d

Ok. I was looking at it from the point of view of supoporting ELF
on m68k/coldfire, that doesn't currently support FDPIC. So bypassing
=46DPIC support completely.


> it instead make sense to add a new kconfig switch
> CONFIG_BINFMT_ELF_NOMMU ("NOMMU ELF loader") that's implied-on by
> CONFIG_BINFMT_ELF_FDPIC but that can also be enabled independently on
> archs where CONFIG_BINFMT_ELF_FDPIC is not available?

Yes that may be the only answer here.


> Right now these are just ideas. Unless there's a quick and easy
> decision to be made, I'd like it if we could move forward with the
> current patch (which only offers the feature on archs where
> CONFIG_BINFMT_ELF_FDPIC is already available) first and continue to
> explore options for making this available to other archs separately.

Oh, yes. No problem with that. Looks like Andrew has picked it
up. So all good there.


>> It would be good to get some testing and verification on other
>> fdpic supported arches (frv or blackfin or microblaze for example).
>=20
> I wasn't aware Microblaze had an FDPIC ABI; are you sure it does?

Sorry, my mistake. No microblaze FDPIC as far as I know.

Regards
Greg


> Testing to make sure these aren't broken by the patch shouldn't be
> hard to do; I'll start looking into getting a setup for it or finding
> someone who has one. If you want to also test non-FDPIC ELF binaries,
> I think just using the ELF output of a bFLT toolchain without running
> elf2flt may work as a test case, but I'm not sure. Alternatively, any
> FDPIC binary linked with -pie that doesn't use signals can run as a
> non-FDPIC one just by clearing the FDPIC bit in the header.
>=20
> Rich
>=20
