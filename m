From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Kernel crashing and log buffers...
Date: Thu, 11 Jun 2009 12:35:58 -0700
Message-ID: <20090611193558.GA16610@cuplxvomd02.corp.sa.net>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <20090611175303.GA10058@cuplxvomd02.corp.sa.net> <200906111452.39210.rgetz@blackfin.uclinux.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200906111452.39210.rgetz@blackfin.uclinux.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=2420; t=1244748958; x=1245612958;
	c=relaxed/simple; s=sjdkim3002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Kernel=20crashing=20and=20log=20buffers
	...
	|Sender:=20;
	bh=+fMDeOeNXJtebwBLoNN3YxtcwKYyHNnVGXlsDiOE49A=;
	b=FytdZ9A7i2Zh1hplpMnqsHoZchxwO0KOnQC4T+uSnv1jOGnoodGm3rqJ09
	yl2lMrs2GEe4OLR4N6HIHHkqEoykhQKbzub0e5wQUhPhVq2vZGxh4KvmKzaD
	LQ5a7WxAOV;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Getz <rgetz@blackfin.uclinux.org>
Cc: Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>, Hariprasad Nellitheertha <hari@in.ibm.com>

On Thu, Jun 11, 2009 at 02:52:38PM -0400, Robin Getz wrote:
> On Thu 11 Jun 2009 13:53, David VomLehn pondered:
> > On Wed, Jun 10, 2009 at 09:26:40PM -0400, Robin Getz wrote:
...
> > Our kernel does crash, so we have to do this. I had submitted a patch a
> > while ago that tweaks emit_log_char, but this was bounced, reasonably,
> > because it would be interferring with the great majority of people who
> > are not interested in capturing log output. The suggestion was made that
> > we do this with a console driver. I've recently got a version working,
> > as a module, but I've only started testing of the version integrated 
> > into the kernel tree.  Still, post early, post often, so I've appended 
> > a version of the patch here to see if this seems to be the right 
> > direction. 
> 
> Yeah - it looks like n people have done this n ways. 
> 
> I think even Andrew M had mentioned that he had done something in a past 
> embedded life.

It ain't hard, but I think we need a common implementation to go into the
kernel.

> I think what you have would do what I need it to do - I'm not so sure about 
> what Wolfgang/Grant had in mind (- since they wanted also to dump buffers 
> from the bootloader into the console for syslog processing)...

This is definitely different what what Wolfgang/Grant had in mind.

> > Regardless whether my particular patch seems like the right way to do
> > this, we do need to solve this problem for the embedded world. It is
> > one of the few areas where we have needs not shared by the rest of
> > the kernel community.
> 
> I'm not so sure - googling for things last night led me to this:
> 
> http://www.faqs.org/patents/app/20090044051
> EXTRACTING LOG AND TRACE BUFFERS IN THE EVENT OF SYSTEM CRASHES
> Hariprasad V. Nellitheertha  - Linux Technology Center, India Software Labs, 
> IBM India.
> 
> So - I think as Paul stated in a previous conversation - the high availability 
> needs of servers are similar to the high availability needs of embedded...

This is also different as it involves continuous logging of system state
rather than producing crash logs. The continuous logging is definitely of
wider interest. I did some work a couple of years ago to see what
it would take to specify the buffer for LTT FDR data, though this work was
dropped as lower priority, and I never got back to it.

> -Robin

David
