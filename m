From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 19:48:13 -0700
Message-ID: <6934efce0808211948kd12ba76k1ee847a0e08010e0@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
	 <6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>
	 <48AE0476.80109@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=xRpnuGnBDVJqz9QPsI1b7gJtf71OeBZvwaqY1+mLq+g=;
        b=VYXBlZy5gXoG7S2rdkpxfxZ3XHE2QzqHzB7st/AnDFizXRIbcVAEkY0NBlGzVRrOgw
         9Vv+r6E/r+OKjv+eZV50hwssy9U7EWA6YKs2WPIQ+ed2AQxYN1K3MYAyqYMRzupuay/P
         oy92HgIXc+VIy4Mga7xT38d8eRa6vH7Z1ysDk=
In-Reply-To: <48AE0476.80109@snapgear.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg Ungerer <gerg@snapgear.com>
Cc: Jamie Lokier <jamie@shareable.org>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> That would be enough I think. If you could manually select
> which files are contiguous-and-uncompressed that would be
> useful for some too here.

So.... If you don't have an MMU when do you call ->fault?  Does the
noMMU code just loop through ->fault()ing all the pages in an mmap()?

> One thing for sure is that many people who do non-MMU setups
> are interested in XIP to get the space savings. These are very
> often small devices with very constrained RAM and flash. (For
> whatever it is worth single NOR flash only boards are common in
> these smaller form factors :-)

True.
