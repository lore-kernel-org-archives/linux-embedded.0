From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Thu, 19 May 2011 16:56:34 +0930
Message-ID: <8762p75exh.fsf@rustcorp.com.au>
References: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com> <1305665763-3988-1-git-send-email-abogani@kernel.org> <4DD3E540.8000205@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4DD3E540.8000205@googlemail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Behme <dirk.behme@googlemail.com>, Alessio Igor Bogani <abogani@kernel.org>
Cc: Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>

On Wed, 18 May 2011 17:26:56 +0200, Dirk Behme <dirk.behme@googlemail.com> wrote:
> The old version with the warning is in linux-next now
> 
> http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=commitdiff;h=903996de9b35213aaa4162c24351a2cb2931d9ac

Yep, I switched to the new one after sfr's pull.

Then I switched to the enhanced-comments one just now, but if Linus was
quick to pull he'll have the undercommented version rather than the
overcommented one.

Cheers,
Rusty.
