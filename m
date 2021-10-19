From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Matt Mackall as his identity is
 obsolete
Date: Tue, 19 Oct 2021 15:24:08 -0700
Message-ID: <7hlf2oejqv.fsf@baylibre.com>
References: <20210920080635.253826-1-u.kleine-koenig@pengutronix.de>
 <CA+bK7J741D=DgZMNeEC5xg9kDDSaJu19QsRunVvXkBGx1mKGnQ@mail.gmail.com>
 <YW5r61ZQx+E9xfuH@pendragon.ideasonboard.com>
 <57122a67509bebdf0d1b9f5bc15db116e0124e5d.camel@infradead.org>
 <YW6UGP10hfGJ2kYy@pendragon.ideasonboard.com>
 <CAMuHMdVCrC5_AjNDJN+nwrnn=EVTfD-8ddG=FaFBBh_0UY5acQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-crypto-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version:content-transfer-encoding;
        bh=1HjkJ/s77qpPQedlx0RgSf6Pe/gtFpXgvkvC8dCGFU0=;
        b=BxTLhk9+ebegQi7VeiuJ8gELz4u56+OXRjyqMZBoX0LqA7qfsOxJSz29PFrPQ2a5RY
         LcxqHlpG5bSgJ3CFC57RhTH/R1HJkTDhjH7E7MLDPRTHfCwF3VUpggNElqDqkUS2LMrz
         WrNip9ynF/P+x0QTDG0K5z9ZML7kLwU/Wcllgd4JYzKccvn0TPybqUlBx1mDIHh66jJF
         cahqD9ok9M1Xuk1xeoHgN0qA9CMsGamHAulesB+mv/0r6Qwjtu5IdwmFHnOlMxAZ7Zge
         8pj6oZJmyZ45JDp8Niu4HYLZB6PLDBK0UzjfbGSLG2hZeMLFKj0odEo1QVoz6EIjCDWe
         OMuA==
In-Reply-To: <CAMuHMdVCrC5_AjNDJN+nwrnn=EVTfD-8ddG=FaFBBh_0UY5acQ@mail.gmail.com>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Tim Bird <tbird20d@gmail.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Linux Embedded <linux-embedded@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Matt Porter <mporter@konsulko.com>, Thomas Gleixner <tglx@linutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tim Bird <tim.bird@sony.com>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On Tue, Oct 19, 2021 at 11:48 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Tue, Oct 19, 2021 at 10:33:10AM +0100, David Woodhouse wrote:
>> > On Tue, 2021-10-19 at 09:55 +0300, Laurent Pinchart wrote:
>> > > On Mon, Oct 18, 2021 at 03:17:22PM -0600, Tim Bird wrote:
>> > > > I think an overhaul of the "EMBEDDED LINUX" MAINTAINERS entry
>> > > > is long-overdue.
>> > > >
>> > > > No offense to any of the 3 persons listed, but I think the kernel =
developer
>> > > > community would be better served by a group of individuals with a =
more
>> > > > current active role in embedded linux.  I have a few names I'll
>> > > > toss out for
>> > > > candidates: Matt Porter, Kevin Hilman, Thomas Gleixner,  Thomas
>> > > > Petazonni, Laurent Pinchart, and Uwe Kleine-K=C3=B6nig (and maybe =
even
>> > > > myself).
>> > > >
>> > > > This entry in the MAINTAINERS file is somewhat special, in that it
>> > > > covers a "field of endeavor" rather than a specific set of files or
>> > > > directories.
>> > > >
>> > > > Thoughts?
>> > >
>> > > Thank you for volunteering me :-)
>> > >
>> > > I was indeed wondering about this particular MAINTAINERS entry. As it
>> > > doesn't cover any particular set of files, directories, drivers,
>> > > subsystems or architectures, what does being listed here endeavour ?
>> >
>> > Basically nothing; I was going to suggest removing it entirely. There's
>> > certainly no point listing me there any more.
>> >
>> > Once upon a time it involved a certain amount of heckling about memory
>> > usage and "your hash table doesn't need to be that large" but that ship
>> > sailed a long time ago :)
>>
>> Heckling is still an option without a MAINTAINERS entry I suppose :-)
>
> Don't worry, I keep on sailing ;-)
>
>> I wouldn't object if we were to remove it.
>
> +1
>

Agreed.  Let's just drop this entry.

Kevin
