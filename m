From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM v4 2/3] PWM: GPIO+hrtimer device emulation
Date: Sat, 12 Feb 2011 22:52:50 -0600
Message-ID: <AANLkTi=w7Xb=B68Myqi1Sp6c8hZW7qPJvZZuRsQOLAH0@mail.gmail.com>
References: <1297563323-24074-1-git-send-email-bgat@billgatliff.com>
	<1297563323-24074-3-git-send-email-bgat@billgatliff.com>
	<AANLkTimNuz245U64MBzGNpop7oVVnVpZ04UUA=7p5CLj@mail.gmail.com>
	<AANLkTinAcF+XK-YY3q-XQHH7vR=5h+Bxioooz-0gwTm6@mail.gmail.com>
	<AANLkTi=aQh8y5hhyuqdSnFWYKvacL=suo1ZTGVkwk-iZ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=aQh8y5hhyuqdSnFWYKvacL=suo1ZTGVkwk-iZ@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike:

On Sat, Feb 12, 2011 at 10:41 PM, Mike Frysinger <vapier.adi@gmail.com>=
 wrote:
> On Sat, Feb 12, 2011 at 23:28, Bill Gatliff wrote:
>> On Sat, Feb 12, 2011 at 8:53 PM, Mike Frysinger wrote:
>>> document the module name in the help ?
>>
>> Not sure what you are asking. =A0Like this?
>
> yes, but it seems to be more common to use a style like so:

Ok.  Will do.

> it just means the pwm framework needs to be constified in the core co=
de first :)

Actually, the pwm framework is aggressively constified (though your
suggestion has shown me one place I missed, and there are probably
others).  The complaints I can't help are the ones that come from
configfs!

>
> hmm, i thought the configfs integration did more than just call the
> create/destroy funcs. =A0considering the common gpio code has sysfs
> hooks for playing with gpios from userspace, perhaps there should be =
a
> sysfs hook here too rather than requiring configfs ...

The root issue is how to tell the kernel to create a new pseudo-device
without kernel code.  Gpiolib accomplishes that by the "export"
attribute.  I'm achieving the same thing, only with configfs.

Configfs was designed explicitly for doing such things.  The gpiolib
approach, while it obviously works, is somewhat an abuse of sysfs as I
see things.  Sysfs is supposed to merely reflect the state of the
kernel's internal device model.  Ggpiolib modifies that model state as
a side-effect of writing to an attribute.  That seems wrong, no matter
how well it works.

I'll agree that the gpiolib approach works, and that there aren't many
kernel users of configfs.  Maybe my selection of configfs instead of a
sysfs export attribute is a feeble attempt to change that... :)


b.g.
--=20
Bill Gatliff
bgat@billgatliff.com
