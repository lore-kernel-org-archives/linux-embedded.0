From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Fri, 12 Sep 2008 13:17:28 -0700
Message-ID: <6934efce0809121317r418c80e8s4755669cc74975c4@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
	 <6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>
	 <48AE0476.80109@snapgear.com> <20080822181314.GB24179@shareable.org>
	 <6934efce0808221116w76a662b0t954b0922b69d3232@mail.gmail.com>
	 <20080822183713.GC24179@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=bgqXEwgXShRfJAHLhRB4xbw2h/RUZZSNeF+uPH5IsTE=;
        b=N2/8Wa7X+wtpFRS8gbRfWUsK9xlU18zuQqLN60+WTFPtQ94JsO2ZZvQoeF2szx0UoW
         m9Ys0vZZ39/cIy5FlosEZBNhndhMYv+vADOui7J8ZM/2+Byqj40hGDTIw6Xnl0NeJPNJ
         NcggLuoV/Vj6ppGQO4fb6qx9MFHRfGl11crDc=
In-Reply-To: <20080822183713.GC24179@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Greg Ungerer <gerg@snapgear.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> I think the "fast" in "fast synchronous" gives it away :-)

Yes, I suppose it does.

> I'm using Spansion MirrorBit S29GL128N, which reads at about 0.6 MByte/s.

I think you should get more like an order of magnitude higher.... Get
an expert to look at your timings in the bootloader.  Make sure things
are cached too.  ioremap_cached()...

> Not because they're good, but because that's what the board I'm coding
> for has on it.  I presume they were cheap and familiar to the board
> designers.  (There is 32MB of RAM to play with after all.)
>
> So start a sequence of Busybox processes from a shell script is noticable,
> if it reads from NOR each time.
>
> Oh, and it's a 166MHz ARM, so it's quite capable of decompressing
> faster than the NOR can deliver.

Depends on how you are measuring it.   You ought to be able to get at
least 2 orders of magnitude higher read speeds with a good sync Flash.
 Some of the newer stuff is even faster.
