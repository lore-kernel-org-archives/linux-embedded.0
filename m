From: Carsten Otte <cotte@de.ibm.com>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Thu, 21 Aug 2008 10:44:47 +0200
Message-ID: <48AD2AFF.5060609@de.ibm.com>
References: <48AD00F8.1030004@gmail.com>
Reply-To: carsteno@de.ibm.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD00F8.1030004@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, nickpiggin@yahoo.com.au

Jared Hulbert wrote:
> Profiling is a fault instrumentation and /proc formating system.
> This is used to get an accurate picture of what the pages are actually used.
> Using this info the image can be optimized for XIP
Exporting profiling data for a file system in another file system 
(/proc) seems not very straigtforward to me. I think it is worth 
considering to export this information via the same mount point.
