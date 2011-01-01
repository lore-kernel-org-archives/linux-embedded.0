From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: Renaming of CONFIG_EMBEDDED to CONFIG_EXPERT
Date: Sat, 1 Jan 2011 09:01:25 +0100
Message-ID: <20110101080125.GA4040@opentech.at>
References: <AANLkTik90vOtkBKDiU5O_gtyWYHd-_VSeYCqRwn2Vcim@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTik90vOtkBKDiU5O_gtyWYHd-_VSeYCqRwn2Vcim@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Sat, 01 Jan 2011, Paul Gortmaker wrote:

> Given the high traffic on LKML, some folks probably haven't seen this
> thread, which proposes to rename the CONFIG_EMBEDDED option to
> CONFIG_EXPERT.
> 
> https://patchwork.kernel.org/patch/438671/
>
what would be the advantage of such a change ? is there an intent to introduce
an actual CONFIG_EMBEDDED dedicated to embedded systems ?

The argument in the above patch that it requires experts to modify these 
settings holds for a lot of items in the kernel config and if that is the
prime motivatino to flag these then an additional tag "EXPERT" along with
"NEW" and "EXPERIMENTAL" might make more sense (Aside from the help text
generally stating the sane-state any way with the common note that if you
don't knwo what you are doing say N...)

The main objection I would have is that it will break documentation (out of
tree docs that is) with little to no utility for the kernel developers.

hofrat 
