From: Holger Schurig <hs4233@mail.mn-solutions.de>
Subject: Re: [PATCH] console - Add configurable support for console charset translation
Date: Tue, 3 Jun 2008 16:06:29 +0200
Message-ID: <200806031606.29574.hs4233@mail.mn-solutions.de>
References: <48447615.5050806@am.sony.com> <1212500751.16924.322.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1212500751.16924.322.camel@pmac.infradead.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-tiny@selenic.com
Cc: David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

Maybe change the Kconfig entry so that:

* with CONFIG_EMBEDDED=y it's configuration
* with CONFIG_EMBEDDED=n it's on by default
