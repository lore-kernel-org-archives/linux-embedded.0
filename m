From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Sun, 4 Jan 2009 00:43:08 -0600
Message-ID: <200901040043.08577.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901031936.04642.rob@landley.net> <25035.1231045675@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <25035.1231045675@turing-police.cc.vt.edu>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Ingo Oeser <ioe-lkml@rameria.de>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Saturday 03 January 2009 23:07:55 Valdis.Kletnieks@vt.edu wrote:
> On Sat, 03 Jan 2009 19:36:04 CST, Rob Landley said:
> > On Saturday 03 January 2009 06:28:22 Ingo Oeser wrote:
> > > > +for i in "MSEC 1000" "USEC 1000000"
> > > > +do
> > > > +	NAME=$(echo $i | awk '{print $1}')
> > >
> > > cut -d' ' -f1  does the same
> > >
> > > > +	PERIOD=$(echo $i | awk '{print $2}')
> > >
> > > cut -d' ' -f2  does the same
>
> Close, but no cee-gar.  cut does something counter-intuitive with multiple
> blanks:

Yes, but in this case I'm the one passing in the data so I know there aren't 
multiple blanks.  (Or tabs instead of spaces.)

In a private email, Bernd Petrovitsch suggested "set -- $i" and then using 
NAME=$1; PERIOD=$2.  (I keep getting private email responses to these sort of 
threads, and then getting dismissed as the only one who cares about the issue.  
Less so this time around, but still...)  This apparently works all the way 
back to the bourne shell.  Not worth rolling another patch for, but if I do 
wind up rolling another patch for other reasons I might switch over to that.  
Both "cut" and "awk" are susv3, though.

Rob
