From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 21:10:59 +0100
Message-ID: <20090103201059.GA4875@uranus.ravnborg.org>
References: <200901020207.30359.rob@landley.net> <200901020513.19593.rob@landley.net> <495E3AF8.6000006@parrot.com> <200901031346.01325.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932661AbZACUJh@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200901031346.01325.rob@landley.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>

> 
> I'll fix this and resubmit, it just wasn't ready last night.  (If the merge 
> window is closing soon I could resubmit the other two with Sam's suggestions 
> and resubmit this one next time 'round, but it was only a couple days to write 
> in the first place, once I finally figured out what the perl version was 
> trying to _do_...)

For kbuild only fixes and trivial stuff will be merged until next merge window.
Neither of the three patches fall into that category.

With respect to your three patches the plan is to:
- add the updated timeconst patch to kbuild-next
- add the updated cpu-feature patch to kbuild-next

- the patch touching headers_install will not be merged.
  The way forward for headers_install is to combine the
  unifdef feature and the header modifications.
  And this must be in a single program that can process
  all headers in one go so the install process becomes so fast
  that we do not worry about if it was done before or not.
  Then we can avoid all the .* files in the directory
  where we isntall the headers.
  The program is a prime candidate for a small C program
  and I hope someone can take the challenge to write it.

  Migrating from perl to shell does not help us here
  and the shell version was less readable than the perl version.

	Sam
