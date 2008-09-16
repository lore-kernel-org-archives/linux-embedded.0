From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Tue, 16 Sep 2008 08:30:16 -0700
Message-ID: <6934efce0809160830v461a115ch305aeaadaf5d9883@mail.gmail.com>
References: <20080915163421.GA13631@shareable.org>
	 <Pine.LNX.4.64.0809160856190.5966@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=gmvV2tNDVXU15cs8MMJA9ZQPPW3w2dl5njcG3mTs98o=;
        b=IAJcQuw4zQAybXWWU1EUjEh0OBS7SH1jdNGjOlIGGn6Y70rqIQ7p6ZQv5Pl6Hoc0Gg
         CJhaxq3GI50iCmMVu73BZB/JyCLc/FtNrg3i1rhYMofEaKObQqBguEwIU2sBbFIFHTOP
         KSkr7vtPnbq1yX5JisaI+7TKR17lwIv4N47WA=
In-Reply-To: <Pine.LNX.4.64.0809160856190.5966@lnxricardw.se.axis.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Jamie Lokier <jamie@shareable.org>, "cotte@de.ibm.com" <cotte@de.ibm.com>, Greg Ungerer <gerg@snapgear.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "nickpiggin@yahoo.com.au" <nickpiggin@yahoo.com.au>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, "Linux-kernel@vger.kernel.org" <Linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, "tim.bird@am.sony.com" <tim.bird@am.sony.com>

> NAND is significantly faster when writing than NOR, read speed is of the
> same magnitude, possibly slower in many cases.

Right.

Specifically, read bandwidth is on the same order of magnitude.
However the read latency of NAND is a couple orders of magnitude
higher (100ns vs 20,000ns) so it depends on what you are doing.
