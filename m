From: Greg KH <greg@kroah.com>
Subject: Re: your mail
Date: Wed, 18 May 2011 12:22:12 -0700
Message-ID: <20110518192212.GC26945@kroah.com>
References: <4DD305B3.3000707@am.sony.com>
 <1305744925-8162-1-git-send-email-abogani@kernel.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to; s=smtpout; bh=gSZSo83GeqXHefKDuVk7tX5gczU=; b=Rs6WI8iIbWyAdjE6LNAwj4A2NddIXe1wmLavZ5NbjR1oNI6/yGcFKJHnZK5LaZLIBTtPC2rNPl6KmMwyGmaU6SYH4CqZoO/d8e0PAjdgzOR5vWkMaNtVkAu3jmWAMerk0ptQm4fvTV8KK7+sGdVceJt97wk74fTtEKueNopY7aA=
Content-Disposition: inline
In-Reply-To: <1305744925-8162-1-git-send-email-abogani@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Bird <tim.bird@am.sony.com>, Christoph Hellwig <hch@infradead.org>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>

On Wed, May 18, 2011 at 08:55:25PM +0200, Alessio Igor Bogani wrote:
> Dear Mr. Bird, Dear Mr. Kroah-Hartman,
> 
> Sorry for my very bad English.
> 
> 2011/5/18 Tim Bird <tim.bird@am.sony.com>:
> [...]
> > Alessio - do you have any timings you can share for the speedup?
> 
> You can find a little benchmark using ftrace at end of this email:
> https://lkml.org/lkml/2011/4/5/341
> 
> > On 05/17/2011 04:22 PM, Greg KH wrote:
> >> On Tue, May 17, 2011 at 10:56:03PM +0200, Alessio Igor Bogani wrote:
> >>> This work was supported by a hardware donation from the CE Linux Forum.
> [...]
> >> Please explain why you make a change, not just who sponsored the change,
> >> that's not very interesting to developers.
> 
> You are right. I apologize.
> 
> This patch is a missing piece (not essential it is only a further little
> optimization) of this little patchset:
> https://lkml.org/lkml/2011/4/16/48
> 
> Unfortunately I forgot to include this patch in the series (my first error)
> then I avoided explaining the changes because I had thought that those were
> already enough explained in the cover-letter of the patchset (my second error).
> 
> Sorry for my mistakes.
> 
> Is this better?
> 
> Subject: [PATCH] module: Use binary search in lookup_symbol()
> 
> The function is_exported() with its helper function lookup_symbol() are used to
> verify if a provided symbol is effectively exported by the kernel or by the
> modules. Now that both have their symbols sorted we can replace a linear search
> with a binary search which provide a considerably speed-up.
> 
> This work was supported by a hardware donation from the CE Linux Forum.
> 
> Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>

Much better, I have no objection to this at all.

	Acked-by: Greg Kroah-Hartman <gregkh@suse.de>

Care to resend it without all the stuff above so someone (Rusty I guess)
can apply it?

thanks,

greg k-h
