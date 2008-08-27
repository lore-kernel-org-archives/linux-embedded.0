From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [Bug #11342] Linux 2.6.27-rc3: kernel BUG at mm/vmalloc.c -
 bisected
Date: Wed, 27 Aug 2008 09:32:51 +0100
Message-ID: <20080827093251.41b6b3eb@lxorguk.ukuu.org.uk>
References: <mzBsPw3QUOF.A.87F.wZGsIB@albercik>
	<alpine.LFD.1.10.0808261019450.3363@nehalem.linux-foundation.org>
	<20080826183051.GB10925@cs181140183.pp.htv.fi>
	<alpine.LFD.1.10.0808261144510.3363@nehalem.linux-foundation.org>
	<20080826205916.GB11734@cs181140183.pp.htv.fi>
	<alpine.LFD.1.10.0808261403360.3363@nehalem.linux-foundation.org>
	<f7848160808261554j2f4eaaa6i1ee8801ae75ca7bf@mail.gmail.com>
	<alpine.LFD.1.10.0808261644260.3363@nehalem.linux-foundation.org>
	<f7848160808261758q7b84aab1m188c1ebb59304818@mail.gmail.com>
	<alpine.LFD.1.10.0808261837530.3363@nehalem.linux-foundation.org>
	<f7848160808261936m18c69dc0r26f41850efae4b91@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <f7848160808261936m18c69dc0r26f41850efae4b91@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Parag Warudkar <parag.lkml@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Adrian Bunk <bunk@stusta.de>, Rusty Russell <rusty@rustcorp.com.au>, "Alan D. Brunelle" <Alan.Brunelle@hp.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Testers List <kernel-testers@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@elte.hu>, linux-embedded@vger.kernel.org

> What about deep call chains? The problem with the uptake of 4K stacks
> seems to be that is not reliably provable that it will work under all
> circumstances.

On x86-32 with 8K stacks your IRQ paths share them so that is even harder
to prove (not that you can prove any of them) and the bugs are more
obscure and random.
