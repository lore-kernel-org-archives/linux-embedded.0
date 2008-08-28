From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [RFC] Remove more code when IP_MULTICAST=n
Date: Thu, 28 Aug 2008 21:25:50 +0100
Message-ID: <e7ejo5-lb9.ln1@woodchuck.wormnet.eu>
References: <20080819150047.38f09acf@surf> <Pine.LNX.4.64.0808191618190.25348@vixen.sonytel.be> <20080825084826.19923151@surf> <20080826033345.GA30587@linux-sh.org> <48B432EF.1010403@am.sony.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Hi,

Tim Bird <tim.bird@am.sony.com> wrote:
>
> [snipped]
> 
> In this particular case, I think we need to show that
> there are valid cases were an embedded product can use networking just
> fine, without IGMP support but with support for multicast.  (I believe
> that's  the slice that this particular patch makes).  IMHO, what's
> needed is a test to show that this works.  This can then be presented
> to the netdev guys, who are, after all much more experienced with the
> networking stuff.  If they can show that multicast does indeed *need* IGMP
> to work correctly, then we need to back off.  The last thing I want is
> to find out in the field that some streaming feature I've built into a
> Sony camera that relies on multicast won't work in lots of network
> configurations.  If that's true, then David is doing me a favor by
> saying No. (Note that I might still make the decision to forego
> a feature for size reasons if the number of instances of non-workingness
> was small.)
> 
As a networking sysadmin monkey I can tell you that:
 * you _need_ IGMP to *join* multicast groups
 * you do not need to know anything about multicast to send data to a
	group (except to consider a sensible value for the TTL in your
	IP header)[1]
 * you need PIM support *route* multicast traffic[2]

So as long as your embedded device does not need to route or *receive* a
multicast stream then you do not need IGMP support.

A reasonable example of this is a IPTV (source) streaming device, such as a
DVB->IP gateway.

To be honest, especially so in an embedded device, multicast is going to
become more and more important.  Zero configuration along with DNS and
even now a multicast enabled DHCP RFC are here.  Multicast is dead handy
for devices to automatically discover each other without using dreadful
broadcast traffic that of course is restricted to the same VLAN.

Real PnP plus service discovery lives in the world of multicast, the lusers
want it and it's the only way to provision such facilities.  My personal
recommendation is that patches that affect 'net/' go to netdev@.

Just the comments of a daytime networking sysadmin :)

Cheers

Alex

[1] an exception, iirc, is that you can speed up group creation with the
	"Create Group Request" igmp message type, but I could be wrong;
	this is most definiately optional though.
[2] if your router/switch does not support multicast then you will find it
	floods your switch ports with the traffic, effectively making it
	broadcast traffic
