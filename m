From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 09:52:14 -0700
Message-ID: <20090421165214.GB8251@cuplxvomd02.corp.sa.net>
References: <20090421140533.GA6375@shareable.org> <Pine.LNX.4.44L0.0904211026080.2981-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.0904211026080.2981-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=985; t=1240332747; x=1241196747;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org;
	z=From:=20David=20VomLehn=20<dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
	|Subject:=20Re=3A=20Wait=20for=20console=20to=20become=20av
	ailable,=20v3.2
	|Sender:=20;
	bh=uS3sgLZxNp/7Srb3g7XTgX38Rs23Ws6S2MExB+A2ghk=;
	b=ZZ2XL6+aJqtNDsNvpEcIImiGnwSa/xWXsJVSDKScZGHBbwQ6Dm0oWyHY7p
	xyrb2vTYvhGuLDWsyB7AxgeerqDHRgZsF2l49mmdu6pNfioTDWQ45LPBtizA
	iV0VKaWhRm;
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Arjan van de Ven <arjan-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Embedded Mailing List <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

> If somebody would like to suggest a programming interface (a waitqueue 
> perhaps?) by which the USB hub driver could send a notification when it 
> becomes idle, I could implement it.

I actually started the USB console stuff with exactly this approach, but
switched to the approach that's out there. A minor drawback, which is
probably obvious, is that you actually wait for some interval without
getting anything to do before you think things are idle.  But a bigger
drawback is that you lose the ability to chose appropriate intervals for
different classes of devices.

So far, there appear to be three possible USB boot devices: consoles, network
devices, and boot devices. A system may not have all of these and so may not
need to wait as long as a system with all of them. One of my goals is to
preserve as much of the reduction in boot time as possible, even on systems
that use USB devices that may or may not be plugged in.

> Alan Stern

David VomLehn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
