From: "Alessio Igor Bogani" <abogani@texware.it>
Subject: Re: UIO - interrupt performance
Date: Tue, 21 Oct 2008 11:01:19 +0200
Message-ID: <63a49ef40810210201x36249476tcc75141d87a610f2@mail.gmail.com>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
	 <48FC71BD.9070703@coritel.it> <48FCAE16.70509@billgatliff.com>
	 <48FD94AA.8070900@coritel.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=4E26I46SmvncDg3wI5uy2GlCMhVx3+o83nBtXLgOumg=;
        b=OYvPU5Nyjd0m6+4hk3jEwzHv6ASMBUDZEB6WN6WUpS7YnhivAuAZZmlviqzuC7shNP
         lhGhZdDy0A8qEpS4S8tqypzCv+gbKLuvc1NOCnzSAx6obaWNE9SUY+Ndmu7Wzo5H05q2
         TJld2dmAV2W/q32Z1ubabBkS5qaDNB7vKOyoM=
In-Reply-To: <48FD94AA.8070900@coritel.it>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@coritel.it>
Cc: Bill Gatliff <bgat@billgatliff.com>, "Douglas, Jim (Jim)" <jdouglas@avaya.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>

Hi All,

Sorry for my (very) bad english.

2008/10/21 Marco Stornelli <marco.stornelli@coritel.it>:
[...]
> idea. UIO drivers, however, has been inserted mainly for one reason: the
> problem with GPL, so I prefer, but it's only my opinion, at least for
> now, to write a "classic" driver if there aren't GPL problems.

No, that isn't the main objective of the UIO Authors.

AFAIK They want achieve:

1) Fast prototyping for device drivers
2) Easy and fast debug
3) Avoid "fast and furious" changes of the internal kernel interfaces
for their drivers

Ciao,
Alessio
