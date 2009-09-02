From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PATCH 7/7] printk: provide a filtering macro for printk
Date: Wed, 02 Sep 2009 07:25:43 -0500
Message-ID: <4A9E6447.1000705@billgatliff.com>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org> <1251844269-12394-8-git-send-email-mat@brain-dump.org> <20090901233542.GA1321@shareable.org> <20090902090313.GB2736@debbook.brain-dump.org> <20090902110640.GA22602@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090902110640.GA22602@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Marc Andre Tanner <mat@brain-dump.org>, linux-embedded@vger.kernel.org

Jamie Lokier wrote:
> Looks good, except that I think kernel style is to use "do {...} while
> (0)" rather than "({ ... })"
>   

And IIRC, there was some reason for the do{...} while(0) that made other 
alternatives not work.  So it might be more than just style at issue.


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
