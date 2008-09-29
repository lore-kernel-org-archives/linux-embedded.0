From: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: Marvel 88E6063-RCJ1 driver
Date: Mon, 29 Sep 2008 04:51:48 +0200
Message-ID: <20080929025148.GA22984@xi.wantstofly.org>
References: <d7555edbde4d54b0693fa7bddb894cfe@reliableembeddedsystems.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d7555edbde4d54b0693fa7bddb894cfe@reliableembeddedsystems.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded-owner@reliableembeddedsystems.com
Cc: Linux embedded <linux-embedded@vger.kernel.org>

On Tue, Sep 16, 2008 at 11:33:18PM -0500, linux-embedded-owner@reliableembeddedsystems.com wrote:

> I'm not sure, if my posting goes to the right list, but before I'll start
> hacking away, I would like to ask if someone already has a driver for a
> Marvel Linkstreet 88E6063 Integrated 7-Port QoS, 802.1Q 10/100 Ethernet
> Switch for a 2.6 kernel handy or can point me to where this can be found.

Jumping in late..  (please CC, not on the list)

As the other posters have suggested, you _can_ use this switch without
any special drivers.  Your boot loader should initialise it in such a
way that the CPU port is treated as just another switch port (turn tag
mode off, and force link/speed/duplex since there is no PHY), and then
it'll be just as if your CPU is connected to a regular 7-port ethernet
switch.


If you want more control over the switch, I've just posted a patch
series to the linux netdev mailing list for support for various DSA
switches.  (There is no 88E6063 support yet, but there is support
for the 88E6060, and 6063 shouldn't be hard to add.)

What that patch series does is to expose each port on the switch as
a linux network interface, handling things like link state, PHY
commands and hardware statistics transparently, as if the switch ports
were individual NICs in the host system.

A forthcoming patch set will handle hardware bridging transparently,
so if you do e.g. "brctl addif br0 lan1; brctl addif br0 lan2", the DSA
driver will program the switch chip so that ports 1 and 2 will be
bridged in hardware, etc.


From a software point of view, the only difference between the 88E6060
and the 88E6063 is that the 6063 has hardware QoS and hardware stats
counters.  If you'd like to give it a go, let me know and I'll whip up
a 88E6063 support patch for you to try.
