From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: is it worth separating initrd from initramfs support?
Date: Mon, 4 Aug 2008 19:07:17 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0808041905510.3387@localhost.localdomain>
References: <alpine.LFD.1.10.0808041449420.9561@localhost.localdomain> <c384c5ea0808041316v26ead859se5e778b074c735f4@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <c384c5ea0808041316v26ead859se5e778b074c735f4@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

On Mon, 4 Aug 2008, Leon Woestenberg wrote:

> Robert,
>
> On Mon, Aug 4, 2008 at 8:53 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >  not sure if i asked this here once upon a time but, in the
> > current kernel, you get to select support for *both* initrd and
> > initramfs with a single selection (CONFIG_BLK_DEV_INITRD).
> >
> > ...
> >
> >  in the context of embedded linux, is there any value in
> > separating these features and letting one select them
> > individually?  isn't it
> >
> Makes sense to me to seperate them, especially if this reduces code
> size.
>
> Small kernels and initramfs's are used in memory constrained
> systems, we run it on FPGA SoC cores.
>
> Does disabling initrd alone reduce code size? Is the dependency on
> some subsystem removed (block i/o layer?)

i'm going to move this discussion to the kernel-newbies list since
it's really not tightly related to embedded, we'll hash it out there,
and i'll report back.  i'm *reasonably* convinced that we can save
some bytes here, but i'll make sure, then i'll let you know.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
