From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] console - Add configurable support for console charset
 translation
Date: Wed, 4 Jun 2008 15:07:47 +0100
Message-ID: <20080604150747.3ec7ee57@core>
References: <48447615.5050806@am.sony.com>
	<1212500751.16924.322.camel@pmac.infradead.org>
	<4845DB46.3020308@am.sony.com>
	<20080604125500.0fce2ea4@core>
	<1212587753.32207.86.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1212587753.32207.86.camel@pmac.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

> If I merge this incremental patch, does that address your objections?

Yes

> (Note that I've changed the expression to evaluate (c) only once, just
> because that's best practice in macro definitions. Wasn't really worth
> doing it for (vc) though.)

Agreed
