From: "Will Newton" <will.newton@gmail.com>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 14:47:20 +0100
Message-ID: <87a5b0800806100647r178e54c0qd34cbf26f6ce24d@mail.gmail.com>
References: <20080610075432.GB776@uranus.ravnborg.org>
	 <20080610090924.150D9248AC@gemini.denx.de>
	 <20080610131236.GC28565@shareable.org>
	 <87a5b0800806100625m5a6d20dao47b884bff663c24c@mail.gmail.com>
	 <1213104800.32207.778.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=tRrq6LI6n1rCeqgqIxYErezEUTdggZyNQyFZ7120CrY=;
        b=WGEsEDAcWNEn2dbGloSyi8GiTGRcWuxhtMfSTscF8b4SIiNOiFzbKlFjOR23R4SGEv
         jeKyMTKyxqpZHYXknuxggt51x9X2XUkF7z9GK1MHkA40FA6m9hLZmwJ3N48GcqIvRovv
         rfYFpAmFUH5qiuC2q9XsDFfa+XEI2DsoULyQs=
In-Reply-To: <1213104800.32207.778.camel@pmac.infradead.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jamie Lokier <jamie@shareable.org>, Wolfgang Denk <wd@denx.de>, Sam Ravnborg <sam@ravnborg.org>, Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

On Tue, Jun 10, 2008 at 2:33 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Tue, 2008-06-10 at 14:25 +0100, Will Newton wrote:
>> On Tue, Jun 10, 2008 at 2:12 PM, Jamie Lokier <jamie@shareable.org> wrote:
>> > Wolfgang Denk wrote:
>> >> Being unable to do this just because we now also would need a  native
>> >> Perl is indeed a PITA...
>> >
>> > You can run the Perl bit with "ssh remote perl", and still do the rest
>> > of the compile natively.  It's not pretty, but workable.
>>
>> I'm not convinced it matters at all. Self hosting on an embedded
>> architecture is, as has been mentioned, pretty pointless.
>>
>> Using a kernel compile as a test isn't such a great idea. Stress tests
>> of that kind are not particularly useful for pinning down bugs - so
>> your kernel compile failed, what now? Far better to use LTP tests or
>> similar that are designed to be reproduceable and tunable for your
>> system. For example I don't think I'll ever be able to self host a
>> kernel build on a board with only 32Mb of on-board RAM.
>
> Actually, cross-building on NFS does tend to find a _lot_ of issues
> which crop up with board ports; especially PCI arbitration, DMA
> coherency, cache and MMU issues. LTP often doesn't catch the same
> problems.

It may trigger a number of bugs, I don't disagree, but as a test it is
a blunt instrument. It's likely to be hard to reproduce and have an
inconsistent failure mode. If you're really serious about testing it's
not the best solution. It's like using gcc instead of memtest86 to
test your memory. Eventually it might go wrong but you won't be much
the wiser about why, or have any way to trim your testcase down so you
can run it on an in-circuit emulator or pass it to your silicon
vendor.

> I agree that it's not so easy on a board with 32Mb of RAM, since that's
> only 4,000,000 bytes -- but 32MiB ought to be _perfectly_ sufficient :)

I would be surprised if it was possible to compile Linux with gcc 4.2
with 32MiB of total system memory.
