From: linux-embedded-owner@reliableembeddedsystems.com
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Fri, 13 Jun 2008 10:02:31 -0500
Message-ID: <20080613100231.btmn0xgmqog884cs@localhost>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	<8bd0f97a0806120905u532ce5f9sf231e185173de791@mail.gmail.com>
	<alpine.LFD.1.10.0806121208320.22877@localhost.localdomain>
	<200806121925.35883.rob@landley.net>
	<1213340652.26255.224.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1213340652.26255.224.camel@pmac.infradead.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Rob Landley <rob@landley.net>, "Robert P. J. Day" <rpjday@crashcourse.ca>, Mike Frysinger <vapier.adi@gmail.com>, Tim Bird <tim.bird@am.sony.com>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

Hi David,

Do you wanna set some breakpoints and inspect variables in makefiles?
Have a look at a simple makefile debugger (written in make):
http://newsletter.embedded.com/shared/printableArticle.jhtml?articleID=197003517

Regards,

Robert

---
Robert Berger
Embedded Software Specialist

Reliable Embedded Systems
Consulting Training Engineering
Tel.: (+30) 697 593 3428
Fax.:(+30 210) 684 7881
URL: www.reliableembeddedsystems.com


Quoting David Woodhouse <dwmw2@infradead.org>:

> On Thu, 2008-06-12 at 19:25 -0500, Rob Landley wrote:
>> Make doesn't scale.
>
> Make scales just fine. The only real problem with make is that it's a
> complete pain to debug.
>
> --
> dwmw2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


