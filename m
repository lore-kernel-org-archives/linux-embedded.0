From: Freeman <xwang@ubicom.com>
Subject: Re: How the kernel printk works before do =?utf-8?b?Y29uc29sZV9zZXR1cC4=?=
Date: Mon, 29 Jun 2009 19:36:55 +0000 (UTC)
Message-ID: <loom.20090629T191600-99@post.gmane.org>
References: <cb9ecdfa0906232050n6fcfee31ubeee4bcd9b8c0dfe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Johnny Hung <johnny.hacking <at> gmail.com> writes:

> 
> Hi All:
>     I have a powerpc arch platform. The default console is ttyS1 not
> ttyS0 in the platform. My question is how the kernel print debug
> message
> like DBG before parse kernel command line and do console_setup
> function. The command line passed to kernel about console info is
> console=ttyS1.
> So kernel can not print anything before parse cmd line and initial
> console but the result is against. Anyone point me or give me a clue
> is appreciate.
> 
> BR, H. Johnny
> 

Don't worry, printk uses a ring buffer so it allows the kernel to print some, 
hopefully enough, out before console is registered/initialized. This is from 
printk.c

197 /*
198  * The console driver calls this routine during kernel initialization
199  * to register the console printing procedure with printk() and to
200  * print any messages that were printed by the kernel before the
201  * console driver was initialized.
202  */
203 void register_console(void (*proc)(const char *))

Freeman
