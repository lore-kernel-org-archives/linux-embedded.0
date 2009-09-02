From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 7/7] printk: provide a filtering macro for printk
Date: Wed, 2 Sep 2009 12:06:40 +0100
Message-ID: <20090902110640.GA22602@shareable.org>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org> <1251844269-12394-8-git-send-email-mat@brain-dump.org> <20090901233542.GA1321@shareable.org> <20090902090313.GB2736@debbook.brain-dump.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090902090313.GB2736@debbook.brain-dump.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Andre Tanner <mat@brain-dump.org>
Cc: linux-embedded@vger.kernel.org

Marc Andre Tanner wrote:
> Thanks, so if I understood it correctly this should be used like this:
> 
> #define PRINTK_FILTER(fmt) (							\
> 	(((const char *)(fmt))[0] != '<' && CONFIG_PRINTK_VERBOSITY >= 4) ||	\
> 	(((const char *)(fmt))[0] == '<' && 					\
> 	 ((const char *)(fmt))[1] <= *__stringify(CONFIG_PRINTK_VERBOSITY))	\
> )
> 
> #define printk(fmt, ...) ({ 							\
> 	if (__builtin_constant_p(PRINTK_FILTER(fmt)) && PRINTK_FILTER(fmt))	\
> 		printk((fmt), ##__VA_ARGS__); 					\
> })
> 
> The sizeof check wouldn't be necessary. Is this correct?

Looks good, except that I think kernel style is to use "do {...} while
(0)" rather than "({ ... })"

-- Jamie
