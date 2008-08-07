From: "Amol Lad" <amol.lad@gmail.com>
Subject: Re: kernel command line from u-boot
Date: Thu, 7 Aug 2008 16:57:30 +0530
Message-ID: <8c675e9b0808070427v42a4055bwae3adfb160a4e1ab@mail.gmail.com>
References: <8c675e9b0808062141s74f1a7bfob5cab6b23b0268d3@mail.gmail.com>
	<Pine.LNX.4.64.0808071050280.9798@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=+uemJn0vBcR1HCPtcfaTb1TA6j/hdI6n2eQRJN7jm24=;
	b=GclTqy5vUt8zLUQCMN+WPA1E9okb5Lx21RoCocjHSRvc8ghF92J4Pkc8kkPjrTqjN3
	+ovv1dn5JXsvRxZgHPQU2yUkH7a1J34MKclpx6yfinKZnkUaUqaAI7W67rWShHnGhCWf
	QxMlXT1tqKeZ/KKRPeG9PCk+PTkpVYeDNbCGA=
In-Reply-To: <Pine.LNX.4.64.0808071050280.9798@vixen.sonytel.be>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

> Probably nobody noticed as this part of the code takes care of the
> `obsolete-style' parameters. `module_param' is the new way.

Ohh, btw how module_param is different from obsolete style paramaters
? Do we need to pass arguments to kernel from bootloader using a
different method for getting them processed using module_param ?

>
> Geert Uytterhoeven

Thanks
Amol
