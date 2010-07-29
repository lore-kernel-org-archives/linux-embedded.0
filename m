From: Nilesh Govindarajan <lists@itech7.com>
Subject: NFSRoot over PCMCIA with Static Kernel
Date: Thu, 29 Jul 2010 22:17:14 +0530
Message-ID: <AANLkTik8weR15k8DbdAneg0FZ=0z4e0n99jptJBqKWUu@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

I have a legacy laptop- 486, 20 MB RAM.
I would like to have it as dumb terminal for some purpose. I have two
PCMCIA network cards available for this purpose, one is Xircom Credit
Card Adapter IIps and 3com 3c589 both of whose drivers are there in
2.4, 2.6
I'm using 2.4 kernel because with 2.6 memory overflows and it freezes
just during kernel decompression.
The kernel command line I pass is: rw root=/dev/nfs
nfsroot=192.168.1.254:/nfsroot ip=dhcp where 192.168.1.254 is my box's
ip address.
IP Autoconfiguration has been enabled.
The problem is, kernel says: "IP-Config: No devices to configure"
You can take a look at the .config file: http://paste.pocoo.org/show/243107/
Any guesses where I'm missing?
For now there's no initrd with it. I believe it is not required if
kernel's IP-Config is able to take either of those cards as ethernet
and send DHCP request on the same. (I insert only one card at a time).

-- 
Regards,
Nilesh Govindarajan
Facebook: http://www.facebook.com/nilesh.gr
Twitter: http://twitter.com/nileshgr
Website: http://www.itech7.com
VPS Hosting: http://www.itech7.com/a/vps
