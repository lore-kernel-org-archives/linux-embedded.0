From: Trent Piepho <tpiepho@freescale.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Fri, 19 Sep 2008 12:20:38 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0809191216450.3476@t2.domain.actdsltmp>
References: <6934efce0809121452kd20deb6m268715f6ed83a71e@mail.gmail.com>
 <20080915163421.GA13631@shareable.org> <6934efce0809151243h60a6e48bpf0c7600d4badf3c4@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0809151243h60a6e48bpf0c7600d4badf3c4@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Jamie Lokier <jamie@shareable.org>, cotte@de.ibm.com, Greg Ungerer <gerg@snapgear.com>, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, Linux-kernel@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com

On Mon, 15 Sep 2008, Jared Hulbert wrote:
>>>>> I'm using Spansion MirrorBit S29GL128N, which reads at about 0.6 MByte/s.
>>>
>>> If you are using a GL, you'll probably find our P33 a good fit and at
>>> competitive prices to GL as I understand it.  That's I think 50Mhz.
>>
>> What's a GL?  Never heard of it - all I can think of is OpenGL :-)
>
> S29_GL_128N

I'm using a S29GL064N chip.  Going through linux and /dev/mtd I get 13.5
MB/sec and reading directly from the chips give 15 MB/sec.  I've not mapped
the chip cached and I'm not using the page burst mode.  That would help a lot
certainly, but the current flash speed isn't much of a bottleneck.
