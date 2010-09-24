From: "CEVAN Ondrej" <Ondrej.CEVAN@frequentis.com>
Subject: how to increase memory limit reduced at boot-time by "mem"
Date: Fri, 24 Sep 2010 14:30:51 +0200
Message-ID: <9E0336F52EEC16458D081AA4C618AD8F5B6DE4@VIECLEX02.frequentis.frq>
References: <4C96B77D.3040509@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <4C96B77D.3040509@lougher.demon.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

Hi all!

If the upper memory limit is reduced at booting by using the kernel command
line parameter "mem" is there a way how this memory limit could be increased
at some later point of kernel execution? In other words, if I exclude the
upper part of system memory from kernel's use at boot time, can I reclaim it
back at some later point? 

Particularly I am interested if this would work on the PowerPC and ARM
architecture, or is it not architecture depending?

Thanks a lot for your answer!

Ondrej
