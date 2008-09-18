From: Fundu <fundu_1999@yahoo.com>
Subject: RE: local_save_flags(flags)
Date: Thu, 18 Sep 2008 14:09:02 -0700 (PDT)
Message-ID: <896951.4734.qm@web63401.mail.re1.yahoo.com>
References: <556445368AFA1C438794ABDA8901891C098AABE6@USA0300MS03.na.xerox.net>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <556445368AFA1C438794ABDA8901891C098AABE6@USA0300MS03.na.xerox.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux embedded <linux-embedded@vger.kernel.org>

> turning off interrupts just masks them. the interrupt
> hardware should
> "latch" them and they fire when you reenable
> interrupts.
>
> You loose track of "how many" not if any
> happened...
>
> marty

Thanks Marty,

a follow up question,
why do we need to save the flags then ? if the interrupt hardware would
latch them ?
can we not just disable all interrupts ?

TIA,
Fundo


      
