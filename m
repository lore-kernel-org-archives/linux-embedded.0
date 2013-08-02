From: Michael Schnell <mschnell@lumino.de>
Subject: AMP on an SMP system
Date: Fri, 02 Aug 2013 10:33:37 +0200
Message-ID: <51FB6EE1.3090708@lumino.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

Hi Experts.

Is there a kind of "official" way to set aside one of the available 
cores in an SMP system from the Linux OS to do deeply embedded 
extremely-low-latency stuff in a kind of single task "main loop" type 
environment ? I.e. creating a true coprocessor from an SMP hardware.

Some of the problems that come in ind here include:

  - how to make the Linux initialization ignore one of the available 
cores  or free a core later on ?
Here I found this:
http://www.linuxtopia.org/online_books/linux_kernel/kernel_configuration/re46.html
So using one of the four cores for special purpose in fact is viable.

  - how to have  a Linux task start the free running main loop ?

  - how to assign certain interrupts to that core and have ISRs run 
there only dedicatedly interrupting the "main loop" and not ever being 
blocked by any Linux activity ?
here I found this:
https://access.redhat.com/site/solutions/15482
In fact of course the hardware defines if/how a certain Interrupt can be 
assigned to a certain CPU. How is this usually done when using ARM 
Cortex A9+ cores ?

  - what about MMU issues ?

  - how to have a Linux application communicate with the non.-Linux 
application running on the dedicated core ?
Here I found this:
http://lwn.net/Articles/464391


For example I (e.g.) would like a (now rather cheap) standard quadcore 
ARM Cortex A9 processor chip and modify a Debian distribution in a way 
that support this stuff.

Thanks for any pointers ?

-Michael
