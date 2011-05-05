From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC PATCH] arm: drop Execute-In-Place
Date: Thu, 05 May 2011 19:32:24 +0100
Message-ID: <1304620350.2398.29.camel@i7.infradead.org>
References: <1304607121-13612-1-git-send-email-plagnioj@jcrosoft.com>
	 <4DC2E5AA.5010604@am.sony.com> <4DC2E669.2000101@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4DC2E669.2000101@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Eric Miao <eric.miao@canonical.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, 2011-05-05 at 11:03 -0700, Tim Bird wrote:
> On 05/05/2011 11:00 AM, Tim Bird wrote:
> > On 05/05/2011 07:52 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> >> nearly no-one use it, only amop1, pxa and sa1100 implement it
> > 
> > Sony uses this - a lot.  Principally we're using this on a NEC
> > naviengine part, which is ARM11MPCore based, support for which
> > is (sadly) out of tree. 

If you're out of tree, you don't exist.

-- 
dwmw2
