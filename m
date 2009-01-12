From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Mon, 12 Jan 2009 09:27:32 +0100
Message-ID: <873afpj5e3.fsf@macbook.be.48ers.dk>
References: <200901020207.30359.rob@landley.net>
	<c384c5ea0901031454n451bc899w166bb146c96f6164@mail.gmail.com>
	<495FEEAF.5020005@zytor.com> <200901032006.47652.rob@landley.net>
	<20090104030619.GA21466@linux-sh.org>
	<c384c5ea0901040223l6e53f041s9f7cdea20c9d1d8d@mail.gmail.com>
	<1231677939.3517.5.camel@gimli.at.home>
	<31014a580901111936q41486efagcb90af2b6880a470@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:to:cc:subject
         :references:from:date:in-reply-to:message-id:user-agent:mime-version
         :content-type;
        bh=fyfs0rWEbCzndIhN92bY0xYbcNL51U4xV4K4JHaAMH4=;
        b=mgHuDWyaExcy8Lby5NmV+IXKwc7iTErLa6A4svW8LgF23xzbX+jGfPRLnOknTJrhi2
         l4ajavy4qvQSsocA1F9GUXEG5GNXWtoaQz/x9QEY25JkvqNXKv+mqoibi3p2g32bAvp5
         oZThrBaelF/9DuPcHNvf1GSl0aU2dNGEs1jnk=
In-Reply-To: <31014a580901111936q41486efagcb90af2b6880a470@mail.gmail.com> (Mark A. Miller's message of "Sun\, 11 Jan 2009 21\:36\:58 -0600")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mark A. Miller" <mark@mirell.org>
Cc: Bernd Petrovitsch <bernd@firmix.at>, Leon Woestenberg <leon.woestenberg@gmail.com>, Paul Mundt <lethal@linux-sh.org>, Rob Landley <rob@landley.net>, "H. Peter Anvin" <hpa@zytor.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

>>>>> "Mark" == Mark A Miller <mark@mirell.org> writes:

 Mark> And for H. Peter Anvin, before you refer to such uses as compiling the
 Mark> kernel under a native environment as a "piece of art", please be aware
 Mark> that the mainstream embedded development environment, buildroot, is
 Mark> also attempting to utilize QEMU for a "sanity check" on the
 Mark> environment.

That's for verifying that the rootfs'es actually work, not for
building stuff.

-- 
Bye, Peter Korsgaard
