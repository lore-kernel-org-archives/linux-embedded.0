From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 06/14] Pramfs: Include files
Date: Mon, 22 Jun 2009 08:23:38 +0200
Message-ID: <2ea1731b0906212323h6ed8621dg22e1bc8638c26e2c@mail.gmail.com>
References: <4A33A7EC.6070008@gmail.com> <200906140059.57362.arnd@arndb.de>
	 <4A3E68CD.6080803@gmail.com> <200906212222.25434.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=eb8JjuTEsMURrnlk8RA0hMyD1XagWM6m6+2YfMRK8o4=;
        b=DoM/DwjnkpbOQSnR2PEVsGv3itzFj6vHDIng4ODi8/tfX4oCyrebUe7Xvrc5lYR7fm
         4O4wmx5ksEFxR3no5u6yHG8OezCr6/qL4FbjsDoZfk8Ie+NYZ7pRLTuS06mS6eMgs/5b
         tlM5idVzagPZqzyLJV1KfrsrlUWQs+lctBBGk=
In-Reply-To: <200906212222.25434.arnd@arndb.de>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

2009/6/21 Arnd Bergmann <arnd@arndb.de>:
> On Sunday 21 June 2009, Marco wrote:
>> I was thinking about your comment and I think I'll use __kernel_off_=
t
>> for the exported headers. I know that it will differ between 32 and =
64
>> bit architectures, but for this kind of fs there isn't any compatibi=
lity
>> problem at layout level. You cannot remove a chip of RAM from a boar=
d
>> 32bit little endian and attach it to a board with a cpu 64bit big
>> endian, the memory isn't a disk. Indeed, I see that tmpfs uses simpl=
y
>> "unsigned long" in the exported header file without any problems to
>> little or big endian.
>
> It's still a problem. You might be creating a file system image
> for an embedded board with a different endianess.

It's not possible to create an "image" with pramfs, it's like tmpfs.

> Or even on the same machine, you could be looking at the file system =
contents
> with a 32 bit process running on a 64 bit kernel.
>
> =A0 =A0 =A0 =A0Arnd <><
>

Yes, indeed the most important thing is to be sure that a 64bit kernel
works well. I'll try to test it in this environment. If there are
"64bit guys" to help me to test it, it'd be great.

Marco
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
