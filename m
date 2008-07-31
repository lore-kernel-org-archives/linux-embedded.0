From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [patch 0/4] [resend] Add configuration options to disable
	features
Date: Thu, 31 Jul 2008 15:46:28 -0400
Message-ID: <1217533588.2328.1.camel@localhost.localdomain>
References: <200807311850.m6VIoqCE015883@arbas.nms.ulrich-teichert.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=wzoEuryddcpQGLZHMZ4eQJLcAjIQh6ZJA8erag/6x2c=;
        b=AZ5OmjGO35D+fIeapNRK5qx4d4Ikef790jks8ktvNE/GYTvFTDEjlt9D/AUWN3eLK+
         5ne9fWmWSF2Hyt9dtX0JplFiHUVYpyYLgHBtiO2yyplt8PdRV465oetYBPxmmVVsMJGI
         A+nO0XAwLWThUSUTzQszZs1e+pNU9fDwZU1kc=
In-Reply-To: <200807311850.m6VIoqCE015883@arbas.nms.ulrich-teichert.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Tim Bird <tim.bird@am.sony.com>, David Miller <davem@davemloft.net>, dwmw2@infradead.org, torvalds@linux-foundation.org, thomas.petazzoni@free-electrons.com, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com

On Thu, 2008-07-31 at 20:50 +0200, Ulrich Teichert wrote:
> Hi,
> 
> >I don't know of any embedded products that ship with NTP turned
> >on.
> 
> Well, I do. To be exact, I've developed parts of it. But it's numbers
> are only into the thousands, so that makes it insignificant ;-)
> 
> >It's best to assume, with embedded, that we're not shipping
> >ANY of the desktop or server applications you are familiar with.
> >Absent those, does something break in the kernel with multicast
> >support when IGMP is turned off?
> 
> I do not think of NTP as desktop or server application, but that's
> probably just me,

No, it's not just you.  NTP is useful in cases where things do care
about time but hardware designers were too cheap to put an RTC on the
board.

I will admit that it's use in embedded products is probably very limited
though.

josh
