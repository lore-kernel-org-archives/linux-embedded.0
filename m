From: Marc Andre Tanner <mat@brain-dump.org>
Subject: Re: [PATCH 7/7] printk: provide a filtering macro for printk
Date: Wed, 2 Sep 2009 15:09:43 +0200
Message-ID: <20090902130943.GE2736@debbook.brain-dump.org>
References: <1251844269-12394-1-git-send-email-mat@brain-dump.org>
 <1251844269-12394-8-git-send-email-mat@brain-dump.org>
 <4A9DAD2B.3080909@am.sony.com>
 <BD79186B4FD85F4B8E60E381CAEE190901C55CD3@mi8nycmail19.Mi8.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901C55CD3@mi8nycmail19.Mi8.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: H Hartley Sweeten <hartleys@visionengravers.com>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded@vger.kernel.org

On Tue, Sep 01, 2009 at 07:32:25PM -0400, H Hartley Sweeten wrote:
> On Tuesday, September 01, 2009 4:24 PM, Tim Bird wrote:
> > Some places in the kernel break the message into pieces, like so:
> >
> > printk(KERN_ERR, "Error: first part ");
> > ...
> > printk(" more info for error.\n");
> 
> Technically, shouldn't the second part of the message actually be:
> 
> printk(KERN_CONT " more info for error.\n");
> 
> Maybe some mechanism could be created to handle the continued message
> if they have the KERN_CONT?

Yes it's true that KERN_CONT isn't handled correctly, but I don't see a way
to change that.

> > These parts would not be handled consistently under certain
> > conditions.
> >
> > It would be confusing to see only part of the message,
> > but I don't know how often this construct is used.  

$ grep -R KERN_CONT linux-2.6 | wc -l
373

> > Maybe
> > another mechanism is needed to ensure that continuation
> > printk lines have the same log level as their start strings.

I currently don't see a way to achieve this with the CPP.

> > But, overall, very slick!  It's nice to see a solution that doesn't
> > require changing all printks statements in the kernel.

Yes that's what I thought too. Thanks to the comments so far the next 
version of the patch will contain even less changes to the rest of the 
kernel.
 
> I haven't looked over this patch series yet but does it work with the
> pr_<level> macros (pr_info, pr_err, etc.)?

It should work, yes.

Regards,
Marc

-- 
 Marc Andre Tanner >< http://www.brain-dump.org/ >< GPG key: CF7D56C0
