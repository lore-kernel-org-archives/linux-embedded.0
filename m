From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: mainlining min-configs...
Date: Wed, 11 Jun 2008 12:09:56 -0700
Message-ID: <48502304.1030304@am.sony.com>
References: <48447615.5050806@am.sony.com> <20080610183004.GG11685@cs181133002.pp.htv.fi> <20080610185123.GA15838@uranus.ravnborg.org> <200806110009.22542.rob@landley.net> <20080611063921.GA27978@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080611063921.GA27978@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Landley <rob@landley.net>, Adrian Bunk <bunk@kernel.org>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Sam Ravnborg wrote:
>>> When I get my kconfig patchset polished you will be able to do:
>>>
>>> make K=my_mini_config allnoconfig
>> So you're renaming KCONFIG_ALLNOCONFIG then?
> 
> Somehow yes. The K= notation I hope will see more use. Only very few
> people know the KCONFIG_ALL*CONFIG= trick.

Indeed.  I had never heard of it, but it appears to have been
around for at least 18 months.  It looks like Randy Dunlap tried
to submit some documentation for this in Oct 2006, but it didn't
make it in?

Is this feature widely used?  Should it be doc'ed now
or are you about to make it obsolete?
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

