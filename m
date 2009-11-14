From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Fri, 13 Nov 2009 23:22:23 -0500
Message-ID: <8bd0f97a0911132022pf743558lfef1402125d4b60b@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=+65qRREeLQygDHCOy9PBXzyohAbk3ByYjlOzbBANKI8=;
        b=kSZpIMR3Pt1OxVCSHmxYfEGlRsb74hCqfTANua4/tBhqAPri7x0LbPlFuLEqM5KCHC
         fqSXaav5E/HKxXCug+teRRhxFPN+HPEG4nTdMjqi3wMCRqNi5Uj2wywX+YvzaG8MaQEy
         PtH7urlrIWMH2DqHXjqVgcEklAqPZGNHUEggw=
In-Reply-To: <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>

On Fri, Nov 13, 2009 at 14:08, Grant Likely wrote:
> On Wed, Oct 15, 2008 at 11:14 AM, Bill Gatliff wrote:
>> This series implements a Generic PWM Device API, including reference
>> implementations for the Atmel PWMC device, an LED device, and an LED
>> trigger. =C2=A0It is based on linux-2.6.27.
> [...]
>> The implementation of the Generic PWM Device API is structurally
>> similar to the generic GPIO API, except that the PWM code uses
>> platform bus_id strings instead of integers to identify target
>> deviices. =C2=A0A configuration structure is also provided, both to
>> facilitate atomic hardware state changes and so that the API can be
>> extended in a source-code-compatible way to accomodate devices with
>> features not anticipated by the current code.
>
> I'm concerned about the approach taken here. =C2=A0As I understand it=
, the
> PWM signals are very similar to GPIOs in that each PWM device control=
s
> an external signal line, just like GPIO lines. =C2=A0The difference b=
eing
> that PWMs cannot do input, and has additional capabilities (can be
> programmed with a signal; not just on/off/tristate). =C2=A0Actually, =
many
> GPIOs have these properties too. =C2=A0I've got a part with output-on=
ly
> gpios, and gpio devices that also have a PWM.
>
> What is the reason for bringing in an entirely new framework instead
> of extending the GPIO API or gpiolib? =C2=A0I'm not too excited about
> having two entirely different frameworks for what basically boils dow=
n
> to "numbered signal pins".

unifying resource management obviously makes sense so as to avoid
conflicts, but i dont think the fact that one pin can be multi purpose
means it should be entirely forced into the GPIO framework, nor do i
see any real gain for doing so.
-mike
