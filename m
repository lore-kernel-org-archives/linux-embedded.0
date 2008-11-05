From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH] phylib: make mdio-gpio work without OF (v2)
Date: Wed, 5 Nov 2008 00:34:56 -0500
Message-ID: <8bd0f97a0811042134n3c5543bbwed7a8ebfd0e3f77e@mail.gmail.com>
References: <20081104144518.4429.37325.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
	 <200811041604.22947.david-b@pacbell.net>
	 <8bd0f97a0811041609l3bd474afh7e526be368d4c5cf@mail.gmail.com>
	 <200811042045.41052.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=hQtld9gsJrmNcSPaBi9HP1n2uMlCJsRTGYvdiT+Zj5c=;
        b=nKs7M5sw/j/4ip5fQlpSLONcNzQ0TfIEMUsb/B1bY4RuLepLg8+ERcjlh7hgwIw+qE
         LX/cmStOarwEBdyfz1JCLRMU/g6uteIj2XZXX2o1gZabcSfu5BYwtmZTp+eXFEAKjxb2
         L4cUYbYYD/pG7rQARCLGPhOoPGrviS1feXzTQ=
In-Reply-To: <200811042045.41052.david-b@pacbell.net>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Brownell <david-b@pacbell.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, Paulius Zaleckas <paulius.zaleckas@teltonika.lt>, netdev@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org, Laurent Pinchart <laurentp@cse-semaphore.com>

On Tue, Nov 4, 2008 at 23:45, David Brownell wrote:
> On Tuesday 04 November 2008, Mike Frysinger wrote:
>> > That's generally the preferred way to handle #ifdeffery.
>> > But I could imagine OF isn't (yet?) set up to handle it.
>>
>> i agree completely with the inclination to do it all in C as you've
>> suggested and let the compiler do dead code elimination, but that only
>> works if the functions in question are defined everywhere (in other
>> words, there's a linux/ api for it).  i dont think that's the case for
>> OF (which is what you were implying?) ...
>
> Only works if the functions are "declared" everywhere;
> the stuff that's included in header files.
>
> A "definition" would be available at link time (except
> for inlined functions, in headers).  Actual C functions.
>
> If indeed OF functions don't have declarations which are
> available on all platforms, that might be worth fixing
> to enable this approach to #ifdef elimination.

OF is open firmware right ?  no way there's going to be OF for every
port that supports GPIO, so filling out the stubs in linux/of_gpio.h
will need to be done.
-mike
