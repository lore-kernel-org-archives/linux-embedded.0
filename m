From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Thu, 31 Jul 2008 13:37:39 -0700
Message-ID: <48922293.9020007@am.sony.com>
References: <20080731092703.661994657@free-electrons.com> <20080731093220.969460336@free-electrons.com> <20080731135319.GA20212@cs181140183.pp.htv.fi> <20080731162007.285938e0@surf> <20080731153757.GB20212@cs181140183.pp.htv.fi> <20080731182616.4c20f0db@surf> <20080731164918.GE20212@cs181140183.pp.htv.fi> <4891F724.3030406@am.sony.com> <20080731191650.GA23516@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080731191650.GA23516@cs181140183.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, matthew@wil.cx, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org

Adrian Bunk wrote:
> On Thu, Jul 31, 2008 at 10:32:20AM -0700, Tim Bird wrote:
>> If warnings or support avoidance for the general population using
>> such config options is the issue, I think that David Woodhouse's
>> suggestion that such things could taint the kernel is an interesting
>> idea. Maybe have we could have an "unsafe-config" taint flag?
> 
> A CONFIG_EMBEDDED=y flag?

If this is sufficient, it works for me!

> It's not only about limits, I also have a general dislike for the
> "add more config options" approach.
> 
> I get your point why it brings advantages in some cases, but if you are 
> looking for a cheerleader it won't be me.  ;-)

Understood.  I promise not to send you any pom-poms. ;-)
 -- Tim


=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
