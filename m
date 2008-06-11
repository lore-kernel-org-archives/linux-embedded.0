From: Adrian Bunk <bunk@kernel.org>
Subject: Re: mainlining min-configs...
Date: Wed, 11 Jun 2008 22:36:39 +0300
Message-ID: <20080611193639.GB2958@cs181133002.pp.htv.fi>
References: <48447615.5050806@am.sony.com> <20080610183004.GG11685@cs181133002.pp.htv.fi> <20080610185123.GA15838@uranus.ravnborg.org> <200806110009.22542.rob@landley.net> <20080611063921.GA27978@uranus.ravnborg.org> <48502304.1030304@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755782AbYFKThz@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48502304.1030304@am.sony.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Rob Landley <rob@landley.net>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Wed, Jun 11, 2008 at 12:09:56PM -0700, Tim Bird wrote:
> Sam Ravnborg wrote:
> >>> When I get my kconfig patchset polished you will be able to do:
> >>>
> >>> make K=my_mini_config allnoconfig
> >> So you're renaming KCONFIG_ALLNOCONFIG then?
> > 
> > Somehow yes. The K= notation I hope will see more use. Only very few
> > people know the KCONFIG_ALL*CONFIG= trick.
> 
> Indeed.  I had never heard of it, but it appears to have been
> around for at least 18 months.  It looks like Randy Dunlap tried
> to submit some documentation for this in Oct 2006, but it didn't
> make it in?
>...

Randy's patch that documents KCONFIG_ALLCONFIG is in Linus' tree since
April 2006.

>  -- Tim

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
