From: Daniel Walker <dwalker@mvista.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk
	output for crash logging
Date: Fri, 08 Aug 2008 09:17:46 -0700
Message-ID: <1218212266.19162.149.camel@localhost.localdomain>
References: <489BAD5C.2080009@cisco.com>
	 <1218210904.19162.144.camel@localhost.localdomain>
	 <8bd0f97a0808080905u1b515556gd68c2ba1d0b47cb4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0808080905u1b515556gd68c2ba1d0b47cb4@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: dvomlehn@cisco.com, linux-embedded@vger.kernel.org

On Fri, 2008-08-08 at 12:05 -0400, Mike Frysinger wrote:
> On Fri, Aug 8, 2008 at 11:55 AM, Daniel Walker wrote:
> > Another note, usually when submitting new interfaces like this you
> > should also submit the code that uses the interface .. In your case you
> > might not be able to do that, but it could never be accepted without at
> > least one user.
> 
> i really doubt that.  lack of existing tangible users makes it a
> harder case, but it certainly is not a "never" case.  there is plenty
> of examples in the tree where things were merged without any users and
> the commit wouldnt be immediately leveraged.


Well, I did say "usually" .. I invite you to give some of the "plenty of
examples in the tree", you might surprise me..

Daniel
