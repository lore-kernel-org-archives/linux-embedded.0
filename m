From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Fri, 22 Aug 2008 18:08:51 +0100
Message-ID: <48AEF2A3.7020905@lougher.demon.co.uk>
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de> <48AE22F5.3000309@lougher.demon.co.uk> <200808221200.26052.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754819AbYHVRIy@vger.kernel.org>
In-Reply-To: <200808221200.26052.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@arndb.de>
Cc: jaredeh@gmail.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?windows-1252?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

Arnd Bergmann wrote:
> On Friday 22 August 2008, Phillip Lougher wrote:
>>> This looks very nice, but could use some comments about how the data is
>>> actually stored on disk. It took me some time to figure out that it actually
>>> allows to do tail merging into compressed blocks, which I was about to suggest
>>> you implement ;-). Cramfs doesn't have them, and I found that they are the
>>> main reason why squashfs compresses better than cramfs, besides the default
>>> block size, which you can change on either one.
>> Squashfs has much larger block sizes than cramfs (last time I looked it 
>> was limited to 4K blocks), and it compresses the metadata which helps to 
>> get better compression.  But tail merging (fragments in Squashfs 
>> terminology) is obviously a major reason why Squashfs gets good compression.
> 
> The *default* block size in cramfs is smaller than in squashfs, but they both
> have user selectable block sizes. I found the impact of compressed metadata
> to be almost zero. 

Squashfs stores significantly more metadata than cramfs.  Remember 
cramfs has no support for filesystems > ~ 16Mbytes, no inode timestamps, 
truncates uid/gids, no hard-links, no nlink counts, no hashed 
directories,  no unique inode numbers.  If Squashfs didn't compress the 
metadata it would be significantly larger than cramfs.

Cheers

Phillip
