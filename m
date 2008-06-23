From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Mon, 23 Jun 2008 20:19:11 +0200
Message-ID: <200806232019.11546.vda.linux@googlemail.com>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806231928.09458.vda.linux@googlemail.com> <20080623174537.GB4756@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=LxGmzaW69wxUHxD4I34d9tmYEAEuzEt82y1DoHmqavk=;
        b=kWbqASvNWj/oH/cWAv02d9+RZqF9UCydf63aXPYsmEfZDCh9plrsP5nsw+JdG5PwgJ
         odxYPAmwZN38p87YmWU0YYgJ8nzT/lKGkoIJ02l2H9j62xsZpFkNbjqzzufF/59EkuJ8
         8YNw+v0qnJPLfEjsPYCi0cL3HI0+x+fMlBHmU=
In-Reply-To: <20080623174537.GB4756@cs181140183.pp.htv.fi>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk@kernel.org>
Cc: Andi Kleen <andi@firstfloor.org>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 23 June 2008 19:45, Adrian Bunk wrote:
> Plus the fact that you often get into situations where more options
> mean complex and fragile stuff. Read the Kconfig files under 
> drivers/media/ and check in git all commits to them since 2.6.25 alone, 
> and you'll understand why "add an option for every bit" can result in
> very high ongoing maintainance work required.
> 
> Not everything that is technically possible is also maintainable, and 
> maintainability is a very important point in a project with several 
> million lines changing each year.

Well, I am not (and was not) disputing this. I agree with it.
CONFIGs should not be multiplying like rabbits.
--
vda
