From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 4/4] module: Use the binary search for symbols resolution
Date: Tue, 19 Apr 2011 11:07:43 +0930
Message-ID: <87liz73tso.fsf@rustcorp.com.au>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org> <1302960373-5309-5-git-send-email-abogani@kernel.org> <BANLkTik9oekjUH6YXTda1P_dM231nEHQqA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <BANLkTik9oekjUH6YXTda1P_dM231nEHQqA@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wanlong.gao@gmail.com, Alessio Igor Bogani <abogani@kernel.org>
Cc: Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Sat, 16 Apr 2011 22:32:08 +0800, Wanlong Gao <wanlong.gao@gmail.com> wrote:
> > +	sym = bsearch(fsa->name, syms->start, syms->stop - syms->start,
> As the bsearch func, why not change the syms->stop to syms->end ?
> Hmm..Just a stupid suggestion.


The names are derived from the linker symbols for end of sections, which
is __stop_<sectionname>.

Cheers,
Rusty.
