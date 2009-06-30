From: Scott Wood <scottwood@freescale.com>
Subject: Re: PCI device support in Open Firmware (device tree syntax)
Date: Tue, 30 Jun 2009 10:32:24 -0500
Message-ID: <20090630153224.GB27818@b07421-ec1.am.freescale.net>
References: <cb9ecdfa0906290858x125b8149na037f33258c21426@mail.gmail.com> <20090629165133.GC1323@b07421-ec1.am.freescale.net> <cb9ecdfa0906291836mf74c41fn9c187e305771920a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cb9ecdfa0906291836mf74c41fn9c187e305771920a@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernelnewbies@nl.linux.org

On Tue, Jun 30, 2009 at 09:36:51AM +0800, Johnny Hung wrote:
> Thanks for your reply. So there are no PCI device resource info in
> flat device tree.

Usually not -- but occasionally there's something special to be
described.

> How do PCI device resources be assign in general case or is there any example?

The kernel does the assignment.

> I am so confusing, would you please give me detailed describle?

Without narrowing down your question, the best I can do is tell you to
look at the existing code and device trees. :-(

-Scott
