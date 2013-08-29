From: Steve deRosier <derosier@gmail.com>
Subject: Help wake from standby with ARM external nIRQ line
Date: Wed, 28 Aug 2013 21:49:13 -0700
Message-ID: <CALupW3DD9LNLAkCMXnquh=0dRV=V-gne5MYR2B=c4-pnXtu1RA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=8lyM3Za4uiN1CuYGfSG55wM8te6w51cDU/zzPyg67l0=;
        b=1JdHio6iiMaZa8yctZTP0iOAlT1OV5zemvG9fOyhKQmHPwV9EJnnxqwMSoTlDN4FJ4
         YChHxYw08IonRvtSyFpyjdlMZBlDwDsoNVAKwDXRXlF7vs5rCJ88TvFBjPUd1aqF8NGk
         MNcM4rjjexqXh+7gsaNnVaSjCsjvSvhpkGe9GLoiXAZ6zIzkznkQHrYC/zyKhjYcf3yA
         t5wdE3CCmSay96vqxtMbA0BLqVhfoAGGfr4MTN3coWL6eZJjevK6KBQQBjZ2DYitXZPb
         lesMv/gL/ShRwalmcLGgdkUk6uMpT9n/oTSIo1VdDVvsDy7XBVLhk0YDohoQ8pNf5aDW
         vegQ==
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Hi,

I need some help trying to get an ARM based system to wake from
standby using the external nIRQ line.

It's a custom system based on the at91sam9g25ek.  We have a
push-button attached to the nIRQ line on PB18. I want to be able to
put the system in standby (`echo standby > /sys/power/state`) and then
wake it by pressing the IRQ button.

I've taken the following steps:

1. Added the proper pinctrl entry in the DT to put PB18 on
perhipherial A (nIRQ function):

pinctrl@fffff400 {
    #address-cells = <1>;
    #size-cells = <1>;
    compatible = "atmel,at91sam9x5-pinctrl",
"atmel,at91rm9200-pinctrl", "simple-bus";
    ranges = <0xfffff400 0xfffff400 0x800>;

    /* shared pinctrl settings */
    irqbtn {
        pinctrl_irqbtn: irqb-0 {
            atmel,pins =
            <1 18 0x1 0x1>; /* PB18 periph A (IRQ) with pullup */
        };
    };


Unfortunately, problem #1: when I checked PIO_PSR on the running
system the pin was still set as GPIO.  There's no conflicting setting
that I can find, so maybe I need to do more to get PB18 set as periph
A?

2. OK, fine, I manually set the PB18 pin on the running system to
perhph A so it does the nIRQ function to the interrupt controller.  As
a test, I also manually set the interrupt mask to enable an interrupt
on that pin.  Quick push test shows a result in dmesg:
[12547.023437] irq 0, desc: c38040a0, depth: 1, count: 0, unhandled: 0
[12547.023437] ->handle_irq():  c006155c, handle_bad_irq+0x0/0x21c
[12547.023437] ->irq_data.chip(): c04f59fc, no_irq_chip+0x0/0x5c
[12547.023437] ->action():   (null)
[12547.023437]    IRQ_NOPROBE set
[12547.023437]  IRQ_NOREQUEST set

Yay, did something good.  Yes, I know I don't have a handler set,
should be OK for now...

3. Now, I put the thing into standby.  Based on the Datasheet and what
I know about ARMs and what I read in the pm.c and related files, if
the nIRQ button is set as IRQ function, on standby the AIC will still
be clocked and when the ARM is in cpu idle (wait for interrupt),
either the nIRQ or nFIQ line can wake the processor, and it'll pull
out of the idle mode (cpu_arm926_do_idle line 102 in
arch/arm/mm/proc-arm926.S).  In pm.c's at91_pm_enter(), it will return
from the at91sam9_standby() call, turn on interrupts and gpios and
continue.

Yet, I setup my pin, my IMR and put the sucker to standby.  Press the
button... no response.  Can't wake it.

4. Fine, try one more thing.  I noticed when I force pm to bypass the
real standby code so I can see the various log messages, I see that
the one it prints that gives me the wakeup masks and my pin doesn't
show.  OK, so I hack at91_irq_suspend() to || 0x80000000.  Still no
joy.

Clearly there's something fundamental I don't understand about waking
the processor from idle mode via an external nIRQ interrupt.  I can't
even get this thing setup manually to make it work. I do know the pin
functions and I've managed to get it in nIRQ mode.  Just can't get
standby to wake.

I don't mind figuring out how to hack it up and get it manually
configured to work and then later figuring how to properly integrate
this into my system.  I need it to work and I'll make it pretty in my
next step.

Any Linux ARM experts out there that can give me a push in the right direction?

Thanks,
- Steve
