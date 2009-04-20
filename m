From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [Patch] Wait for console to become available, ver 3
Date: Mon, 20 Apr 2009 17:51:16 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0904201744410.6832-100000@iolanthe.rowland.org>
References: <20090420143010.697c7380.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090420143010.697c7380.akpm@linux-foundation.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David VomLehn <dvomlehn@cisco.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-usb@vger.kernel.org

On Mon, 20 Apr 2009, Andrew Morton wrote:

> If we want b) then how to do it?
> 
> One possibility: the initcalls have been completed when init_post() is
> called.  How about: if one of those initcalls will be asynchronously
> registering a console, it should inform the console layer about this. 
> It should call the new i_will_be_adding_a_console_soon() function
> within its initcall.  The console subsystem will remember this, and we
> can cause init_post() to block until that registration has occurred.
> 
> We'll need to be able to handle errors, and we'll need to be able to
> handle the case where the initcall function isn't sure whether or not
> it will be registering a console.  So there will also need to be an
> oops_im_not_adding_a_console_after_all() function, which will withdraw
> the effects of i_will_be_adding_a_console_soon().
> 
> Which means that i_will_be_adding_a_console_soon() will need to return
> a handle for the oops_im_not_adding_a_console_after_all() caller to
> pass.
> 
> If init_post() is currently blocked awaiting the arrival of the
> console, oops_im_not_adding_a_console_after_all() will unblock
> init_post() if there are no more potential console registrations
> pending, and inti_post()'s attempt to open a console will fail.
> 
> 
> Or something like that?

What if a subsystem simply doesn't know in advance whether or not it's 
going to register a console?  Or doesn't know when it has finished 
probing all devices (since a new device could be plugged in at any 
time)?

Not to mention that this scheme appears more complicated than the one 
it's intended to replace... although it doesn't have any boot-line 
parameters.

Personally, I'm in favor of adding a boot parameter.  Things could be 
simplified slightly by treating a negative value (or a missing value) 
as indicating an infinite timeout; then only one new parameter would be 
needed instead of two.

Alan Stern
