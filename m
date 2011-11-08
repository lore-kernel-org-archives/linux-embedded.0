From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Remote IP setup of devices in a network
Date: Tue, 8 Nov 2011 20:31:58 +0100
Message-ID: <20111108193158.GA28261@merkur.ravnborg.org>
References: <20111108185421.GA27727@merkur.ravnborg.org> <1320779474.5402.2.camel@shinybook.infradead.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1320779474.5402.2.camel@shinybook.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>

On Tue, Nov 08, 2011 at 07:11:09PM +0000, David Woodhouse wrote:
> On Tue, 2011-11-08 at 19:54 +0100, Sam Ravnborg wrote:
> > The idea is to use an UDP broadcast to discover all devices,
> > and a similar UDP broadcast to configure the devices.
> > In the latter the MAC will be the key to address individual devices.
> 
> You could almost be describing link-local IPv6. Each device
> automatically gets an IPv6 address based on its MAC address, which you
> can use for unicast addressing. The broadcast (or multicast) bit is easy
> enough too.

We are forced to use a IPv4 network where we need to keep the devices
in the same network as a potential router.

So to describe the idea with a little drawing:

Host PC            Device-1     Device-2
  |                   |            |
  |---- DISCOVER----->|----------->|
  |                   |            |
  |<-- REPLY(MAC:IP)--|            |
  |<-- REPLY(MAC:IP)---------------|
  |                   |            |
 (technician manually decide IP setup)
  |                   |            |
  |-- CONFIG(MAC:IP)->|            |
  |-- CONFIG(MAC:IP)-------------->|

The discover is maybe sent twice due to packer drops.
The Reply is sent once and may look like this:

MAC=01:02:03:04:05:06;IP=10.11.12.13;NM=255.0.0.0;GW=10.0.0.1;XX="foo bar";YY="baz buz"

The technician then decides the new config (or computer assisted).

And the CONFIG may look like this:
MAC=01:02:03:04:05:06;IP=192.168.0.201;NM=255.255.255.0;GW=192.168.0.1


I cannot get this with auto-IP or wahtever it is named for IPv4.

	Sam
