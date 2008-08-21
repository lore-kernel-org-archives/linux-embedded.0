From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Adding a new platform
Date: Thu, 21 Aug 2008 09:40:39 +0100
Message-ID: <1219308039.2988.242.camel@pmac.infradead.org>
References: <48AB0A7A.8040209@cisco.com>
	 <7d1d9c250808192129j3fb7ef28p8f404c6affd82078@mail.gmail.com>
	 <f608b67d0808192215q5b8ffbf0w70531c31cdd66bcd@mail.gmail.com>
	 <200808211502.58206.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200808211502.58206.manningc2@actrix.gen.nz>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Charles Manning <manningc2@actrix.gen.nz>
Cc: vb <vb@vsbe.com>, Paul Gortmaker <paul.gortmaker@gmail.com>, Linux Embedded Maillist <linux-embedded@vger.kernel.org>, corbet@lwn.net

On Thu, 2008-08-21 at 15:02 +1200, Charles Manning wrote:
> 
> In-tree is no silver bullet.
> 
> When people modify internal APIs they will likely fix anything that breaks 
> compilation. However many things are more subtle than that and it is very 
> easy to end up with a driver or other code that compiles but does not work 
> properly.
> 
> Luckily APIs for drivers (the most common stuff that people work on) don't 
> change that much, and the interfaces are reasonably clear. If you want some 
> hell then try working on file systems :-).

File systems show an excellent example of why you're wrong, in fact. The
API for file systems changes quite a lot, and the people who make those
changes do tend to fix up all the in-tree file systems simultaneously,
-- and since they're doing it with a full understanding of the
implications of the change they're making, they usually manage to get
the change _right_.

I find it's more common to introduce subtle errors when the person
modifying the core API _hasn't_ also modified the driver/fs code which
uses that API. Which is what happens when you have out-of-tree code.

I'd rather remove my gonads with a rusty spoon than maintain an
out-of-tree file system.

-- 
dwmw2
