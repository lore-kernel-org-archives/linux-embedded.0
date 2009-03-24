From: Robin Getz <rgetz@blackfin.uclinux.org>
Subject: Sources of entropy?
Date: Tue, 24 Mar 2009 18:47:28 -0400
Message-ID: <200903241847.29104.rgetz@blackfin.uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: linux-embedded@vger.kernel.org

I'm just wondering what people using on standard embedded/headless/diskless 
targets (which do not have hw random number generators) as a source of 
entropy - since networking was removed as an entropy source circa 2.6.26

On my target:

root:/> cat /proc/sys/kernel/random/entropy_avail
0

is about all I get... (since I'm not running any userspace utils yet).


I have seen rngd, clrngd, audio_entropyd, & video_entroyd - but I was just 
wondering what others were actually using. (I was cautioned that everything 
was pretty CPU intensive, since they all have a FIPS testing to ensure 
randomness)...

Thanks in advance.
-Robin
