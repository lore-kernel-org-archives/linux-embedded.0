From: Bernhard Fischer <rep.dot.nop@gmail.com>
Subject: Re: [patch 1/4] Configure out AIO support
Date: Fri, 1 Aug 2008 00:42:22 +0200
Message-ID: <20080731224222.GB9208@mx.loc>
References: <20080731092703.661994657@free-electrons.com> <20080731093220.690886851@free-electrons.com> <20080731100929.GA9206@mx.loc> <20080731101219.GC4221@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=f9kz4Xnp4ARiEYSDemIdQlJ1n81+aOi4yBqaTZGCqcg=;
        b=v7wcdNlfTzzXj8T1fPlwQLEcTydBFVhgDsH4PPaJMACVcEBFqITdkP44qErVM7cJWO
         sgXvDPwukfIjnXcKv+yDGkYlwttmvNS2sKS3mkWkFwzgDJrFMDNNc1t7DmAlpuQ1+047
         WrdgsHe+9t5pIOF8kuxF0o4MzwdtHa5FFPEhE=
Content-Disposition: inline
In-Reply-To: <20080731101219.GC4221@cs181140183.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, bcrl@kvack.org, linux-aio@kvack.org, akpm@linux-foundation.org

On Thu, Jul 31, 2008 at 01:12:19PM +0300, Adrian Bunk wrote:
>On Thu, Jul 31, 2008 at 12:09:29PM +0200, Bernhard Fischer wrote:
>> On Thu, Jul 31, 2008 at 11:27:04AM +0200, Thomas Petazzoni wrote:
>> >This patchs adds the CONFIG_AIO option which allows to remove support
>> >for asynchronous I/O operations, that are not necessarly used by
>> >applications, particularly on embedded devices. As this is a
>> >size-reduction option, it depends on CONFIG_EMBEDDED. It allows to
>> >save ~7 kilobytes of kernel code/data:
>> 
>> Shouldn't this also make sure not to install aio_abi.h or at least an
>> empty aio_abi.h?
>
>The userspace headers are independent of any kernel configuration
>(except for the architecture).

I beg to disagree:
internals as exposed by e.g. aio_abi.h are impl dependent. Noone except
the impl and it's users are interrested in it.

If a per package feature, independent of arch, is off, all respective
features stuff should be off for that particular installation.

I.e. if I, for subsequent installations, choose to turn on feature, the
requested feature-stuff will be installed properly. If I, OTOH, choose
to (keep to) turn off feature, then all feature-related stuff should --
and has to be and stay -- turned off.

In the particular case of the kernel exposing unwanted API extensions
that are off, all such API reminiscences should be off, thus not
installed to my staging dir at all since i explicitely asked for doing
away with all of the API.

From a libc POV i'd agree, but from an inherently broken userspace POV
installing willingly broken stuff is just wrong and misleading, imo.
