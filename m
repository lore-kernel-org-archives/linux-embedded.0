From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Tue, 2 Sep 2008 10:47:45 -0700
Message-ID: <6934efce0809021047h40127b72u5d35f457e0546635@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com>
	 <Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
	 <6934efce0808220951i5a2cd6f9t70f9c522eae6f1d6@mail.gmail.com>
	 <Pine.LNX.4.64.0808281737150.28552@vixen.sonytel.be>
	 <Pine.LNX.4.64.0809021725480.3986@vixen.sonytel.be>
	 <6934efce0809020944s36dd7f82wec77c4189ef1b114@mail.gmail.com>
	 <20080902171500.GC19618@logfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=z2xjR2OtaVzlM2gnTEvvh5DhDm4SAq575foezUVbMkI=;
        b=nKJFDkHvTiG8SLo0b22tEwO0PmgT4Gb/vazw281kD+OiVoHvG4yEer/HwxrrcMcnNT
         oNnStfCvbxrcJe09ABBPSV9aJNp29FUO5HD5EfhjmtJQSYR1HOlMXoJKI5XlRysvTNgk
         afkfXCidYQ1vYRq9eQ8cf8Mgq9jadsEH4N9zI=
In-Reply-To: <20080902171500.GC19618@logfs.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

>> How is one expected to read those last 4 bytes of a loopbacked file?
>> Are they unreadable?  We can add the padding.   I am just wondering if
>> this is a bug or a known limitation in the loopback handling or if
>> there is a different safer way of reading block devs with truncated
>> last blocks.
>
> Can't you just include the final magic into the last block, thereby
> making the size a clean multiple of 4k?  It looks as if you have some
> padding before the magic anyway.  So you just have to make sure the
> padding is at least 4 bytes and write the magic to the end of it.  Apart
> from solving this bug, it should also save you some space. ;)

I'm going to have to look into this n*4K thing.  The image doesn't
need to be aligned.  There shouldn't be any last block to put the
magic in.  But I haven't messed with the mkfs.axfs code for a while.
