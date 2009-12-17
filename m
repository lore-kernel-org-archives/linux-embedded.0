From: Matt Hsu <matt@0xlab.org>
Subject: CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Thu, 17 Dec 2009 16:31:36 +0800
Message-ID: <4B29EC68.1040109@0xlab.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org
Cc: tim.bird@am.sony.com, Andy Green <andy@warmcat.com>

Summary: Refactoring Qi, lightweight bootloader.

Proposer: Matt Hsu
                                                                                                                                                           

Description:

Qi (named by Alan Cox on Openmoko kernel list) is a minimal bootloader that
"breathes life" into Linux.  Its goal is to stay close to the minimum 
needed                                                                                
 
to "load" and then "boot" Linux -- no boot menus, additional peripheral init
or private states.

Qi currently supports samsung s3c24xx series, s3c6410, TI omap3530. The
more support platforms are planned to add on. The purpose of this project
would be to improve Qi's maintainability, portability. Ideally, this would
make people spend less time on bootloader development but be more focus
on Linux system.

Project objectives:

- Make the hierarchy of source files more sensible and clean

- Generalize components which could be used in common such as I2C drivers.
  Example: platform specific I2C driver -> GPIO bitbang driver.

- Remove duplicated, unused code, header definition. Keep Qi as minimum 
as needed.
 
Related work:

http://wiki.openmoko.org/wiki/Qi

Development branches are hosted here:

http://git.warmcat.com/cgi-bin/cgit/qi/
http://gitorious.org/0xlab-bootloader

Scope:
    Unknown.

Thanks.
Matt
