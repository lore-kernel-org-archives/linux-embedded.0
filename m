From: "Will Newton" <will.newton@gmail.com>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 14:25:27 +0100
Message-ID: <87a5b0800806100625m5a6d20dao47b884bff663c24c@mail.gmail.com>
References: <20080610075432.GB776@uranus.ravnborg.org>
	 <20080610090924.150D9248AC@gemini.denx.de>
	 <20080610131236.GC28565@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=xRnnipDMZWI3FzTGvE0YqjC8xcWvIieBERAAW0HTC7I=;
        b=FEVn3yXnPeQJxVb9gbF3Xn/L3awkgRcjctnO1Nsfjg33miUK5ErPVItR9BCLheHM2r
         B2bmoRmK925z1lPIPuiF7ssQy3GRJFk9t/3i0oC3WI1BpdHOoUmMYVi60ouxbXVeQLy7
         lCcoCD1zKm5FQdHy2jXN3Tu2GHYmp3SO9t0+c=
In-Reply-To: <20080610131236.GC28565@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Wolfgang Denk <wd@denx.de>, Sam Ravnborg <sam@ravnborg.org>, Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

On Tue, Jun 10, 2008 at 2:12 PM, Jamie Lokier <jamie@shareable.org> wrote:
> Wolfgang Denk wrote:
>> Being unable to do this just because we now also would need a  native
>> Perl is indeed a PITA...
>
> You can run the Perl bit with "ssh remote perl", and still do the rest
> of the compile natively.  It's not pretty, but workable.

I'm not convinced it matters at all. Self hosting on an embedded
architecture is, as has been mentioned, pretty pointless.

Using a kernel compile as a test isn't such a great idea. Stress tests
of that kind are not particularly useful for pinning down bugs - so
your kernel compile failed, what now? Far better to use LTP tests or
similar that are designed to be reproduceable and tunable for your
system. For example I don't think I'll ever be able to self host a
kernel build on a board with only 32Mb of on-board RAM.
