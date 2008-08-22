From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 03/10] AXFS: axfs.h
Date: Fri, 22 Aug 2008 11:12:32 -0700
Message-ID: <6934efce0808221112p64fe1346kc5530ca71dbb108b@mail.gmail.com>
References: <48AD00E6.2070505@gmail.com> <200808211424.31966.arnd@arndb.de>
	 <6934efce0808211540p237f2c52pd71c2b955b3f54a8@mail.gmail.com>
	 <200808221327.37371.arnd@arndb.de>
	 <Pine.LNX.4.64.0808221402170.17105@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757158AbYHVSMu@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=ETtwyITmlVDhcBe+h1Kg5rQoNnp38M2xaQqRC9sArP0=;
        b=vOnna4Drikkw8ThAb9ZxjdKrN01IbOUZ/8x8hWIwlCp6vQ8phz1laq15K09x0kPHT1
         Z0SZhVlTOpi6kg40WfH4wwH2sv3kcqUqbqOQNUKXL31e+YDgVG9Kn6NH7t9EwW2ST0pr
         EUh78WVENfCrDaQXPXRvDyg0WR/+o7JDrgxAs=
In-Reply-To: <Pine.LNX.4.64.0808221402170.17105@vixen.sonytel.be>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

>> So do I understand right that 3 bytes is your minimum size, and going
>> smaller than that would not be helpful? Otherwise I would assume that
>> storing a '5' should only take one byte instead of three.

Right.  But you need 3 bytes to store the maximum value 0x0a0000

If we had:
0x0000000000000003
0x00000000000000FF
0x000000000000000A

You would only need a 1 byte depth.

> From the paper, the minimum size (called `depth') is 1.

Correct the depth can be from 1 to 8 bytes.  The depth is determined
by the maximum value in the array.

>> I don't unsterstand yet why you store the length of each word separate
>> from the word. Most variable-length codes store that implicitly in
>> the data itself, e.g. in the upper three bits, so that for storing
>> 0x5, 0x1001, 0xa0000, this could e.g. end up as 0x054010014a0000,
>> which is shorter than what you have, but not harder to decode.
>
> AFAIU, the length (`depth') of each word is not stored separate, as the
> depth is the same for all values in the same table.

That is correct.  Each table has a single depth stored in the region descriptor.
