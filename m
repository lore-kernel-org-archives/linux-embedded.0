From: Bryan Henderson <hbryan@us.ibm.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 15 Jun 2009 08:51:28 -0700
Message-ID: <OFD1325B2C.7A926EF9-ON882575D6.00567314-882575D6.00571BC3@us.ibm.com>
References: <4A34DA30.1080201@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A34DA30.1080201@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Daniel Walker <dwalker@soe.ucsc.edu>, Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Marco <marco.stornelli@gmail.com>

> Marco wrote:
> >    To enable direct
> >    I/O at all times for all regular files requires either that
> >    applications be modified to include the O_DIRECT flag on all file
> >    opens, or that a new filesystem be used that always performs direct
> >    I/O by default."
> 
> This could be done as well by just introducing a "direct_io_only"
> mount option to a file-system which would need this feature.

A mount option would not be the right way.  Mount options are for things 
that are characteristic of the way you're going to access the files. 
_This_ is a characteristic of the block device.  So if one were to make 
this memory accessible with a block device, it would make more sense to 
have a block device ioctl.  And it wouldn't ask the question, "should I 
use direct I/O only," but "does this device have the performance 
characteristics of a classic disk drive?"

But it's possible that there's just no advantage to having a block device 
in the stack here.  When unix block devices were invented, their main 
purpose was that they could reorder reads and writes and do buffering and 
caching -- all things essential for disk drives.  We don't want to stretch 
the concept too far.

--
Bryan Henderson                     IBM Almaden Research Center
San Jose CA                         Storage Systems
