From: Darren Hart <dvhart@linux.intel.com>
Subject: Minimal x86 memory requirements
Date: Mon, 14 Feb 2011 16:33:25 -0800
Message-ID: <4D59C9D5.4080909@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

I'm looking to build a bare minimum x86 kernel that will boot and run 
busybox, nothing else (and eventually less than that). Assuming I do 
need USB-HID, IDE, and basic TCP/IP, what should I expect to be the 
least RAM I could get away with just to boot off flash, get a getty, 
login, and take a few directory listings.

If anyone would like to point me where to RTFM, that would be 
appreciated as well :-)

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
