From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 1/9] Squashfs: move zlib decompression wrapper code into
 a separate file
Date: Thu, 10 Dec 2009 00:38:18 +0000
Message-ID: <4B2042FA.8080406@lougher.demon.co.uk>
References: <E1NHTHg-0001sM-NQ@dylan.lougher.demon.co.uk>	 <20091207145705.cd30cae8.akpm@linux-foundation.org>	 <4B1ED122.3040309@lougher.demon.co.uk> <1260352852.19669.1253.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1260352852.19669.1253.camel@localhost>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dedekind1@gmail.com
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com

Artem Bityutskiy wrote:
> 
> Did you consider using cryptoapi? UBIFS uses zlib/lzo in cryptoapi - it
> is a very clean way.
> 

Yes I did consider using the cryptoapi, but this doesn't have support for
lzma in mainline.

My aim is add lzma filesystem support to Squashfs using the existing kernel
lzma iplementation, and to make as few changes to that as necessary.

Phillip
