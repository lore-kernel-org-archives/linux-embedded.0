From: Fundu <fundu_1999@yahoo.com>
Subject: local_save_flags(flags)
Date: Thu, 18 Sep 2008 11:48:28 -0700 (PDT)
Message-ID: <357915.32175.qm@web63405.mail.re1.yahoo.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux embedded <linux-embedded@vger.kernel.org>

Hi,

From my understanding the local_irq_save(flags) saves the current irq state and disables the interrupts. 

My question is what happens to those interrupts that arriving while the interrupts are disabled. 
is the following understanding correct ... 

if they are edge triggered they would be lost, 
only level triggered interrupts would be serviced after interrupts are enabled.

TIA
Fundu.


      
