From: "Paul Gortmaker" <paul.gortmaker-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Some embedded topics
Date: Wed, 28 May 2008 22:09:18 -0400
Message-ID: <7d1d9c250805281909t37925d57n54fa982f990d1509@mail.gmail.com>
References: <483C83DE.3040604@cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=rxvg8TptzkZT49YeTAAwLWXY3Ojf5G+fGDYspBYCrwQ=;
        b=dgoVNPvPMvnB4o8XZ66CUwCMqlWHxTXsxuLjcEmLrhdA0MNrSxjeOwbw2MouNJzLWaajQHdcpFwsIhhhz2tMk4T1HRfu+VuRo1Wa88tCXb2C8/jbZGWh2EI7fChrSL89+EjjDIp1PuS+LtdretGJwKiD0dwMtuMJ8eh2Cy/TyEU=
In-Reply-To: <483C83DE.3040604-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, May 27, 2008 at 5:57 PM, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
> Since I'm at least partially to blame for creation of this mailing list (I
> asked Andrew Morton for one at the CELF Conference), I thought I might as
> well stir things up by throwing a few features out there that I think would
> improve the Linux kernel for use in the embedded world:
>

[...]

>
> On-line Disk Partitioning
> -------------------------
> Server and desktop systems partition their disks at installation time, but
> some applications require that partitioning be done after we are already
> using a root filesystem on disk. We only have one disk and the driver
> specifically prevents changing the partitioning while a disk partition is in
> use. Note that we don't want to change the root partition, just other
> partitions. This drives the need for some sort of on-line partitioning that
> allows changing partitions that aren't in use.

Interestingly enough,  I remember when this sort of thing used to just
simply work as-is.  Meaning that if you weren't shuffling partitions that
were actively in use, then all was well.   I've no idea when it became
"broken", but there have been times when I've wanted to do just this
sort of thing, and it hasn't been specific to an embedded target.  It sounds
like a reasonable thing to have on the radar.

Paul.
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
