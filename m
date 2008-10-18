From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Power cut in management
Date: Sat, 18 Oct 2008 13:56:22 +0100
Message-ID: <20081018125621.GA30391@shareable.org>
References: <4917.79.37.233.237.1224328849.squirrel@nausicaa2.coritel.it> <20081018114910.GA29345@shareable.org> <1224331493.6770.1360.camel@macbook.infradead.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1224331493.6770.1360.camel@macbook.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: marco.stornelli@coritel.it, linux-embedded@vger.kernel.org

David Woodhouse wrote:
> On Sat, 2008-10-18 at 12:49 +0100, Jamie Lokier wrote:
> > Can you use a journalling filesystem like ext3, reiserfs, xfs, or even
> > UBIFS on the card, or does it have to be FAT?  With a journalling
> > filesystem, they vary on the details but basically if you can finish
> > the current write request in progress, there's no fs-level corruption.
> 
> Careful. When you use a solid state "disk", you're actually using your
> file system on top of an underlying "pseudo-filesystem" which makes the
> flash pretend to be a disk. Your data are at the mercy of that
> underlying code, which in our past experience always seem to have been
> implemented by the same crack-smoking hobos they drag in off the street
> to write PC BIOSes. However good your own journalling file system on
> _top_ of that 'disk' is, you can still lose everything with a badly
> timed power-off.

I agree, hence the idea to complete the current write request _and
also_ gracefully shutdown the SD card to an inactive state, before
power is dropped.

To continue the filesystem on another pseudo-filesystem analogy,
that's like calling fsync on the pseudo-filesystem.

No guarantees - even Linux has fsync worthy of crack-smoking hobos at
times ;-) - but better than not calling fsync at all!

But is it even possible to shutdown an SD card gracefully, e.g. with a
power-down command?

> If you want to store data on solid state media, my current advice is
> either to do it on _real_ flash directly with a flash-based file system
> like JFFS2 or UBIFS, or to pray regularly to the deity of your choice.

Trouble is, that's not suitable for a dashboard unit where users plug
in their own media card.

Marco didn't say if the SD card is for users to plug in their own
media, or if it's internal storage for the device.

Marco, if it's just for the device itself to use, follow David's
suggestion if you can: use real flash with UBIFS or something like it,
not an SD card.  That will be much easier.

-- Jamie
