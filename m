From: Greg KH <greg@kroah.com>
Subject: Re: module boot time (was Re: [PATCH] module: Use binary search in
 lookup_symbol())
Date: Wed, 18 May 2011 14:34:51 -0700
Message-ID: <20110518213451.GA23702@kroah.com>
References: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com>
 <1305665763-3988-1-git-send-email-abogani@kernel.org>
 <20110517232241.GA19140@kroah.com>
 <4DD305B3.3000707@am.sony.com>
 <20110518075428.GA29998@infradead.org>
 <4DD3FB1C.3040103@am.sony.com>
 <20110518192110.GB26945@kroah.com>
 <4DD435B7.9090702@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to; s=smtpout; bh=Iu3ahErF9uNMin1qWNEimpsikh4=; b=RXbMRbAFLUWwYhDAm02XwZfDG2X5Ro/zqmTuwovrFWdqNFxBG0QGc1pbOTPqi/+5lWufpmJ6eKNKD6uDDw0BBnTfTP3QQGHBUWn9tiawjaDBJA6/1gATwfUEQ9p/N1DKv0Im40jOwDWqquMrOEr/yckkUC6G9L/E5qc53Yy0RsQ=
Content-Disposition: inline
In-Reply-To: <4DD435B7.9090702@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>, Jeff Mahoney <jeffm@suse.de>
Cc: Christoph Hellwig <hch@infradead.org>, Alessio Igor Bogani <abogani@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>

On Wed, May 18, 2011 at 02:10:15PM -0700, Tim Bird wrote:
> >>> And why do people overly care for the load time?
> >>
> >> To reduce overall boot time.
> > 
> > To reduce it even more, build the modules into the kernel :)
> 
> That's what I do most of the time.  For some projects,
> it is useful to build certain things as modules so you can
> defer initializing them until later in the boot sequence.
> You can get some critical user-space tasks running, then
> come back later to initialize USB and other drivers.
> On cameras, it's not uncommon to want to get to user
> space in the first 500 milliseconds.

That's common even on desktops and servers, and using the bootchart code
in the kernel helps find those bottlenecks.

> Sony has some code which allows us to both statically link
> drivers and defer their initialization, but it's kind of
> kludgy and requires modifying the module declarations
> for the code you want to defer.  Let me know if you think
> this is worth doing an RFC about.

I don't think that's worth it, there has been talk, and some initial
code, about adding kernel modules to the kernel image itself, which
would solve a lot of the i/o time of loading modules, and solves some
other boot speed problems.  That work was done by Jeff Mahoney, but I
think he ran into some "interesting" linker issues and had to shelve it
due to a lack of time :(

thanks,

greg k-h
