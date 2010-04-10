From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: A better way to sequence driver initialization?
Date: Fri, 09 Apr 2010 22:59:05 -0500
Message-ID: <4BBFF789.3030201@billgatliff.com>
References: <4BBF7E9C.80604@billgatliff.com> <4BBFF66D.7020206@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4BBFF66D.7020206@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-embedded <linux-embedded@vger.kernel.org>

Bill Gatliff wrote:
> Maybe there are fewer places that would need wait queues than I
> originally thought!  At least for drivers that use the device API,
> kset_find_obj() might be the only place that needs to wait until a
> device or bus appears.

... and kset_register() might be the only place that calls
wake_up_interruptible().  Wow.


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
