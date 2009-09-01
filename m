From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 7/7] printk: provide a filtering macro for printk
Date: Wed, 2 Sep 2009 00:35:42 +0100
Message-ID: <20090901233542.GA1321@shareable.org>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org> <1251844269-12394-8-git-send-email-mat@brain-dump.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1251844269-12394-8-git-send-email-mat@brain-dump.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Andre Tanner <mat@brain-dump.org>
Cc: linux-embedded@vger.kernel.org

Marc Andre Tanner wrote:
> + * The check with sizeof(void*) should make sure that we don't operate on
> + * pointers, which the compiler wouldn't be able to optimize out, but only
> + * on string constants.

Take a look at __builtin_constant_p in the GCC manual.

You'll probably find that wrapping the whole of the rest of the
expression (without the sizeof) in __builtin_constant_p is a good
way to know when to depend on the result of the expression.

-- Jamie
