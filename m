From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Power cut in management
Date: Sat, 18 Oct 2008 13:04:53 +0100
Message-ID: <1224331493.6770.1360.camel@macbook.infradead.org>
References: <4917.79.37.233.237.1224328849.squirrel@nausicaa2.coritel.it>
	 <20081018114910.GA29345@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081018114910.GA29345@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: marco.stornelli@coritel.it, linux-embedded@vger.kernel.org

On Sat, 2008-10-18 at 12:49 +0100, Jamie Lokier wrote:
> Can you use a journalling filesystem like ext3, reiserfs, xfs, or even
> UBIFS on the card, or does it have to be FAT?  With a journalling
> filesystem, they vary on the details but basically if you can finish
> the current write request in progress, there's no fs-level corruption.

Careful. When you use a solid state "disk", you're actually using your
file system on top of an underlying "pseudo-filesystem" which makes the
flash pretend to be a disk. Your data are at the mercy of that
underlying code, which in our past experience always seem to have been
implemented by the same crack-smoking hobos they drag in off the street
to write PC BIOSes. However good your own journalling file system on
_top_ of that 'disk' is, you can still lose everything with a badly
timed power-off.

If you want to store data on solid state media, my current advice is
either to do it on _real_ flash directly with a flash-based file system
like JFFS2 or UBIFS, or to pray regularly to the deity of your choice.

-- 
dwmw2
