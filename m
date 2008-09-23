From: Fundu <fundu_1999@yahoo.com>
Subject: Re: local_save_flags(flags)
Date: Tue, 23 Sep 2008 13:01:09 -0700 (PDT)
Message-ID: <903542.11891.qm@web63401.mail.re1.yahoo.com>
References: <8bd0f97a0809181551u477911f6iccea3c74c6e6832d@mail.gmail.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0809181551u477911f6iccea3c74c6e6832d@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux embedded <linux-embedded@vger.kernel.org>

> > 2) so is disable interrupts twice is a problem, or just
> enabling them after they are disabled (which sounds like
> how it should be) a problem.
> 
> both are a problem.  the non-state saving version cannot be
> used
> recursively nor in parallel to the state-saving version.

Much clear now, Thanks Mike! 

here's a follow up question.

what about Non maskable interrupts ? disabling interrupt won't have any effect on that right ? 

thanks 
Fundu. 



      
