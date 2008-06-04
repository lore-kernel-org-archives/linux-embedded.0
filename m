From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH] console - Add configurable support for console charset
 translation
Date: Wed, 4 Jun 2008 12:23:26 -0700
Message-ID: <4846EBAE.2000604@am.sony.com>
References: <48447615.5050806@am.sony.com> <20080604103353.GC27335@cs181133002.pp.htv.fi> <4846E44A.1010601@am.sony.com> <20080604191522.GA18873@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080604191522.GA18873@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Adrian Bunk <adrian.bunk@movial.fi>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Sam Ravnborg wrote:
>> I can do a more controlled comparison if you're interested.
> 
> What would be really useful would be to do some king of automated
> monitoring of the size of individual parts of the kernel in
> a few controlled configs.
> And then as son as somethings grows with > 1% for example then to
> bring this to lkml.
> Doing this based on linux-next would allow us to catch the bloaters
> while they are still or just have been doing certain changes.
> 
> It would be nice to tell someone that just enabled som new gcc option
> that this had a cost of 163.432 bytes with a certain config.
> This would get attraction and be dealt with.

This is something I've wanted to get done for the last few
years.  We've crept towards it slowly with things like bloatwatch
and some of the automated testing CELF did for it's (currently
temporarily defunct) test lab.

But we've never gotten to the last bit, which is to fully automate
the testing at the top of tree, and send notifications.  I won't
make any promises, but this is something CELF is very interested in,
and we have parts of the required software already written.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

