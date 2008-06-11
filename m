From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: mainlining min-configs...
Date: Wed, 11 Jun 2008 08:39:21 +0200
Message-ID: <20080611063921.GA27978@uranus.ravnborg.org>
References: <48447615.5050806@am.sony.com> <20080610183004.GG11685@cs181133002.pp.htv.fi> <20080610185123.GA15838@uranus.ravnborg.org> <200806110009.22542.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806110009.22542.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Adrian Bunk <bunk@kernel.org>, Tim Bird <tim.bird@am.sony.com>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

> >
> > When I get my kconfig patchset polished you will be able to do:
> >
> > make K=my_mini_config allnoconfig
> 
> So you're renaming KCONFIG_ALLNOCONFIG then?

Somehow yes. The K= notation I hope will see more use. Only very few
people know the KCONFIG_ALL*CONFIG= trick.

> 
> > Thus selecting 'no' for all new symbols in an automated fashion.
> > I know that in a few cases 'no' is the wrong answer but in the
> > 99% of the cases 'no' is perfectly valid.
> 
> For a "make miniconfig", warnings should be errors.  (Attempts to set unknown 
> symbols are an error with a miniconfig, the operation should exit with a 
> nonzero error code.)  Also, all the stuff allnoconfig puts to stdout 
> shouldn't be there for miniconfig, only the stuff it writes to stderr right 
> now should show up.

My reference was to a minimal config of a system - not to a miniconfig
as your patcset produces. Just to make it clear.

The patchset I refer will also reduce the nosie generated during make *config.

	Sam
