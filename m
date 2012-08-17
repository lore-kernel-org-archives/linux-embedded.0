From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: NCD, a light scripting language for network configs and much
 more
Date: Fri, 17 Aug 2012 09:22:53 -0700
Message-ID: <20120817092253.41ade51b@nehalam.linuxnetplumber.net>
References: <CAOA3yKKmuAi=CPE=4-hyoGJJ7D7Oa_Bug5G=1Z3xif-5iFGeOw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hotplug-owner@vger.kernel.org>
In-Reply-To: <CAOA3yKKmuAi=CPE=4-hyoGJJ7D7Oa_Bug5G=1Z3xif-5iFGeOw@mail.gmail.com>
Sender: linux-hotplug-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ambroz Bizjak <ambrop7@gmail.com>
Cc: linux-embedded@vger.kernel.org, linux-hotplug@vger.kernel.org, netfilter@vger.kernel.org, linux-admin@vger.kernel.org, torvalds@osdl.org

On Fri, 17 Aug 2012 12:03:55 +0200
Ambroz Bizjak <ambrop7@gmail.com> wrote:

> Hi. I'm developing a special kind of scripting language which many
> might find useful: http://code.google.com/p/badvpn/wiki/NCD
> 
> It was (originally) designed for programming dynamic configuration of
> network interfaces, iptables etc. For example, there are commands that
> observe the presence and link status of network interfaces. Many
> commands are reversible, which makes it very easy to do cleanup
> automatically and implicitly, like removing IP addresses or routes
> when the link goes down on an interface.
> 
> The major advantage of this language compared to existing systems like
> NetworkManager and wicd is that it's extremely hackable; you can fine
> tune almost any part of the process. For example, this simple script
> will create a network bridge, ensure that interfaces eth0 and eth1 are
> in the bridge whenever they exist (consider hotplugging USB
> interfaces), and only after eth0 (!) is up and running will it obtain
> an IP address on br0 (!) using DHCP (since we know DHCP server is on
> eth0 not eth1).
> 
> process bridge {
>     # Choose name of bridge.
>     var("br6") bridge_dev;
> 
>     # Create the bridge (and destroy it on deinit).
>     run({"/sbin/brctl", "addbr", bridge_dev},
>         {"/sbin/brctl", "delbr", bridge_dev});
> 
>     # Set bridge up.
>     net.up(bridge_dev);
> 
>     # Wake up ports.
>     provide("BRIDGE");

FYI - you can use ip commands now to control bridge.
For all the new features planned, they won't be controllable via brctl.
