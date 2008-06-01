From: Rob Landley <rob@landley.net>
Subject: Re: Some embedded topics
Date: Sun, 1 Jun 2008 18:52:08 -0500
Message-ID: <200806011852.09909.rob@landley.net>
References: <483C83DE.3040604@cisco.com> <4840815E.9020002@am.sony.com> <20080530190423.67ac3139@vader.jdub.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080530190423.67ac3139@vader.jdub.homelinux.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Josh Boyer <jwboyer@gmail.com>
Cc: Tim Bird <tim.bird@am.sony.com>, vb <vb@vsbe.com>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org

On Friday 30 May 2008 19:04:23 Josh Boyer wrote:
> > I'm not sure, however, that the buffers are pushed to user-space,
> > through the daemon, and back to the file system in an expedient manner.
> > I agree it might be worth a look for this use case.  We use it at
> > Sony quite a bit and it's valuable.
>
> With a little bit of work, you could have it trace into a circular
> buffer in DRAM.  Then you can preserve that via mem= reservations,
> etc.

At this point, I feel the need to remind people of the time Linus Torvalds got 
a mac mini, tried to get software suspend working on it, and wound up using 
the RTC as a debug register to tell him where it hung/rebooted:

Thread starts here:
https://lists.linux-foundation.org/pipermail/linux-pm/2006-June/008465.html

A few interesting posts in the thread:
https://lists.linux-foundation.org/pipermail/linux-pm/2006-June/008470.html
https://lists.linux-foundation.org/pipermail/linux-pm/2006-June/008475.html
https://lists.linux-foundation.org/pipermail/linux-pm/2006-June/008491.html

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
