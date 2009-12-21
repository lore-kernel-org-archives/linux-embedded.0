From: Wookey <wookey@wookware.org>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi,
	lightweight bootloader
Date: Mon, 21 Dec 2009 23:17:10 +0000
Message-ID: <20091221231710.GV7001@dream.aleph1.co.uk>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com> <20091221193038.38CB63F6EF@gemini.denx.de> <4B2FD7DB.10008@warmcat.com> <20091221213829.1A8B93F6EF@gemini.denx.de> <4B2FF8E7.505@warmcat.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B2FF8E7.505@warmcat.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

+++ Andy Green [2009-12-21 22:38 +0000]:
> On 12/21/09 21:38, Somebody in the thread at some point said:
>
> Hi -
>
>>> I was talking about GTA02 specifically here, it was (and still is AFAIK)
>>> only updateable by DFU for the bootloader.  We had kernels with soft ECC
>>> that differed from the ECC / bad block marking generated and used by the
>>> s3c2442 NAND hardware unit.  If U-Boot wrote it, it could at least read
>>> it again.  So DFU was / is the only official way to update GTA02 bootloader.
>>
>> This only means that the ports of U-Boot and Linux to that hardware
>> were inconsistent, which means that at least one of them can be
>
> Actually the problem of synchronizing the ECC and BBT rules between  
> bootloader and Linux is a generic one where raw NAND is involved. 

Balloonboard has the same problem (with bootldr and Linux disagreeing
about exactly how the ECC should be done). The kernel can read
bootldr's version but not write it reliably, so userspace nand kernel
upgrades don't work. It's 'simply' a matter of the hacked MTD and yaffs
versions in bootldr getting out of sync with the ones in the kernel
and 'people' not having time to fix it.

It's not bootldr's fault - it's just one of those things no-one's got
round to fixing because it's never the most urgent, and it's quite
painful to do, and generally illustrates the problems of maintaining
separate bootldr and kernel code, which is generally to be avoided as
much as possible. Of course NAND reading/writing is pretty much the
one thing your bootloader has to be able to do so I don't forsee much
relief here (except one day I hope to be able to switch to a more
mainstream bootloader then it's wouldn't be my problem anymore :-)
That's been on my list of things to do for several years now...

I post merely to illustrate that openmoko is not the only
hardware/community with this problem, not to point fingers at anyone
except myself. I sincerely hope all your bootloaders are much better
than ours.

Wookey
-- 
Principal hats:  iEndian - Balloonboard - Toby Churchill - Emdebian
http://wookware.org/
