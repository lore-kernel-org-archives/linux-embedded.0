From: Marc Andre Tanner <mat@brain-dump.org>
Subject: Re: [PATCH 7/7] printk: provide a filtering macro for printk
Date: Wed, 2 Sep 2009 14:44:01 +0200
Message-ID: <20090902124401.GA1835@debbook.brain-dump.org>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org>
 <1251844269-12394-8-git-send-email-mat@brain-dump.org>
 <20090901233542.GA1321@shareable.org>
 <20090902090313.GB2736@debbook.brain-dump.org>
 <20090902110640.GA22602@shareable.org>
 <4A9E6447.1000705@billgatliff.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A9E6447.1000705@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Jamie Lokier <jamie@shareable.org>, linux-embedded@vger.kernel.org

On Wed, Sep 02, 2009 at 07:25:43AM -0500, Bill Gatliff wrote:
> Jamie Lokier wrote:
> >Looks good, except that I think kernel style is to use "do {...} while
> >(0)" rather than "({ ... })"
> 
> And IIRC, there was some reason for the do{...} while(0) that made
> other alternatives not work.  So it might be more than just style at
> issue.

Do you remember the reason? I found the oposite to be ture, I actually 
started with the do { } while(0) construct but it failed in certain 
situations so I wrapped it with ({ }) and then later removed
the now useless do { } while(0).

By the way printk_once which is defined a few lines further down in
kernel.h also uses ({ }).

Anyway the next version of my patch will no longer need it.

Regards,
Marc

-- 
 Marc Andre Tanner >< http://www.brain-dump.org/ >< GPG key: CF7D56C0
