From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: Re: [PATCH] init: make init failures more explicit
Date: Fri, 18 Oct 2013 11:32:13 +0200
Message-ID: <5261001D.3090909@free-electrons.com>
References: <1382086049-14386-1-git-send-email-michael.opdenacker@free-electrons.com> <CAMuHMdWXWfGqw041pkOYKzLjQ05GfCcz9jOFQaPa=d_RwhOUcg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWXWfGqw041pkOYKzLjQ05GfCcz9jOFQaPa=d_RwhOUcg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Hi Geert,

On 10/18/2013 11:23 AM, Geert Uytterhoeven wrote:
> On Fri, Oct 18, 2013 at 10:47 AM, Michael Opdenacker
> <michael.opdenacker@free-electrons.com> wrote:
>> +       if (ret && ret != -ENOENT) {
>> +               pr_err("Starting init: %s exists but couldn't execute it\n",
> I think it makes sense to also print the value of ret here.
> Apart from your -ENOEXEC case, peeking a bit around, it can be also be
> -EINVAL, -ENOMEM (debug binary too big for small embedded system?),
> -EACCES, -E2BIG, ...
I agree. It would definitely make sense. I'll propose a new version.

Many thanks!

Cheers,

Michael.

-- 
Michael Opdenacker, CEO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
+33 484 258 098
