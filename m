From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Sat, 3 Jan 2009 19:36:04 -0600
Message-ID: <200901031936.04642.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901020213.30658.rob@landley.net> <200901031328.23079.ioe-lkml@rameria.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901031328.23079.ioe-lkml@rameria.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Oeser <ioe-lkml@rameria.de>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Saturday 03 January 2009 06:28:22 Ingo Oeser wrote:
> > +for i in "MSEC 1000" "USEC 1000000"
> > +do
> > +	NAME=$(echo $i | awk '{print $1}')
>
> cut -d' ' -f1  does the same
>
> > +	PERIOD=$(echo $i | awk '{print $2}')
>
> cut -d' ' -f2  does the same

From a standards perspective 
http://www.opengroup.org/onlinepubs/9699919799/utilities/cut.html vs 
http://www.opengroup.org/onlinepubs/9699919799/utilities/awk.html is probably 
a wash, but from a simplicity perspective using the tool that _isn't_ its own 
programming language is probably a win. :)

I made the change in the second round of patches I just posted.

Thanks,

Rob
