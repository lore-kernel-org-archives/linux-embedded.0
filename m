From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Tue, 17 Nov 2009 09:53:17 -0700
Message-ID: <200911170853.17994.david-b@pacbell.net>
References: <cover.1224093510.git.bgat@billgatliff.com> <200911162347.02364.david-b@pacbell.net> <4B02C5CF.2050102@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B02C5CF.2050102@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Mike Frysinger <vapier.adi@gmail.com>, linux-embedded@vger.kernel.org

On Tuesday 17 November 2009, Bill Gatliff wrote:
> David Brownell wrote:
> >
> > It'd be purely for pinmux.
> >   
> 
> Ugh.  That would be a tough interface to design.

True.  That's part of why I object to wanting to combine
it with GPIOs ... or, combine everything else with GPIOs
too (like PWMs).

But Grant talks about wanting such things, and if he can
deliver it, more power to him.
 

> It makes me think of 
> an old-time telephone switchboard, with an undefined number of wires and
> an equally-undefined number of plugs to insert them into.
> 
> "Good morning, Mabel!  Give me SCL1 on AA25 please!  No, I don't know
> who SCL1 is nor where AA25 is.  I'll be waiting."

"What?  You're saying that I've got to take three other connections
at the same time?  And cut these other two calls?  No, I only wanted
to make that one call ..."


> 
> 
> :)
> 
> 
> 

