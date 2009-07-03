From: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Subject: Re: Status of bzip2 and lzma kernel compression for ARM?
Date: Fri, 3 Jul 2009 17:43:27 +0200
Message-ID: <20090703154327.GE4278@pc-ras4041.res.insa>
References: <4A428AFF.20307@free-electrons.com>
	<4A433BCD.2030506@compulab.co.il>
	<200906251104.02830.florian@openwrt.org>
	<4A4396CB.9000703@free-electrons.com> <4A4776DD.50105@knaff.lu>
	<4A478286.8020908@knaff.lu> <4A48B1D9.90306@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=lists; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:In-Reply-To:List-Id:
	List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	Content-Type:Content-Transfer-Encoding:Sender; bh=wrCFWQnQdCMBlU
	WpiBOqqxEbf1uCre6bWXYS64c+L8s=; b=FKzdceSUOf5ZSO/RbfTixe+CBMfSv+
	PaZDRniREooe73UGOLSh4p5aXoc6VGQptMee+2pmu9QjwE2dOXDOlCPOlCYMCF7T
	ED4KvGQmWq33LjsPrycRpsNi8nimldteh7ux9n0HBLdtxpgCms03TqLMxuR5yqr/
	Yc0ibeRk3WU1U=
Content-Disposition: inline
In-Reply-To: <4A48B1D9.90306@compulab.co.il>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.arm.linux.org.uk/lurker/list/linux-arm-kernel.html>
List-Post: <mailto:linux-arm-kernel@lists.arm.linux.org.uk>
List-Help: <mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=help>
List-Subscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.arm.linux.org.uk
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk
To: Mike Rapoport <mike@compulab.co.il>
Cc: Alain Knaff <alain@knaff.lu>, Michael Opdenacker <michael-lists@free-electrons.com>, Florian Fainelli <florian@openwrt.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded mailing list <linux-embedded@vger.kernel.org>

On Mon, Jun 29, 2009 at 03:21:45PM +0300, Mike Rapoport wrote :
> 
> 
> Alain Knaff wrote:
> > Alain Knaff wrote:
> >> Attached is a version of the ARM patch for 2.6.30
> >>
> >> There seems to be some issues with the include files (which did not pose
> >> any problems in 2.6.28...), but hopefully somebody more experienced with
> >> the ARM architecture (and with its recent development) than I can help
> >> out there.
> >>
> >> Regards,
> >>
> >> Alain
> > 
> > Actually, the needed changes turned out to be easier than I initially
> > feared. Attached a version that compiles all right.
> 
> I gave it a quick test and it hangs before "Decompressing kernel" is output.
> I hope I'll have time this week to debug what's wrong there.

On my testing board, it hangs after "Decompressing kernel" is output. It seems
that it's getting stuck in the following piece of code in lib/decompressor_lzma.c

while (get_pos(&wr) < header.dst_size) {
                int pos_state = get_pos(&wr) & pos_state_mask;
                uint16_t *prob = p + LZMA_IS_MATCH +
                        (cst.state << LZMA_NUM_POS_BITS_MAX) + pos_state;
                if (rc_is_bit_0(&rc, prob))
                        process_bit0(&wr, &rc, &cst, p, pos_state, prob,
                                     lc, literal_pos_mask);
                else {
                        process_bit1(&wr, &rc, &cst, p, pos_state, prob);
                        if (cst.rep0 == 0)
                                break;
                }
}

Based on some quick tests, it seems that header.dst_size is 0xFFFFFFFFFFFFFFFF,
and if my understanding is correct, it's because LZMA doesn't write the file
size in the header if it reads its input from a pipe, and piggy.lzma turns out
to be created using a pipe.

Replacing cmd_lzma in scripts/Makefile.lib by the following snippet:

cmd_lzma = (lzma -9 -c $(filter-out FORCE, $^) > $@ && $(call size_append, $(filter-out FORCE,$^)) >> $@ ) || (rm -f $@ ; false)

does the trick, as lzma is able to write the file size in the header (and I
think the second part is useless, as it's the filesize encoded in 32bits
little-endian). However, it now hangs right after the 'done, booting the
kernel.'

Hope that helps,
-- 
Albin Tonnerre, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com

-------------------------------------------------------------------
List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php
