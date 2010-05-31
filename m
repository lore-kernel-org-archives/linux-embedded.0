From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: omap udc driver problem with beagle board
Date: Mon, 31 May 2010 09:06:35 +0200
Message-ID: <AANLkTine39Za56t8UQRJVeoH94dOuoFAysGPq_cXYhEe@mail.gmail.com>
References: <4C0235AD.70008@gmail.com>
	<20100530160047.GA7704@gandalf>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=MlwMWu2XMvo6LLTddhPapcFpNDdpI5jj7dFI/L0YYcQ=;
        b=uADdffx2yIrJn1n8y3oBjSPjXQwSw4tQFo/khX2trBsfwhv8eeeIKP8Z9pC030gbWV
         o01ZraM84HQU4GoBALDe/s9KcY733dIlLTXRq/gXYObQChOXleGY42+wxkLZwmxyQmAF
         h95LixFa5jyK6gYfT+2oWJOhDS5VHEmy+6zBM=
In-Reply-To: <20100530160047.GA7704@gandalf>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: me@felipebalbi.com
Cc: felipe.balbi@nokia.com, dbrownell@users.sourceforge.net, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, Linux Embedded <linux-embedded@vger.kernel.org>, tony@atomide.com

2010/5/30 Felipe Balbi <me@felipebalbi.com>:
> On Sun, May 30, 2010 at 11:53:49AM +0200, Marco Stornelli wrote:
> beagle board uses musb. You shouldn't be relying on the udc controller.
> Your Kconfig is just wrong.
>
> --
> balbi
>

Oops, my fault. I see the error in the configuration. Thank you very
much for your response. I'll try again.

Regards,

Marco
