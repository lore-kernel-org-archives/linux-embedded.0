From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM v5 1/3] PWM: Implement a generic PWM framework
Date: Sun, 20 Feb 2011 18:38:28 -0600
Message-ID: <AANLkTim3UfTO9u3gL5Nb9Cdsp-qZA7koLBfHbCh=cGmj@mail.gmail.com>
References: <1298175043-31727-1-git-send-email-bgat@billgatliff.com>
	<1298175043-31727-2-git-send-email-bgat@billgatliff.com>
	<AANLkTimpo=N8GNZxwkqAWuXqOgvtmqyGcn596rOGSuZv@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTimpo=N8GNZxwkqAWuXqOgvtmqyGcn596rOGSuZv@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike:


Thanks for the great feedback and detailed going-over.  Will fix all
your points, but have a question:

On Sun, Feb 20, 2011 at 4:46 PM, Mike Frysinger <vapier.adi@gmail.com> =
wrote:
>> +#ifdef MODULE
>> +module_init(pwm_init);
>> +module_exit(pwm_exit);
>> +MODULE_LICENSE("GPL");
>> +#else
>> +postcore_initcall(pwm_init);
>> +#endif
>
> i dont think you need this MODULE trickery. =A0common code already ta=
kes
> care of this for you, and it'd let you avoid a warning about pwm_exit
> being unused.

So the postcore_initcall() becomes equivalent to module_init() when I
build as a module?  That would make sense, but I had never thought
about it before now...


b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
