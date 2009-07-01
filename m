From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [RFC] transcendent memory for Linux
Date: Tue, 30 Jun 2009 20:41:01 -0700
Message-ID: <aday6r9gjea.fsf@cisco.com>
References: <5331ec14-c599-4317-bd5b-55911b8ee916@default>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <5331ec14-c599-4317-bd5b-55911b8ee916@default> (Dan Magenheimer's
	message of "Mon, 29 Jun 2009 07:44:50 -0700 (PDT)")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=413; t=1246419662; x=1247283662;
	c=relaxed/simple; s=sjdkim1004;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=rdreier@cisco.com;
	z=From:=20Roland=20Dreier=20<rdreier@cisco.com>
	|Subject:=20Re=3A=20[RFC]=20transcendent=20memory=20for=20L
	inux
	|Sender:=20;
	bh=Q9Dk/MpK4q5xNOlEm01dZQuWnmDIeLZkAa1oem7Gw1w=;
	b=k69C2HQRhr4epK+IzVJ+v6rJB0gpdQHLYbLF+1yYIRMTx/9CIzS955tI0v
	j1NpSMbQaQgbOyzUIGfxFiqGje5FUimjgx+SRGjobdUtDDJloQvyvPOi+7HN
	Rz/q7p6UmE6PfCUxOY47yhfgW6Cb9LJrOhHzXkj4WCw4Cuc6Zx66U=;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Magenheimer <dan.magenheimer@oracle.com>
Cc: Linus Walleij <linus.ml.walleij@gmail.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xensource.com, npiggin@suse.de, chris.mason@oracle.com, kurt.hackel@oracle.com, dave.mccracken@oracle.com, Avi Kivity <avi@redhat.com>, jeremy@goop.org, Rik van Riel <riel@redhat.com>, alan@lxorguk.ukuu.org.uk, Rusty Russell <rusty@rustcorp.com.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, akpm@osdl.org, Marcelo Tosatti <mtosatti@redhat.com>, Balbir Singh <balbir@linux.vnet.ibm.com>, tmem-devel@oss.oracle.com, sunil.mushran@oracle.com, linux-mm@kvack.org, Himanshu Raj <rhim@microsoft.com>, linux-embedded@vger.kernel.org


 > One issue though: I would guess that copying pages of memory
 > could be very slow in an inexpensive embedded processor.

And copying memory could very easily burn enough power by keeping the
CPU busy that you lose the incremental gain of turning the memory off
vs. just going to self refresh.  (And the copying latency would easily
be as bad as the transition latency to/from self-refresh).

 - R.
