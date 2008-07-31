From: Bernhard Fischer <rep.dot.nop@gmail.com>
Subject: Re: [patch 1/4] Configure out AIO support
Date: Thu, 31 Jul 2008 12:09:29 +0200
Message-ID: <20080731100929.GA9206@mx.loc>
References: <20080731092703.661994657@free-electrons.com> <20080731093220.690886851@free-electrons.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=s6gnLd8w8RvZQFe1Ahy3ZHgE7ljVlVNk6J3Czui74Ng=;
        b=P34G3+kEjlu53QDLL+hKQ8q6RsC5VEGAd/SrrXOwqEFzmhhuV8PCwWi/MrOxz//yug
         67qEeAWtCFdSh76v0re4Cv3JktEYXHHkfNgn1rX30Ljl3hqOwLoTZsbO9FB24dToZzow
         TWukw0a7ewMTDiXEj78GskNUBctoy/6U/VcbI=
Content-Disposition: inline
In-Reply-To: <20080731093220.690886851@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, bcrl@kvack.org, linux-aio@kvack.org, akpm@linux-foundation.org

On Thu, Jul 31, 2008 at 11:27:04AM +0200, Thomas Petazzoni wrote:
>This patchs adds the CONFIG_AIO option which allows to remove support
>for asynchronous I/O operations, that are not necessarly used by
>applications, particularly on embedded devices. As this is a
>size-reduction option, it depends on CONFIG_EMBEDDED. It allows to
>save ~7 kilobytes of kernel code/data:

Shouldn't this also make sure not to install aio_abi.h or at least an
empty aio_abi.h?
