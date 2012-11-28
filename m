From: Alexander Varnin <fenixk19@mail.ru>
Subject: Need help adding platform UIO devices to board
Date: Wed, 28 Nov 2012 22:53:23 +0400
Message-ID: <50B65DA3.9000707@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=Nvf30NS+jmTjAenjZgpb9WI4Mh4ga/hSbKuamscK3eo=;
	b=rdJjg+Jku3VKUt3fLAjp5Ihn0RB39hIq7w/AFimVP74yARo7JB2M5M9S1qVz+XYNL5X/y+DmGXHpm2CMN0v+8vmUB+kZCIoHqGuHGT0aBeSbusD9czxrd4yMBTUr84LL;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hello!
I'm trying to add UIO device to my system to handle interrupt. But i'm
facing following problem. Docs says, on reading device /dev/uio0 it will
block until interrupt occurs. I've made simple program for test. It
tries to write 1 to enable interrupts.

    #include <unistd.h>
    #include <errno.h>
    #include <fcntl.h>
    #include <stdio.h>

    int main()
    {
        int fd;
        char c = 1;
        fd = open("/dev/uio0", O_RDONLY);
        if (fd<0) {
            printf("open error: %d\n", errno);
             return 0;
        }
        printf("fd == %d\n", fd);
        int res = write(fd, &c, 1);
        if(res<0) {
            printf("write error: %d\n", errno);
        }
        return 0;
    }

And as the output i get

    fd ==
    3                                                                        

    write error: 9 

error 9 means "bad file descriptor". File /dev/uio0 is here.
/sys/class/uio/uio0 folder i also. Reading are fails the same way.

Here is how i add device to the system in board specific code

    static struct uio_info cross_uio_info = {
       .name = "uio_mcross",
       .version = "0.1",
       .irq = IRQ_EINT14,
       .irq_flags = 0,
    };

    static struct platform_device minipos_cross_device = {
        .name          = "uio_pdrv_genirq",
        .id          = -1,
        .dev              = {
          .platform_data = &cross_uio_info,
        }
    };

and then add platform device.
Please, help.
