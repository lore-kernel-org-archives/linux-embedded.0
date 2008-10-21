From: Marco Stornelli <marco.stornelli@coritel.it>
Subject: Re: UIO - interrupt performance
Date: Tue, 21 Oct 2008 11:30:39 +0200
Message-ID: <48FDA13F.3030303@coritel.it>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>	 <48FC71BD.9070703@coritel.it> <48FCAE16.70509@billgatliff.com>	 <48FD94AA.8070900@coritel.it> <63a49ef40810210201x36249476tcc75141d87a610f2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <63a49ef40810210201x36249476tcc75141d87a610f2@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alessio Igor Bogani <abogani@texware.it>
Cc: Bill Gatliff <bgat@billgatliff.com>, "Douglas, Jim (Jim)" <jdouglas@avaya.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>

I could agree, but "the facto" due to UIO license condition, a company
often uses UIO drivers, regardless performance, debug, etc, only as not
to public the code under GPL.

Alessio Igor Bogani ha scritto:
> Hi All,
> 
> Sorry for my (very) bad english.
> 
> 2008/10/21 Marco Stornelli <marco.stornelli@coritel.it>:
> [...]
>> idea. UIO drivers, however, has been inserted mainly for one reason: the
>> problem with GPL, so I prefer, but it's only my opinion, at least for
>> now, to write a "classic" driver if there aren't GPL problems.
> 
> No, that isn't the main objective of the UIO Authors.
> 
> AFAIK They want achieve:
> 
> 1) Fast prototyping for device drivers
> 2) Easy and fast debug
> 3) Avoid "fast and furious" changes of the internal kernel interfaces
> for their drivers
> 
> Ciao,
> Alessio
> 

-- 
Marco Stornelli
Embedded Software Engineer
CoRiTeL - Consorzio di Ricerca sulle Telecomunicazioni
http://www.coritel.it

marco.stornelli@coritel.it
+39 06 72582838
