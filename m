From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: Saving the kernel log accross boots
Date: Thu, 25 Jun 2009 10:23:54 -0500
Message-ID: <4A43968A.2020905@billgatliff.com>
References: <op.uv238aaxq25ece@thur.netmodule.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <op.uv238aaxq25ece@thur.netmodule.intranet>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Meuli <Martin.Meuli@gmx.ch>
Cc: linux-embedded@vger.kernel.org

Martin Meuli wrote:
>
> Before digging any deeper I would like to know if someone as a better
> (more general) idea.

Could you stuff the output into an MTD device?

What about netconsole, or putting the console on a serial port?  Then
you could send the log out before and up to the point the crash happens.

