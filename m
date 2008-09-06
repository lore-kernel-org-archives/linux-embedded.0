From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [Squashfs-devel] [patch 0/3] [RFC] zlib crypto module
Date: Sat, 06 Sep 2008 05:41:03 +0100
Message-ID: <48C209DF.5040509@lougher.demon.co.uk>
References: <20080829134158.108976037@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20080829134158.108976037@vixen.sonytel.be>
Sender: linux-crypto-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: linux-crypto@vger.kernel.org, squashfs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Geert Uytterhoeven wrote:
> These patches add a (de)compression module for the "zlib" format using the
> crypto API:
>   [1] crypto: Add a zlib crypto module
>   [2] tcrypt: Add a self test for the zlib crypto module
>   [3] squashfs: Switch from zlib/inflate to "zlib" crypto module
> 
> The last patch is a proof-of-concept to make SquashFS 3.4 use this new zlib
> crypto module. This makes it easier to e.g. change the decompression algorithm
> in SquashFS or to make use of a hardware-accelerated zlib crypto module.
> 
> It can be extended to other compressed file systems, like e.g. AxFS and CRAMFS.
> 
> All comments are welcome. Thanks!
> 

Moving Squashfs over to the crypto API is a good idea.  When the zlib 
crypto module code is in the mainline kernel moving Squashfs, AxFS and 
CRAMFS over will be easy.

Are you planning to do the necessary work to get this (or a subsequent 
version following the comments from Herbert Xu) into mainline?

Cheers

Phillip
