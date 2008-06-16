From: Bernhard Fischer <rep.dot.nop@gmail.com>
Subject: Re: cross-compiling alternatives
Date: Mon, 16 Jun 2008 18:45:40 +0200
Message-ID: <20080616164540.GC22089@mx.loc>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806130843.05704.neundorf@eit.uni-kl.de> <1213346316.17853.28.camel@tara.firmix.at> <200806131106.18487.neundorf@eit.uni-kl.de> <1213351433.17853.61.camel@tara.firmix.at> <20080613151634.GJ11760@nibiru.local> <1213382709.17853.79.camel@tara.firmix.at> <20080616040854.GG12962@nibiru.local> <87zlplj0ot.fsf@macbook.be.48ers.dk> <20080616143315.GB9141@nibiru.local>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=gRoNmdRg/wa5hHn7FMp69xHsHpazvSHrzg6Yg3xhLtg=;
        b=c5Sq4i/Pkg4LYMnwLKSSmOBU2DdqqT1gYP3JtnVWHjPdiVl8HWE9cMg/vLFfIPQqqw
         Tx+VrkHe02+KgQiMKK3rMcD9PJtlUbeGcgOWsCuUotewGNYISYwbEljxinggizN9al2Z
         JNVgT4wLQLpHD5Nd6vepMFTAK5/pwHq76ICQw=
Content-Disposition: inline
In-Reply-To: <20080616143315.GB9141@nibiru.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Mon, Jun 16, 2008 at 04:33:15PM +0200, Enrico Weigelt wrote:
>* Peter Korsgaard <jacmet@sunsite.dk> schrieb:
>
>Hi,
>
>> Notice that sysroot is broken in 0.23 (it removes everything else than
>> -I / -L words). Patches have been posted to the pkgconfig list several
>> times.

heh, so it keeps e.g. -I=/usr/include ? Fun ;)

