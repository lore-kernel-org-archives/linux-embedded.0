From: Glenn Henshaw <thraxisp@logicaloutcome.ca>
Subject: Possible NetFilter Bug (2.4.27 and 2.6.20 kernel)
Date: Fri, 30 May 2008 13:52:01 -0400
Message-ID: <57E51BB8-B076-4225-B0F7-4653421D9B8A@logicaloutcome.ca>
Mime-Version: 1.0 (Apple Message framework v924)
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
Sender: linux-net-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-net@vger.kernel.org, linux-embedded@vger.kernel.org

   I'm running into a problem with uCLinux 3.2 (2.4.17 kernel) router.  
I can also reproduce the problem on 2.6.20 kernel (Debian 4.0). I  
suspect that it still exists in more recent versions, but can't create  
the environment to test this easily.

   The router is running a NAT (MASQUERADE) firewall. After a few days  
of operation with a number of clients , the ip_dst_cache fills and  
overflows, stopping the router.  This is most noticeable with a large  
number of hosts behind the router doing UDP transactions (although it  
appears that ICMP and TCP connections produce the same effect).

   The culprit seems to be traffic passing through the NAT connections  
in the router. Each new packet creates a new entry in the rt_cache, or  
increases the ref count. These entries are never cleared away.  
Eventually, no more entries can be allocated as the entries in the  
cache are locked (refcount>0). I traced the issue back to the packets  
returning to the router from the outside host, where the destination  
of the packet is changed. This appears to be a netfilter bug?

   Reproducing the problem is simple. Given a host (192.168.4.2)  
behind the router (192.168.4.3 to 192.168.1.161) and a host on the  
other side of the router, ping between the hosts. The (edited) results  
of the  route -Cn command on the router are shown below.

### starting state
# route -Cn
Kernel IP routing cache
Source          Destination     Gateway         Flags Metric Ref     
Use Iface
192.168.4.3     192.168.4.2     192.168.4.2           0      1         
0 eth0
192.168.1.161   206.191.32.163  192.168.1.2           0      0         
0 eth1
# route -Cn

### ping 25x

# route -Cn
Kernel IP routing cache
Source          Destination     Gateway         Flags Metric Ref     
Use Iface
192.168.1.161   192.168.1.1     192.168.1.1           0      0        
24 eth1
192.168.4.2     192.168.1.1     192.168.1.1     i     0      25       
24 eth1
192.168.1.1     192.168.4.2     192.168.4.2     i     0      25       
24 eth0
192.168.4.3     192.168.4.2     192.168.4.2           0      1         
0 eth0
#

   I've searched most of the lists, and added some patches (which  
corrected lost ip_dst_cache entries). I'm looking for pointers on how  
to resolve this. I must fix this in the 2.4 stream as this is an  
embedded application and a kernel upgrade means recertifying with al  
of our customers. Is there a better list to post to? Is there a bug  
tracker somewhere to log this into?


-- 
Glenn Henshaw                     Logical Outcome Ltd.
e: thraxisp@logicaloutcome.ca     w: www.logicaloutcome.ca



