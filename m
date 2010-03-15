From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH v2] char drivers: Ram oops/panic logger
Date: Mon, 15 Mar 2010 09:11:27 +0100
Message-ID: <2ea1731b1003150111r74032f5fhb52ae0b6e7604800@mail.gmail.com>
References: <4B968834.3040609@gmail.com>
	 <21eaeb5a1003091808s2d7638cxd524952a7d84b378@mail.gmail.com>
	 <2ea1731b1003100002w104633ffy1ae46ef3d245e5b5@mail.gmail.com>
	 <21eaeb5a1003100120x6cd3f69ak598954af3c9fe955@mail.gmail.com>
	 <2ea1731b1003100415i46dd8fcem85b85f49fb1a479@mail.gmail.com>
	 <20100312144854.cb94d9b4.akpm@linux-foundation.org>
	 <20100312233144.GG6491@shareable.org> <4B9B51B1.8010904@gmail.com>
	 <20100315030945.GS6491@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=DvmsWOqBqVckMtdb+8lcXhTYylUZNrU2qd2HZ71WZOQ=;
        b=xE60A5ZxQLUSU6WRTQmMC5wpVNyGonBAGR0wO78KvzOuTf6txkmdYqveD+SOzySmAZ
         rXTeFDcDDhvPwTeLHcEiYyQdovSTE11KZnSC5daXTyM/88DHAQALvWjhUP9cge30RiB8
         XRUujGUnEcCNbrHljxVU+OEvXUPCakjjl2rhg=
In-Reply-To: <20100315030945.GS6491@shareable.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jamie Lokier <jamie@shareable.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yuasa Yoichi <yuasa@linux-mips.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

2010/3/15 Jamie Lokier <jamie@shareable.org>:
> Marco Stornelli wrote:
>> Il 13/03/2010 00:31, Jamie Lokier ha scritto:
>> I agree, but the bootloader should be aware of it. I mean, usually
>> bootloaders at boot, reset the RAM, so you have to tell to the
>> bootloader that you are using a piece of RAM as persistent RAM, for
>> example U-Boot has got a specific option CONFIG_PRAM. I don't know i=
f
>> all the process can be completely transparent to the admin in all
>> situations.
>
> Sometimes you can't change the bootloader (they don't always come wit=
h
> source code). =A0Or you could, but you don't want to risk it (there
> isn't always a way to recover if you break it).
>
> Obviously then the feature is only useful when the bootloader doesn't
> clear all the RAM :-)
>
> On slow boards in consumer devices, they sometimes avoid clearing the
> RAM because that adds measurable boot time.
>

In the embedded world, usually, you can change/write the fw and you
know well the memory map, so no problem to know the address to use. In
other cases, it can be possible to use a "transparent" approach, but
in my opinion the general approach used by the driver is enough.

Marco
