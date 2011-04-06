From: Ben Gardiner <bengardiner@nanometrics.ca>
Subject: Re: [PWM v9 2/3] PWM: GPIO+hrtimer device emulation
Date: Wed, 6 Apr 2011 09:17:58 -0400
Message-ID: <BANLkTikzBHJxToLPXQZCLN-GjbYHMfASLw@mail.gmail.com>
References: <1301630392-20793-1-git-send-email-bgat@billgatliff.com>
	<1301630392-20793-3-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nanometrics.ca; s=google;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=8fv7OsTXSDLtOyVd90mfZ9vaVQe+k7rcKJlXDBdUO5c=;
        b=jwCX78UVdC97mAJgYLD4Twa6x9mwbPU+QuydYwoa65OT7+sbjMUt/H6kz3nlnNYIBm
         pAef32ZiMiSrhMDwx7V0dd7391aDgJyE6WBCSacYGWKgconBOicclEo6sbUud85avSQ0
         Ff1BMenwaYyDHcve7w/QD/Yidr/VHBEjmHSHA=
In-Reply-To: <1301630392-20793-3-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Hi Bill,

I tested this series on da850evm from commit
60124de319dc2800c0f75f44bf84471a8de0dbc5 of
git://git.billgatliff.com/pwm.git.

With the following commands I was able to observe the production of a
100Hz 50% output on a GPIO (specifically GPIO #125 which is GPIO7[13]
on the SoC and J15[13] on the baseboard for other da850 users).

     mount config /config -t configfs
     mkdir /config/gpio_pwm/125
     echo 1 > /sys/class/pwm/gpio_pwm\:125/export
     echo 10000000 > /sys/class/pwm/gpio_pwm\:125/period_ns
     echo 5000000 > /sys/class/pwm/gpio_pwm\:125/duty_ns
     echo 1 > /sys/class/pwm/gpio_pwm\:125/run

I noticed that the following command did not stop the pwm output.
     echo 0 > /sys/class/pwm/gpio_pwm\:125/run

But the following command did (and I did not need to echo 1 >
/sys/class/pwm/gpio_pwm\:125/unexport first)
     rm -rf /config/gpio_pwm/125

The observations from my testing above are repeated in context below:

On Thu, Mar 31, 2011 at 11:59 PM, Bill Gatliff <bgat@billgatliff.com> w=
rote:
> Emulates a PWM device using a GPIO pin and an hrtimer. =A0Subject
> to CPU, scheduler and hardware limitations, can support many
> PWM outputs, e.g. as many as you have GPIO pins available for.
>
> On a 200 MHz ARM9 processor, a PWM frequency of 100 Hz can be attaine=
d
> with this code so long as the duty cycle remains between about 20-80%=
=2E
> At higher or lower duty cycles, the transition events may arrive too
> close for the scheduler and CPU to reliably service.
>
> This driver supports creation of new GPIO+hrtimer PWM devices via
> configfs:
>
> =A0 # mount config /config -t configfs
> =A0 # mkdir /config/gpio-pwm/<gpio number>

minor: I observed that the configfs directory was 'gpio_pwm' not 'gpio-=
pwm.'

> The new PWM device will appear as /sys/class/pwm/gpio-pwm.<gpio numbe=
r>.
>
> Caveats:
> =A0 * The GPIO pin number must be valid, not already in use
> =A0 * The output state of the GPIO pin is configured when the PWM sta=
rts
> =A0 =A0 running i.e. not immediately upon request, because the polari=
ty of
> =A0 =A0 the inactive state of the pin isn't known until the pwm devic=
e's
> =A0 =A0 'polarity' attribute is configured
> =A0 * After creating and binding the pwm device, you must then reques=
t
> =A0 =A0 it by writing to /sys/class/pwm/gpio-pwm.<gpio number>/export
>
> Unbind and destroy the pwm device by first stopping and unexporting
> the pwm device under sysfs as usual; then do:

I observed that

# echo 0 > /sys/class/pwm/gpio_pwm\:125/run

did not stop the pwm output and that

# echo 1 > /sys/class/pwm/gpio_pwm\:125/unexport

was not required before rm -rf'ing the /config directory:
> =A0 # rm -rf /config/gpio-pwm/<gpio number>

> Signed-off-by: Bill Gatliff <bgat@billgatliff.com>

Overall this is a really easy to user userspace interface -- it was a
pleasure to setup and test.

Tested-by: Ben Gardiner <bengardiner@nanometrics.ca>

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
