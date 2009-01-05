From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with
	kernel/timeconst.sh
Date: Mon, 05 Jan 2009 13:29:11 +0100
Message-ID: <1231158551.3326.82.camel@gimli.at.home>
References: <200901020207.30359.rob@landley.net>
	 <20090104221356.GA32357@shareable.org>
	 <1231114530.3310.6.camel@gimli.at.home>
	 <200901042250.36847.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754116AbZAEMab@vger.kernel.org>
In-Reply-To: <200901042250.36847.rob@landley.net>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Jamie Lokier <jamie@shareable.org>, Valdis.Kletnieks@vt.edu, Ingo Oeser <ioe-lkml@rameria.de>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Son, 2009-01-04 at 22:50 -0600, Rob Landley wrote:
> On Sunday 04 January 2009 18:15:30 Bernd Petrovitsch wrote:
[...]
> > ACK. A bash can IMHO be expected. Even going for `dash` is IMHO somewhat
> > too extreme.
> 
> I have yet to encounter a system that uses dash _without_ bash.  (All ubuntu 

Hmm, should be doable with a chroot environment quite cheap and simple.

> variants, even jeos, install bash by default.  They moved the /bin/sh symlink 

Yes, I know (small) embedded systems that have a bash (and not "only"
one of busybox shells). It eases writing somewhat fast shell scripts
without the need for lots of fork()s+exec()s too .....

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services
