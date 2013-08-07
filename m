From: Michael Schnell <mschnell@lumino.de>
Subject: Re: AMP on an SMP system
Date: Wed, 07 Aug 2013 11:04:52 +0200
Message-ID: <52020DB4.8040609@lumino.de>
References: <51FB6EE1.3090708@lumino.de> <51FEC76C.70908@televic.com> <51FF77A2.7030904@televic.com> <520203E4.3070204@lumino.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <520203E4.3070204@lumino.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

I also found:

"This processor is in the inner shared domain, and uses its cache 
coherency protocol."

I understand  that some kind of memory  coherency needs to be guaranteed 
in AMP applications as well, if memory is used for communication between 
the systems.

Of course with AMP can avoid using shared memory or restrict shared 
memory usage to certain small areas necessary for communication. Perhaps 
some kind of "cache bypass" method (that might be provided by the MPU 
for DMA purpose)  for the memory region used for communication can be 
requested.

Thus, maybe setting SMPnAMP to "AMP" helps avoiding cache synchronizing 
latency and by this greatly improves the calculated max latency and thus 
especially in my favorite issue "virtual peripheral" is exactly the 
missing feature that allows to avoid most of the "non-determinism" 
problems Robert makes us aware of.

-Michael
