From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] console - Add configurable support for console charset translation
Date: Wed, 4 Jun 2008 21:15:22 +0200
Message-ID: <20080604191522.GA18873@uranus.ravnborg.org>
References: <48447615.5050806@am.sony.com> <20080604103353.GC27335@cs181133002.pp.htv.fi> <4846E44A.1010601@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4846E44A.1010601@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Adrian Bunk <adrian.bunk@movial.fi>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

> 
> I can do a more controlled comparison if you're interested.

What would be really useful would be to do some king of automated
monitoring of the size of individual parts of the kernel in
a few controlled configs.
And then as son as somethings grows with > 1% for example then to
bring this to lkml.
Doing this based on linux-next would allow us to catch the bloaters
while they are still or just have been doing certain changes.

It would be nice to tell someone that just enabled som new gcc option
that this had a cost of 163.432 bytes with a certain config.
This would get attraction and be dealt with.

Doing so three months later or maybe one year later would often
get less focus (if the individual commit ever got identified).

Now how to do so I dunno - that would require a bit of tweaking
before working reliable. But the value of being quick here would
pay of this soon I think.

	Sam
