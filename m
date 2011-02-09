From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 1/5] ACPI / PM: Move references to pm_flags into sleep.c
Date: Tue, 8 Feb 2011 17:04:31 -0800
Message-ID: <AANLkTinZrhOdxZ-F+V1KLbR__PMNj-Qfc_O-xk7rJb_Y@mail.gmail.com>
References: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <201102082220.25240.rjw@sisk.pl> <AANLkTinAZphXC=7FParFnxDPQvpB1ic=FwTe7u4Txy5o@mail.gmail.com>
 <201102090137.52697.rjw@sisk.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201102090137.52697.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Ingo Molnar <mingo@elte.hu>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Tue, Feb 8, 2011 at 4:37 PM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
>
>> but maybe it would be about APM being enabled. Which is what the cal=
ler
>> actually seems to care about and talks about for the failure case. M=
aybe
>> you need separate functions for the "is APM enabled" case for the na=
ming
>> to make sense. Hmm?
>
> That sounds like a good idea. =A0What about the following patch?

This patch I have no problems with.

                    Linus
