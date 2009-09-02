From: Marc Andre Tanner <mat@brain-dump.org>
Subject: Re: [PATCH 7/7] printk: provide a filtering macro for printk
Date: Wed, 2 Sep 2009 11:03:13 +0200
Message-ID: <20090902090313.GB2736@debbook.brain-dump.org>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org>
 <1251844269-12394-8-git-send-email-mat@brain-dump.org>
 <20090901233542.GA1321@shareable.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090901233542.GA1321@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: linux-embedded@vger.kernel.org

On Wed, Sep 02, 2009 at 12:35:42AM +0100, Jamie Lokier wrote:
> Marc Andre Tanner wrote:
> > + * The check with sizeof(void*) should make sure that we don't operate on
> > + * pointers, which the compiler wouldn't be able to optimize out, but only
> > + * on string constants.
> 
> Take a look at __builtin_constant_p in the GCC manual.
> 
> You'll probably find that wrapping the whole of the rest of the
> expression (without the sizeof) in __builtin_constant_p is a good
> way to know when to depend on the result of the expression.

Thanks, so if I understood it correctly this should be used like this:

#define PRINTK_FILTER(fmt) (							\
	(((const char *)(fmt))[0] != '<' && CONFIG_PRINTK_VERBOSITY >= 4) ||	\
	(((const char *)(fmt))[0] == '<' && 					\
	 ((const char *)(fmt))[1] <= *__stringify(CONFIG_PRINTK_VERBOSITY))	\
)

#define printk(fmt, ...) ({ 							\
	if (__builtin_constant_p(PRINTK_FILTER(fmt)) && PRINTK_FILTER(fmt))	\
		printk((fmt), ##__VA_ARGS__); 					\
})

The sizeof check wouldn't be necessary. Is this correct?

Marc

-- 
 Marc Andre Tanner >< http://www.brain-dump.org/ >< GPG key: CF7D56C0
