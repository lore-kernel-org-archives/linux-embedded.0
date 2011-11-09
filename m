From: Martyn Welch <martyn.welch@ge.com>
Subject: Re: Remote IP setup of devices in a network
Date: Wed, 09 Nov 2011 10:11:27 +0000
Message-ID: <4EBA51CF.5040400@ge.com>
References: <20111108185421.GA27727@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20111108185421.GA27727@merkur.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>

On 08/11/11 18:54, Sam Ravnborg wrote:
> I am faced with a challenge that we ship devices which are
> all preconfigured to a fixed IP address, and we want to provide
> an easy solution to do remote IP configuration of all devices
> connected to the same network.
> In other words - all devices are reachable by a broadcast package.
> 
> The network may or may not include a DHCP server - which
> we in any case do not have control over.
> 
> In the typical situation we will assign static IP
> addresses to the devices - but sometimes we may also
> configure them to DHCP.
> 
> So we are looking for a (de facto?) way to do this.
> Any hints?
> 
> I haved tried to ask google without luck.
> 
> The idea is to use an UDP broadcast to discover all devices,
> and a similar UDP broadcast to configure the devices.
> In the latter the MAC will be the key to address individual devices.
> 
> As we are talking less than 100 devices this looks quite doable.
> But I do not want to invent something again if it already exists.
> 
> Thanks in advance for any inputs,
> 

Isn't this one of the things that Avahi daemon is supposed to achieve?

Martyn

-- 
Martyn Welch (Lead Software Engineer)  | Registered in England and Wales
GE Intelligent Platforms               | (3828642) at 100 Barbirolli Square
T +44(0)1327322748                     | Manchester, M2 3AB
E martyn.welch@ge.com                  | VAT:GB 927559189
