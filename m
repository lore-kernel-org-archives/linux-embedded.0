From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch] Wait for console to become available, ver 3
Date: Mon, 20 Apr 2009 15:35:00 -0700
Message-ID: <20090420223500.GB11068@cuplxvomd02.corp.sa.net>
References: <20090420143010.697c7380.akpm@linux-foundation.org> <Pine.LNX.4.44L0.0904201744410.6832-100000@iolanthe.rowland.org> <20090420151400.11afd62a.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090420151400.11afd62a.akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1671; t=1240266901; x=1241130901;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org;
	z=From:=20David=20VomLehn=20<dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
	|Subject:=20Re=3A=20[Patch]=20Wait=20for=20console=20to=20b
	ecome=20available,=20ver=203
	|Sender:=20;
	bh=RYElkUTvUGLTuRmTF58OClSPzvURN6+g29568ge08nE=;
	b=NFSl/aXhNlp446CnO0kQdjYbOFDi9bf5wAQlItiDtbtucRmfoaKOEo8e8i
	EkOU0ulAMizgJM0jZVMzMqZWKbiL1uesQMQFnOf5GxzS37N3bXjaAdsGVUVg
	O8F+1lvBqe;
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Apr 20, 2009 at 03:14:00PM -0700, Andrew Morton wrote:
> On Mon, 20 Apr 2009 17:51:16 -0400 (EDT)
> Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
...
> > What if a subsystem simply doesn't know in advance whether or not it's 
> > going to register a console?  Or doesn't know when it has finished 
> > probing all devices (since a new device could be plugged in at any 
> > time)?
> 
> Fix it.  It's trivial to make a sub-driver call back into a higher
> layer to tell it that it registered a console.  Or just do the
> i_will_be_adding_a_console_soon()/oops_im_not_adding_a_console_after_all()
> calls from the layer which _does_ know.

In the case of the console, we already have register_console(), which is
what I'm using. I think your proposal will require adding code all over
the place. And buses such as USB simply have no way of knowing whether they
are done enumerating devices. A new device could take hours to come on line.

> Yes, a boot parameter is "simple" to inplement.  But it's ghastly from
> a usability POV.  Especially if you care about boot times.  For how
> long do you delay?  The user has to experiment with different delays
> until he finds the magic number.  Then he adds 10% and waits for the
> inevitable failure reports to come in.
> 
> It's much better to just get it right, even if that makes it more
> "complex".

With USB, you just can't *ever* get it right. There is no limit on how
long a device has to tell you its there. I wish this weren't the case,
but our good friends in the USB world tell us that we have been lucky
to have had USB consoles work as long as they have.
--
David VomLehn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
