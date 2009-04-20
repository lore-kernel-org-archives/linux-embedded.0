From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [Patch] Wait for console to become available, ver 3
Date: Mon, 20 Apr 2009 15:14:00 -0700
Message-ID: <20090420151400.11afd62a.akpm@linux-foundation.org>
References: <20090420143010.697c7380.akpm@linux-foundation.org>
	<Pine.LNX.4.44L0.0904201744410.6832-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.0904201744410.6832-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, 20 Apr 2009 17:51:16 -0400 (EDT)
Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:

> On Mon, 20 Apr 2009, Andrew Morton wrote:
> 
> > If we want b) then how to do it?
> > 
> > One possibility: the initcalls have been completed when init_post() is
> > called.  How about: if one of those initcalls will be asynchronously
> > registering a console, it should inform the console layer about this. 
> > It should call the new i_will_be_adding_a_console_soon() function
> > within its initcall.  The console subsystem will remember this, and we
> > can cause init_post() to block until that registration has occurred.
> > 
> > We'll need to be able to handle errors, and we'll need to be able to
> > handle the case where the initcall function isn't sure whether or not
> > it will be registering a console.  So there will also need to be an
> > oops_im_not_adding_a_console_after_all() function, which will withdraw
> > the effects of i_will_be_adding_a_console_soon().
> > 
> > Which means that i_will_be_adding_a_console_soon() will need to return
> > a handle for the oops_im_not_adding_a_console_after_all() caller to
> > pass.
> > 
> > If init_post() is currently blocked awaiting the arrival of the
> > console, oops_im_not_adding_a_console_after_all() will unblock
> > init_post() if there are no more potential console registrations
> > pending, and inti_post()'s attempt to open a console will fail.
> > 
> > 
> > Or something like that?
> 
> What if a subsystem simply doesn't know in advance whether or not it's 
> going to register a console?  Or doesn't know when it has finished 
> probing all devices (since a new device could be plugged in at any 
> time)?

Fix it.  It's trivial to make a sub-driver call back into a higher
layer to tell it that it registered a console.  Or just do the
i_will_be_adding_a_console_soon()/oops_im_not_adding_a_console_after_all()
calls from the layer which _does_ know.

> Not to mention that this scheme appears more complicated than the one 
> it's intended to replace... although it doesn't have any boot-line 
> parameters.

It isn't very complicated.

Yes, a boot parameter is "simple" to inplement.  But it's ghastly from
a usability POV.  Especially if you care about boot times.  For how
long do you delay?  The user has to experiment with different delays
until he finds the magic number.  Then he adds 10% and waits for the
inevitable failure reports to come in.

It's much better to just get it right, even if that makes it more
"complex".


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
