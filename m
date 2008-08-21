From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 03/10] AXFS: axfs.h
Date: Thu, 21 Aug 2008 15:40:50 -0700
Message-ID: <6934efce0808211540p237f2c52pd71c2b955b3f54a8@mail.gmail.com>
References: <48AD00E6.2070505@gmail.com> <200808211424.31966.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Cf3lreugPO6rpbxjUIaHVIObgczhhw+PzFoUnXpk+kk=;
        b=g+A3ox7HgmWCEhH96xx5FYhwJxwIu53rihM14cRrP2gjWBKSDpDSRb+arRMGUkkllJ
         AYYd06Jfsb6qrL1KqMkXPT8FdtW6huzUOkinJgtVUZCwRX9fEylGF3dGJ4qaCncqTrGq
         yzs3frT5qMlAcBYaWW8/V3Hg8aTHrLxn4fH7k=
In-Reply-To: <200808211424.31966.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> This bytetable stuff looks overly complicated, both the data structure and
> the access method. It seems like you are implementing your own custom Huffman
> compression with this.
>
> Is the reasonn for the bytetable just to pack numbers efficiently, or do you
> have a different intention?

It looks more complicated than it is.  I need a data structure that is
64bit capable, easily read-in-place (remember this is designed to be
an XIP fs), and highly space efficient.  Because it's XIP I didn't
want something that required a lot of calculation nor something that
made you incur a lot of cache misses.  So yes I just want to pack
numbers in an easily read-in-place fashion.

If I have an array of u64 numbers tracking small numbers (a[0] = 1;
a[1] = 2;) just throwing that onmedia is a big waste.
(0x0000000000000001; 0x0000000000000002)  Having different array types
for different images such as arrays of u8,u16,u32,u64 becomes less
efficient for 3,5,6 and 7 byte numbers, 3 bytes was a particularly
interesting size for me.

All I'm doing is removing the totally unnecessary zeros and aligning by bytes.
Take an array of u64 like this :
0x0000000000000005
0x0000000000001001
0x00000000000a0000

I strip off the unneeded leading zeros:
0x000005
0x001001
0x0a0000

Then pack them to byte alignment:
0x0000050010010a0000

Sure it could be encoded more but that would make it harder to extract
the data.  This way I can read the data in one, maybe two, cache
misses.  A couple of shifts to deal with the alignment and endianness
and we are done.

> Did you see a significant size benefit over simply storing all metadata as
> uncompressed data structures like in cramfs?

Yes. For some modest values of significant.  In terms of the amount of
space required to track the metadata it is more dramatic.  For a small
rootfs I can fit many of the data structures in an u8 array, while
maintaining u64 compatibility.  Compared to dumping u64 arrays onmedia
that's an 8X savings.  But it's an 8X savings of a smallish percentage
of the image size.  The difference is more pronounced on a smaller
(2MB) filesystem I tested but it was only ~5% if memory serves me
correct.

> Have you considered storing simple dentry/inode data in node_type==Compressed
> nodes?

Yes, I thought a lot about that.  But I choose against it because I
wanted read-in-place data structures for minimum RAM usage in the XIP
case and I figure the way I do it would stat() faster.
