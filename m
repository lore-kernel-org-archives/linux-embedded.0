From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 1/9] Squashfs: move zlib decompression wrapper code into
 a 	separate file
Date: Thu, 10 Dec 2009 23:20:41 +0000
Message-ID: <4B218249.4040501@lougher.demon.co.uk>
References: <E1NHTHg-0001sM-NQ@dylan.lougher.demon.co.uk>	 <20091207145705.cd30cae8.akpm@linux-foundation.org>	 <4B1ED122.3040309@lougher.demon.co.uk>	 <1260352852.19669.1253.camel@localhost>	 <4B2042FA.8080406@lougher.demon.co.uk> <10f740e80912100201l6d83588evff46e95ec96d0aed@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <10f740e80912100201l6d83588evff46e95ec96d0aed@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dedekind1@gmail.com, Andrew Morton <akpm@linux-foundation.org>, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, Tim Bird <tim.bird@am.sony.com>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Felix Fietkau <nbd@openwrt.org>

Geert Uytterhoeven wrote:
> Hi Phillip,
> 
> On Thu, Dec 10, 2009 at 01:38, Phillip Lougher
> <phillip@lougher.demon.co.uk> wrote:
>> Artem Bityutskiy wrote:
>>> Did you consider using cryptoapi? UBIFS uses zlib/lzo in cryptoapi - it
>>> is a very clean way.
> 
> Exactly my question, as that's why the Crypto API was extended with
> support for partial (de)compression in the first place ;-)
> 

Your cryptoapi patches are on my "must do something about them" list, I've
not forgotten them :-)   The lack of lzma in the crypotapi made moving
solely to the cryptoapi difficult, when I wanted to add lzma decompression
support.

The decompressor framework is my _solution_ to this problem.  This allows
cryptoapi support to be added as additional decompression_wrapper, with
multiple compression types using the crptoapi wrapper as appropriate.
This has the advantage it allows Squashfs to use the cryptoapi (with
its advantages), without needlessly restricting Squashfs to the
compression algorithms supported by the cryptoapi.

Let's get this mainlined, and then we can work on getting your
cryptoapi patches integrated into that.  That'll make me happy,
and hopefully you'll be happy too?

Thanks

Phillip
