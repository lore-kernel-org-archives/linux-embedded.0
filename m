From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 7/7] printk: provide a filtering macro for printk
Date: Wed, 2 Sep 2009 15:30:39 +0100
Message-ID: <20090902143039.GA18945@shareable.org>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org> <1251844269-12394-8-git-send-email-mat@brain-dump.org> <20090901233542.GA1321@shareable.org> <20090902090313.GB2736@debbook.brain-dump.org> <20090902110640.GA22602@shareable.org> <4A9E6447.1000705@billgatliff.com> <20090902124401.GA1835@debbook.brain-dump.org> <8bd0f97a0909020554j9ebdf54v813a6ec74c5c1e7c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8bd0f97a0909020554j9ebdf54v813a6ec74c5c1e7c@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Marc Andre Tanner <mat@brain-dump.org>, Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org

Mike Frysinger wrote:
> it depends completely on how the macro is intended to be used.  if you
> want to maintain the "this macro has a return value", then you have to
> use ({...}).  if you want the macro to return a void, then you have to
> use do{...}while(0).

Actually no.  The difference is do {...} while(0) is a _statement_ and
cannot be used in an expression.  Whereas a void value can be used in
expressions like A?B:C, (A,B) and returned from a function, it just
has type void.

-- Jamie
