From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: prevalence of C++ in embedded linux?
Date: Wed, 30 Jul 2008 13:58:34 +0200
Message-ID: <20080730135834.74018bf6@hskinnemo-gx745.norway.atmel.com>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
	<200807290951.34563.neundorf@eit.uni-kl.de>
	<1217319612.24988.15.camel@spike.firmix.at>
	<200807291058.06240.neundorf@eit.uni-kl.de>
	<1217324838.24988.41.camel@spike.firmix.at>
	<556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net>
	<e2e108260807292146n581b655an3119be9e33af871c@mail.gmail.com>
	<20080730102523.GB8992@shareable.org>
	<e2e108260807300404r65bfb2b2xfb07687601dc59da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <e2e108260807300404r65bfb2b2xfb07687601dc59da@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bart Van Assche <bart.vanassche@gmail.com>
Cc: Jamie Lokier <jamie@shareable.org>, "Leisner, Martin" <Martin.Leisner@xerox.com>, Bernd Petrovitsch <bernd@firmix.at>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

"Bart Van Assche" <bart.vanassche@gmail.com> wrote:
> I looked through the gold sources a bit. I wish everything in the GNU
> toolchain were written this way. It is very clean code, nicely
> commented, and easy to follow. It shows pretty clearly, I think, the
> ways in which C++ can be better than C when it is used well.

I guess he never looked at the target interface...

>   // Relocate a section during a relocatable link.  The parameters are
>   // like relocate_section, with additional parameters for the view of
>   // the output reloc section.
>   virtual void
>   relocate_for_relocatable(const Relocate_info<size, big_endian>*,
>                            unsigned int sh_type,
>                            const unsigned char* prelocs,
>                            size_t reloc_count,
>                            Output_section* output_section,
>                            off_t offset_in_output_section,
>                            const Relocatable_relocs*,
>                            unsigned char* view,
>                            typename elfcpp::Elf_types<size>::Elf_Addr
>                              view_address,
>                            section_size_type view_size,
>                            unsigned char* reloc_view,
>                            section_size_type reloc_view_size) = 0;

I can't wait to implement avr32 support for that monster...I thoroughly
hate working on libbfd, and it looks like gold has made many of the
same stupid decisions on the interface level.

Just shows that using C++ doesn't fix a design that is broken to begin
with.

Oh, and I think "relax.cc" is missing ;-)

Haavard
