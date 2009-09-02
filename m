From: Marc Andre Tanner <mat@brain-dump.org>
Subject: Re: [PATCH 5/5] printk: provide a filtering macro for printk
Date: Wed, 2 Sep 2009 19:27:24 +0200
Message-ID: <20090902172724.GA5811@debbook.brain-dump.org>
References: <1251901505-4313-1-git-send-email-mat@brain-dump.org>
 <1251901505-4313-6-git-send-email-mat@brain-dump.org>
 <4A9EA0E3.8000603@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A9EA0E3.8000603@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Sep 02, 2009 at 06:44:19PM +0200, Marco Stornelli wrote:
> 
> 
> Marc Andre Tanner ha scritto:
> > +#define printk(fmt, ...) ( 							\
> 
> Shouldn't it be an and?

Don't think so. If the expression isn't constant we are unable to filter it
and therefore printk is called anyway. However if the expression is constant
the second part of the condition is evaluated and we filter based on the 
verbosity level.

> > +	(!__builtin_constant_p(PRINTK_FILTER((fmt))) || PRINTK_FILTER((fmt))) ?	\
> > +		printk((fmt), ##__VA_ARGS__) : 0				\
> > +)
> > +
> > +#endif /* CONFIG_PRINTK_VERBOSITY */
> > +

Marc

-- 
 Marc Andre Tanner >< http://www.brain-dump.org/ >< GPG key: CF7D56C0
