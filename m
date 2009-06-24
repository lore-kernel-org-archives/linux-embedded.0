From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Wed, 24 Jun 2009 08:32:50 +0200
Message-ID: <2ea1731b0906232332n2488d452p27419eac7edab7e4@mail.gmail.com>
References: <4A33A7EC.6070008@gmail.com> <20090623192648.GB23119@logfs.org>
	 <1245791743.25547.3517.camel@macbook.infradead.org>
	 <200906232355.34134.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=KvGeswQBbly2xXCqKKvrc6QnUcOG36u+1mHM9Ojdh/A=;
        b=bdQKmGoLbgZJSHoiLDpQulypZTHA8xO2IZ2O6TEh0dnW7xH7W3grEbMSzyccJKankM
         vzcS+OxQtQd+w3fE7xedVHjlCrlq6MeEgywA/PlrJefVZPejCnMUMz1EIj+3bTFrwtaO
         LqYl4K6oM2d4Er2eeJvyGE49dH+ycX0dyqlxk=
In-Reply-To: <200906232355.34134.arnd@arndb.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@lazybastard.org>, Sam Ravnborg <sam@ravnborg.org>, Tim Bird <tim.bird@am.sony.com>, Chris Simmonds <chris@2net.co.uk>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

2009/6/23 Arnd Bergmann <arnd@arndb.de>:
> On Tuesday 23 June 2009, David Woodhouse wrote:
>> And dd on /dev/mem would work, surely?
>
> Actually, reading from /dev/mem is only valid on real RAM. If the nvr=
am
> is part of an IO memory mapping, you have to do mmap()+memcpy() rathe=
r
> than read(). So dd won't do it, but it's still easy to read from user
> space.

=46or "security" reasons pram reserve the region of memory with
reserve_mem_region_exclusive().....

>
>> I'd definitely recommend making it fixed-endian. Not doing so for JF=
=46S2
>> was a mistake I frequently regretted.
>
> Right.
>
> =A0 =A0 =A0 =A0Arnd <><
>
