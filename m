From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: [PATCH/RFC] Add Alternative Log Buffer Support for printk
	Messages
Date: Tue, 25 Nov 2008 12:54:50 -0800
Message-ID: <1227646490.5404.5.camel@cuplxvomd02.corp.sa.net>
References: <20081125135519.038abf23@zod.rchland.ibm.com>
	 <C5518C2F.13137%gerickson@nuovations.com>
	 <b5e2fc790811251131g63ea9444x57ec0829ca0b069e@mail.gmail.com>
	 <492C573E.9030309@billgatliff.com>
	 <b5e2fc790811251207g38d429f3q4eb698b92162d6@mail.gmail.com>
	 <492C5DC2.9040402@billgatliff.com>
Reply-To: dvomlehn@cisco.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <492C5DC2.9040402@billgatliff.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1623; t=1227646709; x=1228510709;
	c=relaxed/simple; s=rtpdkim1001;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20[PATCH/RFC]=20Add=20Alternative=20Log=2
	0Buffer=20Support=20for=20printk=0A=09Messages
	|Sender:=20
	|To:=20Bill=20Gatliff=20<bgat@billgatliff.com>;
	bh=cyolMCBkV3voA0BcBKs0sTYIe10ngkX2Wr2W7hdCkWc=;
	b=Q5drCjaiPsJ7ptGaHbMFPl2tSK4nK6Eb+d2XJViHE62eRBNQb53m43wYa+
	HpYmx573WTAv5+2rdsX2ZeKV5wzn3hthD0p1Qo9FKn4Hbvr7aYJOsDcuP8dZ
	pyB9j84ncq;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Matt Sealey <matt@genesi-usa.com>, Grant Erickson <gerickson@nuovations.com>, linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>, Wolfgang Denx <wd@denx.de>, linux-embedded@vger.kernel.org


On Tue, 2008-11-25 at 14:19 -0600, Bill Gatliff wrote:

> Just trying to figure out where the walls of this "sandbox" are.  I've
> been aware of the concept of Open Firmware for a while, but haven't
> really looked into it before now--- mostly because my impression until
> now was that the available implementations were both closed-source,
> and not supporting embedded, non-PPC targets like ARM.

FWIW, at the last OLS there was interest expressed by at least one
ARM-based platform and I'm working on a set of patches to add the device
tree for MIPS. It's going very slowly and is dependent on a patchset to
add support for our platform, so it will take a while to make it
available. The important point, though, is that device tree is the only
thing approaching a standard on any non-x86-based platform for passing
structured information from the bootloader to the kernel. The command
line is just not sufficient for this.
--
David VomLehn




     - - - - -                              Cisco                            - - - - -         
This e-mail and any attachments may contain information which is confidential, 
proprietary, privileged or otherwise protected by law. The information is solely 
intended for the named addressee (or a person responsible for delivering it to 
the addressee). If you are not the intended recipient of this message, you are 
not authorized to read, print, retain, copy or disseminate this message or any 
part of it. If you have received this e-mail in error, please notify the sender 
immediately by return e-mail and delete it from your computer.
