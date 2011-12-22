From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: RFC: android logger feedback request
Date: Wed, 21 Dec 2011 18:14:07 -0800
Message-ID: <4EF2926F.1080403@am.sony.com>
References: <4EF264C3.6000104@am.sony.com>	<20111221231956.GB23859@suse.de>	<4EF27B85.9080801@am.sony.com> <20111222122026.3a0fae36@notabene.brown>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111222122026.3a0fae36@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: NeilBrown <neilb@suse.de>
Cc: Greg KH <gregkh@suse.de>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, john stultz <johnstul@us.ibm.com>, Brian Swetland <swetland@google.com>, Kay Sievers <kay.sievers@vrfy.org>, Lennart Poettering <lennart@poettering.net>

On 12/21/2011 05:20 PM, NeilBrown wrote:
> It is certainly nice and simple.  It really looks more like a filesystem than
> a char device though...  though they aren't really files so much as lossy
> pipes.  I don't think that's a problem though, lots of things in filesystems
> don't behave exactly like files.
> 
> If you created a 'logbuf' filesystem that used libfs to provide a single
> directory in which privileged processes could create files then you wouldn't
> need the kernel to "know" the allowed logs: radio, events, main, system.
> The size could be set by ftruncate() (by privileged used again) rather than
> being hardcoded.
> 
> You would defined 'read' and 'write' much like you currently do to create a list of
> datagrams in a circular buffer and replace the ioctls by more standard
> interfaces:
> 
> LOGGER_GET_LOG_BUG_SIZE would use 'stat' and the st_blocks field
> LOGGER_GET_LOG_LEN would use 'stat' and the st_size field
> LOGGER_GET_NEXT_ENTRY_LEN could use the FIONREAD ioctl
> LOGGER_FLUSH_LOG could use ftruncate
> 
> The result would be much the same amount of code, but an interface which has
> fewer details hard-coded and is generally more versatile and accessible.

This is a very interesting suggestion.  I think it would be good to
create a prototype of this and see how it affects the user-space code
as well as what the kernel-side issues would be (and to check whether
this would change any of the current logger semantics).

It would also have the side effect of allowing runtime modification of
the buffer size, though I'm not sure whether that's useful or not.

Thanks!
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================
