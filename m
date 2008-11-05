From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH 1/6] [PWM] Generic PWM API implementation
Date: Tue, 4 Nov 2008 19:17:27 -0500
Message-ID: <8bd0f97a0811041617k6761866bn20e0c8b6e415cd9a@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com>
	 <8bd0f97a0810170859k72dc1bc5o34ed2388f95c3bc8@mail.gmail.com>
	 <4910AD88.2000200@billgatliff.com>
	 <200811041555.18234.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=80q+l9ctEBsVoGfTb2sfmR8GciwHKp2HWO7S/ZApJuc=;
        b=UxBfRgWoKVzwBvmIuIYlqU+J1XDiydCZ+Nptwyg/W14WSn1o7ELZT8qBKHehND0Gu/
         w9Gv9wq3sAX0sTA1VA0G0RQ+hPJCz668DcABKWCwUHVuT2dqt+jWLh5ItfSHbhwz7M76
         KhEFz1gwfHXmz1v7UQNJezv6uI82k7E4C2TnM=
In-Reply-To: <200811041555.18234.david-b@pacbell.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Brownell <david-b@pacbell.net>
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org

On Tue, Nov 4, 2008 at 18:55, David Brownell wrote:
> On Tuesday 04 November 2008, Bill Gatliff wrote:
>> So, what's the next step?  How do I advocate for getting
>> this API into mainline?
>
> The number of backing implementations seemed a bit low ...
> just one.  And that's switching Atmel's dedicated PWM, but
> not the other PWM driver in the tree (for PXA); so it's
> not terrifically accessible.
>
> My rule of thumb is that it's not worth considering a
> framework as being general enough until it's got three
> fairly different backing implementations.  Two is enough
> to consider merging, especially with complicated drivers.

every Blackfin processor so far has had dedicated PWM hardware in it,
so a backend driver for that arch would show up ...

> Plus the number of framework users is an issue.  The
> PWM led driver is a good demo for two basic features,
> and it's useful:  brightness (duty cycle beyond visual
> perception) and blink rate (duty cycle easily seen with
> the eye).  But it's still only really one API customer,
> even given that new LED trigger...

there is an lcd driver or two in the tree (probably Blackfin specific)
that uses the PWM hardware as an output to drive the hsync/vsync
signals.

and while LIRC is still out-of-tree for mainline, i wrote a driver
using the PWM hardware as an input ... but there wasnt anything else
Blackfin specific in said driver other than the PWM stuff ...

i'm guessing you'd prefer to see those implemented before moving to
mainline though ?
-mike
