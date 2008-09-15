From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Mon, 15 Sep 2008 12:43:00 -0700
Message-ID: <6934efce0809151243h60a6e48bpf0c7600d4badf3c4@mail.gmail.com>
References: <6934efce0809121452kd20deb6m268715f6ed83a71e@mail.gmail.com>
	 <20080915163421.GA13631@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=s+miAZFB4TZl6JjN+GV4vlV42t2DxyvjLOrjHpp4z8Q=;
        b=v5aLZpGmIRzismCR4y1zMduxRzCH7yQm40khniStiL1ThigmtmNGwwHcwLB0C0k+cw
         N5bbL3nKFsRRi4WrG5Fpf8hUlOQqc4EJQGVw0bAxQ4fKJ12Z/RaL8+K0jhlg8Hk3k8Br
         0FqHdMZOm1v3bg2zXSGi7DMzOVixpPrGuvYBU=
In-Reply-To: <20080915163421.GA13631@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Greg Ungerer <gerg@snapgear.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

>> >> I'm using Spansion MirrorBit S29GL128N, which reads at about 0.6 MByte/s.
>>
>> If you are using a GL, you'll probably find our P33 a good fit and at
>> competitive prices to GL as I understand it.  That's I think 50Mhz.
>
> What's a GL?  Never heard of it - all I can think of is OpenGL :-)

S29_GL_128N

> I'm not sure if cache is an option with this device - but would it
> make a difference anyway?

Well the first read takes 100ns (plus the other chipset overhead
300ns) but other reads in a page are only an extra 25ns each.  So your
benefit is not from having the entire executable in cache it's from
having the next 7 instructions in the cacheline for only an extra 25ns
each instead of 400ns.

> Interesting, thanks.  I'm not sure it's possible to change the way NOR
> is being used with this chip, and it'll be a while before it's
> economical to replace the board with a new design.

Usually these things can be fixed in the bootloader or by hacking the
kernel to tweak the relevant chipset registers.
