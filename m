From: Sam Ravnborg <sam@ravnborg.org>
Subject: Remote IP setup of devices in a network
Date: Tue, 8 Nov 2011 19:54:21 +0100
Message-ID: <20111108185421.GA27727@merkur.ravnborg.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-embedded <linux-embedded@vger.kernel.org>

I am faced with a challenge that we ship devices which are
all preconfigured to a fixed IP address, and we want to provide
an easy solution to do remote IP configuration of all devices
connected to the same network.
In other words - all devices are reachable by a broadcast package.

The network may or may not include a DHCP server - which
we in any case do not have control over.

In the typical situation we will assign static IP
addresses to the devices - but sometimes we may also
configure them to DHCP.

So we are looking for a (de facto?) way to do this.
Any hints?

I haved tried to ask google without luck.

The idea is to use an UDP broadcast to discover all devices,
and a similar UDP broadcast to configure the devices.
In the latter the MAC will be the key to address individual devices.

As we are talking less than 100 devices this looks quite doable.
But I do not want to invent something again if it already exists.

Thanks in advance for any inputs,

	Sam
