From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/5] RFC: KBUS messaging subsystem
Date: Mon, 28 Feb 2011 00:48:59 -0700
Message-ID: <20110228074859.GE7855@angua.secretlab.ca>
References: <cover.1298829754.git.tibs@tonyibbs.co.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1298829754.git.tibs@tonyibbs.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Ibbs <tibs@tonyibbs.co.uk>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>

On Sun, Feb 27, 2011 at 06:11:43PM +0000, Tony Ibbs wrote:
> KBUS is a lightweight, Linux kernel mediated, message system,
> particularly intended for use in embedded environments.
> 
> It is meant to be simple to use and understand. It is designed to
> provide predictable message delivery, deterministic message ordering,
> and a guaranteed reply for each request.
> 
> It is especially aimed at situations where existing solutions,
> such as DBUS, cannot be used, typically because of system constraints.
> 
> We have various customers using KBUS in real life, and believe it to
> be useful. I had a showcase table for KBUS at the ELCE in Cambridge,
> October last year, and there seemed to be interest.
> 
> I am hoping to get a response from this list before attempting to send
> to the kernel list, since I believe this list should contain people
> who might be most interested in using it.

Just go ahead and post to lkml.  There isn't a whole lot of point in
holding back from there, and that is the only way you'll get the level
of review that you need to even be considered for merging.

g.
