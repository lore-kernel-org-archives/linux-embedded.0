From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: RE: [PATCH v5 0/5] cramfs refresh for embedded usage
Date: Fri, 6 Oct 2017 12:30:08 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1710061215550.6291@knanqh.ubzr>
References: <20171006024531.8885-1-nicolas.pitre@linaro.org> <20171006063919.GA16556@infradead.org> <SG2PR06MB11655E68C2F2BE55261F51238A710@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=CuQkcXczKTUUFE+uHilq267iq2/TBbObzbbIJ5sFrVQ=;
        b=OKLK5fGtaTWIOO76+umMXHTRNsY++XYBeAfhEKzrglymGuBUuNJL/CqyDwy5aZlzJv
         5AXEn5bZZaEQ/SwtwR6oYarE2s8BBHyb5yUu1hGMyEzI9Pgv4CJhL+fGcgOg00mwBuqJ
         RVTd2i7tMujSoQ1j4K2yTlB0qacuirj/vnfV4=
In-Reply-To: <SG2PR06MB11655E68C2F2BE55261F51238A710@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Christoph Hellwig <hch@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, 6 Oct 2017, Chris Brandt wrote:

> On Friday, October 06, 2017, Christoph Hellwig wrote:
> > This is still missing a proper API for accessing the file system,
> > as said before specifying a physical address in the mount command
> > line is a an absolute non-no.
> > 
> > Either work with the mtd folks to get the mtd core down to an absolute
> > minimum suitable for you, or figure out a way to specify fs nodes
> > through DT or similar.
> 
> On my system, the QSPI Flash is memory mapped and set up by the boot 
> loader. In order to test the upstream kernel, I use a squashfs image and 
> mtd-rom.
> 
> So, 0x18000000 is the physical address of flash as it is seen by the 
> CPU.
> 
> Is there any benefit to doing something similar to this?
> 
> 	/* File System */
> 	/* Requires CONFIG_MTD_ROM=y */
> 	qspi@18000000 {
> 		compatible = "mtd-rom";
> 		probe-type = "map_rom";
> 		reg = <0x18000000 0x4000000>;	/* 64 MB*/
> 		bank-width = <4>;
> 		device-width = <1>;
> 
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 
> 		partition@800000 {
> 			label ="user";
> 			reg = <0x0800000 0x800000>; /* 8MB @ 0x18800000 */
> 			read-only;
> 		};
> 	};
> 
> 
> Of course this basically ioremaps the entire space on probe, but I think
> what you really want to do is just ioremap pages at a time (maybe..I 
> might not be following your code correctly)

No need for ioremaping pages individually. This creates unneeded 
overhead, both in terms of code execution and TLB trashing. With a 
single map, the ARM code at least is smart enough to fit large MMU 
descriptors when possible with a single TLB for a large region. And if 
you're interested in XIP cramfs then you do have huge vmalloc space to 
spare anyway.

As to the requirement for a different interface than a raw physical 
address: I'm investigating factoring out the MTD partition parsing code 
so it could be used with or without the rest of MTD. Incidentally, the 
person who wrote the very first incarnation of MTD partitioning 17 years 
ago was actually me, so with luck I might be able to figure out 
something sensible.


Nicolas

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
