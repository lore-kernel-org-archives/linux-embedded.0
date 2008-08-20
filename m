From: "Paul Gortmaker" <paul.gortmaker@gmail.com>
Subject: Re: Adding a new platform
Date: Tue, 19 Aug 2008 23:19:06 -0400
Message-ID: <7d1d9c250808192019g6ec73ec7x53563b8ad2130df@mail.gmail.com>
References: <48AB0A7A.8040209@cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=lTZijuCVnR909uU0j1pOSYcvFEKX808/DZcOx/yDhKw=;
        b=eJxxGow9kGRwKDCQwY0O1FJv/qgmrzWH7FAWMLfXRp9qsQ6r0vIdKFVHy2f4HB7WlC
         2s5/BqzrBfZITZ8JxLP0uw8Q0e3vH5qIt1+62tcDjLFsyhKZM46wa3m0tFczw9YlP1CM
         Mbo8dCtkyS/eNn6kRqujL5YEHPPNMEv8eKYVE=
In-Reply-To: <48AB0A7A.8040209@cisco.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux Embedded Maillist <linux-embedded@vger.kernel.org>, corbet@lwn.net

On Tue, Aug 19, 2008 at 2:01 PM, David VomLehn <dvomlehn@cisco.com> wrote:
> I'm working to educate our management on the need to get our platform in the
> kernel mainline. I expect I will be asked to tell them how much work this
> is. What do we need to do to add a new MIPS platform?

Based on the phrase "educate our management"  -- I would strongly suggest you
have a look at Jonathan Corbet's document that describes the process and the
eventual value-add of having things in-kernel -- with an audience of non-kernel
hackers in mind.  I think this will really assist you in your efforts,
and I'm glad that
Jonathan put the time into this that he did.

His original post can be viewed here:

http://lkml.org/lkml/2008/7/29/363

or here:

http://lwn.net/Articles/291967/

Paul.

> --
> David VomLehn
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
