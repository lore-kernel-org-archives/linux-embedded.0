From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: [PATCH 01/17] pramfs: documentation
Date: Mon, 10 Jan 2011 09:35:53 -0800
Message-ID: <987664A83D2D224EAE907B061CE93D5301940801B2@orsmsx505.amr.corp.intel.com>
References: <4D25AF02.60208@gmail.com>
 <AANLkTimGt5hi+TpFHWxktJEg3tcDQmmARdqFqzAt++OQ@mail.gmail.com>
 <4D2777FC.6040509@gmail.com>
 <AANLkTimtvYfHXG=rMLbFLzVaKbfB6nrj_ZE1AH4quRG2@mail.gmail.com>
 <4D281D65.1070102@gmail.com>
 <20110110080839.GA16066@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110110080839.GA16066@atrey.karlin.mff.cuni.cz>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

> You'd be better running ext2 over special block device,
> it is quite simple.

Marco,

You might want to spend some more time answering this question
(it is a particularly good one).  What are the reasons to use
pramfs, rather than a ext2 over a mem<->block driver.  You covered
some in your part 0 patch (like ext2 wastes time getting optimal
block placement for rotating media). But it might be a good idea
to go back over them here.  From my (lightweight) reading of your
code, it looks like the biggest benefit is avoiding duplicating
the data in the pramfs memory region and the VM page cache ...
which is a big deal for your target audience of hand held devices
where memory is a somewhat scarce resource. But you probably
have other goodness in there too.

-Tony
