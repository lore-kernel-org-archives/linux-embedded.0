From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v4 2/3] PWM: GPIO+hrtimer device emulation
Date: Sat, 12 Feb 2011 23:41:58 -0500
Message-ID: <AANLkTi=aQh8y5hhyuqdSnFWYKvacL=suo1ZTGVkwk-iZ@mail.gmail.com>
References: <1297563323-24074-1-git-send-email-bgat@billgatliff.com>
 <1297563323-24074-3-git-send-email-bgat@billgatliff.com> <AANLkTimNuz245U64MBzGNpop7oVVnVpZ04UUA=7p5CLj@mail.gmail.com>
 <AANLkTinAcF+XK-YY3q-XQHH7vR=5h+Bxioooz-0gwTm6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=yYEZ7JjqRpOnJNng5FuHdi29NGulfDpSS2unAu7BCrM=;
        b=JOPTZPDHtMMY2cczG43vRThnnIfXlswlKdlbmHZdT8kEZJumECgwQQpbyCtN0kX7BL
         2GOnRWQkBTWkQFtupOAZxUIY4xWExaiNVBDPASypl5dTerBdg8ErqoGvG77132ZTGtsq
         b4iT1iBk2pVYpewdauQIdmPxiYGcMZPVwC644=
In-Reply-To: <AANLkTinAcF+XK-YY3q-XQHH7vR=5h+Bxioooz-0gwTm6@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Sat, Feb 12, 2011 at 23:28, Bill Gatliff wrote:
> On Sat, Feb 12, 2011 at 8:53 PM, Mike Frysinger wrote:
>> document the module name in the help ?
>
> Not sure what you are asking. =C2=A0Like this?

yes, but it seems to be more common to use a style like so:
config xxx
    help
      normal help text

      To compile this driver as module, choose M here: the
      module will be called gpio-pwm.

>>> +static struct pwm_device_ops gpio_pwm_device_ops =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 .config =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D gpio=
_pwm_config,
>>> + =C2=A0 =C2=A0 =C2=A0 .config_nosleep =3D gpio_pwm_config_nosleep,
>>> + =C2=A0 =C2=A0 =C2=A0 .request =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D gpio=
_pwm_request,
>>> +};
>>
>> is this struct not constified ? =C2=A0same for some of the other str=
ucts in
>> this file ...
>
> It isn't constified, but it should be. =C2=A0But if I do, I get lots =
of
> "discards qualifiers" warnings because const isn't used in the
> functions I pass these structures to. =C2=A0So I kind of have to leav=
e it
> as-is, no?

it just means the pwm framework needs to be constified in the core code=
 first :)

>> =C2=A0is that useful if they cant call any of the config funcs ?
>
> Users of gpio_pwm aren't supposed to call the config functions in
> gpio-pwm.c, they are supposed to invoke them indirectly via the
> regular PWM API (pwm.c).

hmm, i thought the configfs integration did more than just call the
create/destroy funcs.  considering the common gpio code has sysfs
hooks for playing with gpios from userspace, perhaps there should be a
sysfs hook here too rather than requiring configfs ...
-mike
