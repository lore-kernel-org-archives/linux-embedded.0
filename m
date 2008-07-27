From: James Chapman <jchapman@katalix.com>
Subject: Re: testing ethernet device with external loopback
Date: Sun, 27 Jul 2008 12:07:03 +0100
Message-ID: <488C56D7.6050208@katalix.com>
References: <488C3608.3000104@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <488C3608.3000104@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sebastien Fauris <titelive72@gmail.com>
Cc: linux-embedded@vger.kernel.org

Sebastien Fauris wrote:
> Hi,
> 
> for hardware testing purposes, I would like to perform an external 
> loopback on my ethernet interface. For this, I wrote 2 little 
> executables, one  sending a raw ethernet packet (using 'sendto') on a 
> socket opened with the  parameters PF_PACKET, SOCK_RAW, 
> htons(ETH_P_ALL), the other one doing a recvfrom from a raw socket.
> The problem is that on the reception side, I always receive what I send, 
> even when
> the external RJ45 stub is not plugged !

Presumably you are trying to sendto() a local IP address. When you do 
this, packets are looped back before they get to the ethernet driver. 
Pull out all eth cables and do a ping to one of your local IP addresses 
and you'll see ping responses. :)

> Is there a way to tell to the kernel on the reception side that I want 
> to get only packets coming from the external world ?

Try using pktgen to generate packets from the kernel to the IP address 
of your interface. The packets are generated inside the kernel, below 
the IP stack, so they don't get looped back in software. With pktgen, 
you set MAC addresses, IP addresses, protocol etc using a /proc 
interface. There is documentation in the kernel source tree, or google 
pktgen.


-- 
James Chapman
Katalix Systems Ltd
http://www.katalix.com
Catalysts for your Embedded Linux software development
