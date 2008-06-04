From: Bernhard Fischer <rep.dot.nop@gmail.com>
Subject: Re: [PATCH] console - Add configurable support for console charset
	translation
Date: Wed, 4 Jun 2008 21:21:37 +0200
Message-ID: <20080604192137.GD27768@mx.loc>
References: <48447615.5050806@am.sony.com> <20080604103353.GC27335@cs181133002.pp.htv.fi> <20080604183432.GC27768@mx.loc> <20080604190146.GE4189@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=dUVvMBHgID9yOVgqCNdxeP9HtAusQdgW3GM/rhtPDJo=;
        b=snbEYyg6VAfN5YxdFj/7yq9qm49KeJ2M+miP/UDC3oqo/Ktv0AoLZGSXPY5ygwvpbO
         hZsp9SJlifGx/zHZjPhW0tVSgEvRwfzAa0SSPkrWJ6Fee6mVFjtY8bzYlLIa8cERxWYw
         RXHUn/vtLxGL5w+2qFXSeu4t5R+hCM8QO6H3U=
Content-Disposition: inline
In-Reply-To: <20080604190146.GE4189@cs181133002.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@kernel.org>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Wed, Jun 04, 2008 at 10:01:46PM +0300, Adrian Bunk wrote:
>On Wed, Jun 04, 2008 at 08:34:32PM +0200, Bernhard Fischer wrote:
 
>> Current kernels are too big, they tend to be about 1MB (ignoring lzma or
>> gz compression), a couple of years back an ide- and network-enabled
>> kernel with 8139too (or whatever -nic you use in qemu nowadays) was at
>> least 30% smaller.
>
>No disagreement that the kernel could (and should) become smaller for
>situations where the kernel size matters.
>
>My question is only about whether *this kind of patches* is the correct 
>approach.

Every dozend of bytes less helps to some degree. I can boot a smallish
testsystem in qemu with 4MB ram and have a useable userspace in 120k or
up to 1.2MB diskspace to play with.

The kernel ultimately needs the vast majority of resources in such a
system; most of the RAM and most of the diskspace (assuming a
comfortable userspace with 500k). Booting with 2MB didn't work last time
i tried. This imbalance is something we should fix.

So yes, 5k help, several 5k help more. I can see how it's problematic to
represent that in menuconfig without adding too much clutter but still
letting the user decide whether or not to include certain families of
features, but that should not turn out to be a real problem.
