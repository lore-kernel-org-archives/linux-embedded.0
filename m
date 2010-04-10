From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: A better way to sequence driver initialization?
Date: Sat, 10 Apr 2010 18:53:17 +1000
Message-ID: <1270889597.6865.107.camel@pasglop>
References: <4BBF7E9C.80604@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4BBF7E9C.80604@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Fri, 2010-04-09 at 14:23 -0500, Bill Gatliff wrote:
> 
> My recent post, "Requesting a GPIO that hasn't been registered yet", and
> Anton's reply thereto (thanks, Anton!) on linuxppc-dev got me thinking
> about the problem of dependencies between devices in different  classes,
> and/or between drivers/devices in general.  I'd like to float an idea to
> see if it's worth pursuing. 

I'd rather do things a bit more explicitely and less prone to break
existing stuff... something along the lines of, first defining a variant
of the initcalls to enable that "multithreaded" stuff, along with an
explicit wait_for_service("subsys:hid"); for example.

One could also expose service deps via the module info, thus delaying
module init, or things like that (in fact, initcalls could even come
with a list of dependencies).

Cheers,
Ben.
