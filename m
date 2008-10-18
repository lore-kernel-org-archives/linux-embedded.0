From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Power cut in management
Date: Sat, 18 Oct 2008 12:49:10 +0100
Message-ID: <20081018114910.GA29345@shareable.org>
References: <4917.79.37.233.237.1224328849.squirrel@nausicaa2.coritel.it>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4917.79.37.233.237.1224328849.squirrel@nausicaa2.coritel.it>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: marco.stornelli@coritel.it
Cc: linux-embedded@vger.kernel.org

marco.stornelli@coritel.it wrote:
> I'm working with a board where the power is turn on/off through a key as
> in a car. Is there any design pattern to afford that? It's the first time
> I have to manage a situation where the power can suddenly cut in anytime.
> Hardware guys are working to get "time" to do a clean shutdown (I turn the
> key but I still have the power) but any suggestions are welcome. However,
> I can't use a simply read-only filesystem (at least for root fs) because
> the board has got an sdcard that can be inserted (and then mounted in rw
> mode) anytime. Thanks.

This is off the top of my head, and may be rubbish.

From http://www.linux-mtd.infradead.org/doc/ubifs.html:

    We have heard reports that MMC and SD cards corrupt and loose data
    if power is cut during writing. Even the data which was there long
    time before may corrupt or disappear. This means that they have
    bad FTL which does not do things properly. But again, this does
    not have to be true for all MMCs and SDs - there are many
    different vendors. But again, you should be careful.

As long as you have sufficient emergency power to finish writing a
consistent filesystem state and no incomplete block to the SD card,
and to gracefully shut down the SD card so that it stops reorganising
data on the flash internally, it should be ok.  That means routing
emergency power to the CPU and SD card, so that you don't get
corruption in the middle of writing a block.

Can you use a journalling filesystem like ext3, reiserfs, xfs, or even
UBIFS on the card, or does it have to be FAT?  With a journalling
filesystem, they vary on the details but basically if you can finish
the current write request in progress, there's no fs-level corruption.

With FAT, completing just the write in progress is not enough.  In
principle a small number of writes could be used to get the fs into a
consistent state in an emergency, and the required number could be
kept bounded by changes to the FAT fs code.

Emergency power isn't necessarily required for the peripherals such as
panel LEDs, displays, CD drives, radios, serial ports, speakers
etc. that you might have, so by routing it only to a fewer essential
components, and shutting down the rest, you'll have a stable power for
longer off a smaller capacitor.

Make sure the hardware is able to notify the CPU by interrupt
immediately when the main power is cut, so the CPU can switch into the
emergency mode as quickly as possible, cut power to unnecessary
peripherals, only finish the I/O request already in progress, or the
minimum required for a consistent state, and gracefully shut down the
SD card.  This means the board's PSU should not simply keep going for
a couple of seconds after input power is lost: it must provide you
with a logic signal too.  Alos, make sure during this time that the
board's PSU voltage output remains stable and doesn't drop drastically
during the emergency shutdown, as that could lead to SD card
corruption too.

-- Jamie
