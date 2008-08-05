From: Bernhard Fischer <rep.dot.nop@gmail.com>
Subject: Re: [patch 1/4] Configure out AIO support
Date: Tue, 5 Aug 2008 20:36:43 +0200
Message-ID: <20080805183643.GJ9208@mx.loc>
References: <20080731092703.661994657@free-electrons.com> <20080731093220.690886851@free-electrons.com> <20080731100929.GA9206@mx.loc> <20080731101219.GC4221@cs181140183.pp.htv.fi> <20080731224222.GB9208@mx.loc> <20080805181536.GH22895@cs181140183.pp.htv.fi> <20080805182607.GA28513@shareable.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=xIXvbyuen/TQTH5wDb5hvm7XqrPR+lZ9e3A4QEHVEFs=;
        b=H1It026eulrYOWd5yh0hvJa4Ea8GbGQrF4zJzI+LSMChCXS1VevPQ6FaH7Ra6IMsah
         /U5bbDqdU4qmwwdH4vc+CZMXK3Omu9k11DQnuz0u6kUxDZNttkrqKshkne2S9PA2nsaX
         6L+Co92Br+PRYaQxpu7vTTydiAGk/vdVMEO/Q=
Content-Disposition: inline
In-Reply-To: <20080805182607.GA28513@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Adrian Bunk <bunk@kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, bcrl@kvack.org, linux-aio@kvack.org, akpm@linux-foundation.org

On Tue, Aug 05, 2008 at 07:26:07PM +0100, Jamie Lokier wrote:

>> > >The userspace headers are independent of any kernel configuration
>> > >(except for the architecture).
>> > 
>> > I beg to disagree:
>> > internals as exposed by e.g. aio_abi.h are impl dependent. Noone except
>> > the impl and it's users are interrested in it.
>> >...
>> 
>> That's utter bullshit.
>> 
>> The contents of aio_abi.h is a kernel<->userspace ABI that mustn't ever 
>> change. [1]
>
>Case in point:
>
>I want to be able to compile an application for embedded Linux which
>*can use* Linux-AIO, but can also run on a kernel which has Linux-AIO
>removed by this patch.
>
>I still want to compile the application with that capability, in case
>it's run on another kernel with it enabled.
>
>I shouldn't have to have a separate, special kernel with all options
>enabled, just to compile applications that run on multiple kernels and
>use run-time features when available.
>
>Just like all the other kernel<->userspace interfaces, the header
>files (including their presence) shouldn't depend on kernel
>configuration at all.

alright, makes perfect sense. I must have been playing too much with
libc recently, i guess.

thanks,
