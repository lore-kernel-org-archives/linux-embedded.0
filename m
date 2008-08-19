From: Fundu <fundu_1999@yahoo.com>
Subject: Module init for compiled in vs loaded modules
Date: Mon, 18 Aug 2008 18:44:35 -0700 (PDT)
Message-ID: <970019.41811.qm@web63401.mail.re1.yahoo.com>
References: <fa686aa40808180900q730b921an64483d985793b33b@mail.gmail.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40808180900q730b921an64483d985793b33b@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Hi,

For kernel modules can be loaded by explicitly do insmod etc for ones that are not compiled into the kernel.

1) But where do i look to find how the kernel loads(ie. calls the fn exported by module_init(XXXX)) for modules compiled into the kernel. 

2) Does the kernel call some kind of probe to load them ? say i have 2 module compiled into the kernel for 2 diff type of ether cards. Would the kernel call init on both.

thanks !




      
