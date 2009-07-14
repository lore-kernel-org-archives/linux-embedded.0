From: David McCullough <David_Mccullough@securecomputing.com>
Subject: Re: syslog for embedded
Date: Tue, 14 Jul 2009 20:48:52 +1000
Message-ID: <20090714104852.GA15488@securecomputing.com>
References: <4A5C576B.4040203@gmail.com> <e4c675870907140323x7e9846d3hb09a89fda239b984@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e4c675870907140323x7e9846d3hb09a89fda239b984@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Cc: zaphod001@gmail.com, linux-embedded@vger.kernel.org


Jivin Roberto A. Foglietta lays it down ...
> 2009/7/14 Zaphod <zaphod001@gmail.com>:
> > Hi All,
> >
> > i am trying to find good syslog suitable for embedded.
> > Means,
> > 1. no use of dynamic allocations
> > 2. small footprint
> > 3. redirection to multiple destination (number of IPs, file, console)
> >
> > Thanks everyone for help.
> 
>  AFAIK busbox syslogd miss the 3rd requirement. If any other existing
> syslog still miss at least one of the requirements  then upgrading
> busybox with the network support would be a viable solution.

The version of busybox that is included in the uClinux-dist:

	http://www.uclinux.org/pub/uClinux/dist/

has extensions to do most if not all of 3.  I can't recall how much of
that functionality has made it back upstream.

You can have a peek at a much older version of uCLinux-dist at:

	http://cvs.uclinux.org/cgi-bin/cvsweb.cgi/uClinux-dist/user/busybox/

might save the big download,

Cheers,
Davidm

-- 
David McCullough,  david_mccullough@securecomputing.com,  Ph:+61 734352815
McAfee - SnapGear  http://www.snapgear.com                http://www.uCdot.org
