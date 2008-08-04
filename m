From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: is it worth separating initrd from initramfs support?
Date: Mon, 4 Aug 2008 16:29:19 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0808041626040.22985@localhost.localdomain>
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

from a quick inspection, i *think* specifically disabling initrd
support would save a few bytes.  see the end of init/initramfs.c:

===========
static int __init populate_rootfs(void)
{
        char *err = unpack_to_rootfs(__initramfs_start,
                         __initramfs_end - __initramfs_start, 0);
        if (err)
                panic(err);
        if (initrd_start) {
#ifdef CONFIG_BLK_DEV_RAM
                int fd;
                printk(KERN_INFO "checking if image is initramfs...");
                err = unpack_to_rootfs((char *)initrd_start,
                        initrd_end - initrd_start, 1);
                if (!err) {
                        printk(" it is\n");
                        unpack_to_rootfs((char *)initrd_start,
                                initrd_end - initrd_start, 0);
                        free_initrd();
                        return 0;
                }
                printk("it isn't (%s); looks like an initrd\n", err);
                fd = sys_open("/initrd.image", O_WRONLY|O_CREAT, 0700);
                if (fd >= 0) {
                        sys_write(fd, (char *)initrd_start,
                                        initrd_end - initrd_start);
                        sys_close(fd);
                        free_initrd();
                }
#else
                printk(KERN_INFO "Unpacking initramfs...");
                err = unpack_to_rootfs((char *)initrd_start,
                        initrd_end - initrd_start, 0);
                if (err)
                        panic(err);
                printk(" done\n");
                free_initrd();
#endif
        }
        return 0;
}
==========

  if you're interested in *only* an internal intramfs, surely some of
the code above could be dropped, no?  but that's just my first
impression.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
