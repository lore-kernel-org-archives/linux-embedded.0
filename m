From: Fundu <fundu_1999@yahoo.com>
Subject: Re: local_save_flags(flags)
Date: Tue, 23 Sep 2008 18:15:41 -0700 (PDT)
Message-ID: <657652.92650.qm@web63401.mail.re1.yahoo.com>
References: <8bd0f97a0809231611y48102c29u66e6f8b9f483a726@mail.gmail.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0809231611y48102c29u66e6f8b9f483a726@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux embedded <linux-embedded@vger.kernel.org>

> >
> > what about Non maskable interrupts ? disabling
> interrupt won't have any effect on that right ?
> 
> that really doesnt make sense by definition huh. 
> non-maskable means
> they cant be masked.
> -mike

yeah thats the point. i should have elaborated more. 
then there's no guarantee that your code wont be interrupted ?
typically what NMI interrupt does a embedded system have ? 

fundu


      
