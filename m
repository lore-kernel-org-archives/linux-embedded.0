From: "Douglas, Jim (Jim)" <jdouglas@avaya.com>
Subject: UIO - interrupt performance
Date: Mon, 20 Oct 2008 10:55:17 +0100
Message-ID: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

We are contemplating porting a large number of device drivers to Linux.
The pragmatic solution is to keep them in user mode (using the UIO
framework) where possible ... they are written in C++ for a start.  

The obvious disadvantages of user mode device drivers are security /
isolation.  The main benefit is ease of development.  

Do you know what the *technical* disadvantages of this approach might
be? I am most concerned about possible impact on interrupt handling. 

For example, I assume the context switching overhead is higher, and that
interrupt latency is more difficult to predict?  

--jim douglas
Avaya UK, Registered in England and Wales under Registered Number
3049861, Registered Address: Avaya House, Cathedral Hill, Guildford,
Surrey, GU2 7YL.
