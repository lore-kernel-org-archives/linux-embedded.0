From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Fri, 22 Aug 2008 11:16:20 -0700
Message-ID: <6934efce0808221116w76a662b0t954b0922b69d3232@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
	 <6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>
	 <48AE0476.80109@snapgear.com> <20080822181314.GB24179@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=jfkBy/BluqhkIUkp7anCC2babsKGryzqUGueihWz5YY=;
        b=X3tVVr9gxEUtyO/vInWQAch+OXA9bsodRmfY++lgvig1DTrh7lO43UPZVBVr5KTQOW
         J3fovyLo7o9c3bV17CSEq/WZuKw72FfTLG/6wUTPuJqe2igmj99vNEpQ0+xeq5UFRE1A
         puLOkLUbRaX+fqL3nAw/IeSF7Un+Rr4aCPKiI=
In-Reply-To: <20080822181314.GB24179@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Greg Ungerer <gerg@snapgear.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Fri, Aug 22, 2008 at 11:13 AM, Jamie Lokier <jamie@shareable.org> wrote:
> Greg Ungerer wrote:
>> One thing for sure is that many people who do non-MMU setups
>> are interested in XIP to get the space savings. These are very
>> often small devices with very constrained RAM and flash. (For
>> whatever it is worth single NOR flash only boards are common in
>> these smaller form factors :-)
>
> I'm using XIP on a device with 32MB RAM.  The reason I use it is
> _partly_ to save RAM, partly because programs start about 10 times
> faster (reading NOR flash is slow and I keep the XIP region in RAM)

What kind of NOR you using?  That is not what I measure with fast
synchronous burst NOR's.
