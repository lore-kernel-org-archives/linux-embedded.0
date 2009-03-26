From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Sources of entropy?
Date: Thu, 26 Mar 2009 13:25:08 +0000
Message-ID: <20090326132508.GA21993@shareable.org>
References: <200903241847.29104.rgetz@blackfin.uclinux.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200903241847.29104.rgetz@blackfin.uclinux.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Getz <rgetz@blackfin.uclinux.org>
Cc: linux-embedded@vger.kernel.org

Robin Getz wrote:
> I'm just wondering what people using on standard embedded/headless/diskless 
> targets (which do not have hw random number generators) as a source of 
> entropy - since networking was removed as an entropy source circa 2.6.26

You might not have much real entropy to use.  I guess networking was
removed because it's an obvious attack vector.

On my devices, I save the entropy pool to flash on shutdown and merge
it back on reboot.  This lets cumulative history build.
    
    [shutdown]
    dd if=/dev/urandom of=$ENTROPY_STORE.new bs=512 count=1 2>/dev/null \
       && mv $ENTROPY_STORE.new $ENTROPY_STORE \
       || rm -f $ENTROPY_STORE.new

    [boot]
    dd if=$ENTROPY_STORE of=/dev/random bs=512 2>/dev/null

You'll still drain the pool quickly so may need to use /dev/urandom
for everything (e.g. by linking /dev/random -> /dev/urandom), but
keeping history does mean you get more real entropy from /dev/urandom,
even though entropy_avail cannot estimate it (and the lower bound is
still zero, if what you did before has always been predictable).

> I have seen rngd, clrngd, audio_entropyd, & video_entroyd - but I was just 
> wondering what others were actually using. (I was cautioned that everything 
> was pretty CPU intensive, since they all have a FIPS testing to ensure 
> randomness)...

You can write anything you think is an entropy source to /dev/random,
and it won't increase the entropy estimate but it will increase real
entropy if your source has any.  So you could add low-order bits from
high-resolution timing data from your network application from time to
time, for example, if you think it's worth it.

That won't make /dev/random show confirmed non-zero entropy, but that
might not be feasible on your device anyway.

-- Jamie
