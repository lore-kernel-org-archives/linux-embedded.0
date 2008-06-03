From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] console - Add configurable support for console charset
	translation
Date: Tue, 03 Jun 2008 15:10:05 +0100
Message-ID: <1212502205.16924.335.camel@pmac.infradead.org>
References: <48447615.5050806@am.sony.com>
	 <1212500751.16924.322.camel@pmac.infradead.org>
	 <200806031606.29574.hs4233@mail.mn-solutions.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806031606.29574.hs4233@mail.mn-solutions.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Schurig <hs4233@mail.mn-solutions.de>
Cc: linux-tiny@selenic.com, Tim Bird <tim.bird@am.sony.com>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Tue, 2008-06-03 at 16:06 +0200, Holger Schurig wrote:
> Maybe change the Kconfig entry so that:
> 
> * with CONFIG_EMBEDDED=y it's configuration
> * with CONFIG_EMBEDDED=n it's on by default

That's what Tim's patch did (although I moved it to drivers/char/Kconfig
and made it depend on CONFIG_VT).

-- 
dwmw2

