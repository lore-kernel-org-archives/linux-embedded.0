From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Tue, 17 May 2011 16:22:41 -0700
Message-ID: <20110517232241.GA19140@kroah.com>
References: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com>
 <1305665763-3988-1-git-send-email-abogani@kernel.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to; s=smtpout; bh=/WIrWxHO2+1dZWnLJC11KwFGfjc=; b=Lqaj6GsUKQ4Wc6X3Z22EL8YoMoIug5zlTL9tC9wMiaB74IsrR3NvPULtfM/+uvcR7+bJygsfrVJFW1eQ9hVLBcZ7vqYJ/VsTmsMYncZvsbK1FkXQ0wehNQNhKZUe+cAfkSzSp1d3A8aq3CYAjkj00eLAyPc3eC3FqEKuUOa4+wU=
Content-Disposition: inline
In-Reply-To: <1305665763-3988-1-git-send-email-abogani@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>

On Tue, May 17, 2011 at 10:56:03PM +0200, Alessio Igor Bogani wrote:
> This work was supported by a hardware donation from the CE Linux Forum.
> 
> Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>
> ---

That's nice, but _why_ do this change?  What does it buy us?

Please explain why you make a change, not just who sponsored the change,
that's not very interesting to developers.

thanks,

greg k-h
