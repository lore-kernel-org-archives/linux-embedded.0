From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
Date: Thu, 21 Aug 2008 20:23:55 -0700
Message-ID: <6934efce0808212023x758babf0w500da6801bd66f45@mail.gmail.com>
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de>
	 <48AE22F5.3000309@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=GOA5NpAvkCVt83in3oDSb2CGcqP4iJJBgfiSswcXKRU=;
        b=R5STD3wIIzkMZrQLX9GsOk2VRPyurQEbRbYdyS2fofwSS0nmVABpw6FfFLfSUANFq5
         hlAVU9doDUDEvHTMpKTfdTCKbReDZhTHDetfbmSA4tBj6/I1+Owtr7lb+jVatOK0jWCh
         rQV+7KIkRzDEjTX872u8SFWjkoSE4XcKRElyI=
In-Reply-To: <48AE22F5.3000309@lougher.demon.co.uk>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> Squashfs has much larger block sizes than cramfs (last time I looked it was
> limited to 4K blocks), and it compresses the metadata which helps to get
> better compression.  But tail merging (fragments in Squashfs terminology) is
> obviously a major reason why Squashfs gets good compression.
>
> The AXFS code is rather obscure but it doesn't look to me that it does tail
> merging.  The following code wouldn't work if the block in question was a
> tail contained in a larger block.  It assumes the block extends to the end
> of the compressed block (cblk_size - cnode_offset).

A c_block is the unit that gets compressed.  It can contain multiple
c_nodes.  The c_block can be PAGE_SIZE to 4GB in size, in theory :)
The c_nodes can be 1B to PAGE_SIZE. in any alignment.  I pack many
tails as c_nodes in a c_block.

>>> +               max_len = cblk_size - cnode_offset;
>>> +               len = max_len > PAGE_CACHE_SIZE ? PAGE_CACHE_SIZE :
>>> max_len;
>>> +               src = (void *)((unsigned long)cblk0 + cnode_offset);
>>> +               memcpy(pgdata, src, len);
>
> Perhaps the AXFS authors could clarify this?

The memcpy in question copies a c_node to the page.  The len is either
the max length of a c_node and size of the buffer I'm copying to
(PAGE_CACHE_SIZE) or it is the difference between the beginning of the
c_node in the c_block and the end of the c_block, whichever is
smaller.  The confusion is probably because of the fact that this
copies extra crap to the page for tails.
