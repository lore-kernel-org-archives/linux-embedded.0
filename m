From: Constantine Shulyupin <const@makelinux.com>
Subject: LDT - Linux Driver Template
Date: Mon, 1 Oct 2012 14:18:02 +0200
Message-ID: <CAGZ04WUCVWc7DDauPxqZ_fV-ZwOj=N9hn5mzrupK94jq=vapRg@mail.gmail.com>
References: <CAGZ04WWmsoXCt0nfYMz5qYFLSLutiWUEMKc7b4Esjpzv4k0kNA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=vOvDkyigeSbF45M+l0fk1J7OCL2S09TbWQ7nsB9vGvw=;
        b=bdgisdxTMcVnquB4OA1olgCxrqh/am/7tb7L2RPjCfY/65gfOBHZRiKaj6/aRFaXrO
         KLEryRP0eWcg68IIJGD/ufexejSYsotZsp1GsF5yl4mz6Qh/B6xWlsMHQZZYSceE8w2V
         +NyflodXRppf+Hx3GrFQJLLfBYiOOuV61iR1ZpkzEmdCIEo5l2WH0tOWmMyLyYxEeO6q
         HNB7JK/KnJXuTMdvr8D2BBt4SgNPjKQSJ3kjZtks7XSj8pFp+IYWOhjIr7dex5yOdh7S
         T3ra13Kbhurwnck8tfW1D8TL2zo3iioL8YIDgDKQSyUZqlhHSiGPWk2gBw94/gMIndUx
         ooSA==
In-Reply-To: <CAGZ04WWmsoXCt0nfYMz5qYFLSLutiWUEMKc7b4Esjpzv4k0kNA@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Hi,

I develop LDT - Linux Driver Template. It can be used as starting
point of development custom device driver and for learning development
of Linux device drivers.

Documentation: https://github.com/makelinux/ldt/blob/master/README.md

The driver uses following Linux facilities: module, platform driver,
file operations (read/write, mmap, ioctl, blocking and nonblocking
mode, polling), kfifo, completion, interrupt, tasklet, work, kthread,
timer, misc device, proc fs, UART 0x3f8, HW loopback, SW loopback,
ftracer.

To test the driver just run
git clone git://github.com/makelinux/ldt.git && cd ldt && ./ldt-test

You feedback, suggestions, discussions, recommendations patched will
be greatly appreciated!

Thanks
--
Constantine Shulyupin
http://www.MakeLinux.com/
Embedded Linux Systems,
Device Drivers, TI DaVinci
