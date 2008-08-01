From: "Constantine Shulyupin" <const@linuxdriver.co.il>
Subject: Re: conceptual map of the kernel source (Interactive Linux kernel map)
Date: Sat, 2 Aug 2008 01:28:01 +0300
Message-ID: <8aa6b0650808011528x62268bc4l35ebb16cca9ae6c0@mail.gmail.com>
References: <8aa6b0650807310644g10b8ce3dvd634d482cab659ea@mail.gmail.com>
	 <63386a3d0808011507h28aa213mb27d32b2f855b9ac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=/QNswe4sARH4h9o8OFJdWNOEEIinp0PQf/Z+KvwwBe8=;
        b=iLvDle5tTHMM3qFZy4kNJwqCBDoywLNt72+kJFekreTBEAlONm2PBPpUluTXg7SQcI
         yCdWhtkscPpDragM0epsDCtZV4cwJsRHYKgCCnBDiPdLxwOWymW97oBHe43DtUMGlsoI
         FsYZCeJN9MRcSRM2T0Gvf5QfpqrQQCvmmccbI=
In-Reply-To: <63386a3d0808011507h28aa213mb27d32b2f855b9ac@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: linux-embedded@vger.kernel.org

Thank you for idea.
I wish to make map of embeedded Linux in future.
Now I focus on "generic" kernel.

On Sat, Aug 2, 2008 at 1:07 AM, Linus Walleij
<linus.ml.walleij@gmail.com> wrote:
> 2008/7/31 Constantine Shulyupin <const@linuxdriver.co.il>:
>
>> I am updating the kernel map: http://www.makelinux.net/kernel_map
>> It is conceptual map consisting of more than 200 most important kernel
>> functions.
>
> I was very impressed once I saw this map first, which was through
> your (?) contributions to the Linux entries in Wikipedia. Keep up the
> good work!
>
>> Could you please have a look and suggest fixes and updates.
>
> The embedded systems will be interested in most things not
> asm-i386 and arch-i386. For example you show a lot of PCI
> and such things in the lowest layers, I wonder if it'd be worth
> the effort to make arch-specific views of the lowermost parts
> (but probably not).
>
> Another this is that flash drivers MTD, doesn't fit into the picture,
> instead harddisk is uses as example.
>
> Linus
>



-- 
Constantine Shulyupin
Freelance Embedded Linux Engineer
054-4234440
http://www.linuxdriver.co.il/
