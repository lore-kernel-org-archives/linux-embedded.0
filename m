From: Brian Swetland <swetland@google.com>
Subject: Re: [POWER] battery calibration parameters from sysfs
Date: Mon, 7 Dec 2009 21:27:20 -0800
Message-ID: <a55d774e0912072127u33cebd65xbfe341160c314a2e@mail.gmail.com>
References: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se>
	 <20091204104930.GA28625@sirena.org.uk>
	 <A6D19A13FE030A409EC4362C172E091F0E071EB9@eseldmw101.eemea.ericsson.se>
	 <20091207114825.GA26965@rakim.wolfsonmicro.main>
	 <A6D19A13FE030A409EC4362C172E091F0E0A1FA1@eseldmw101.eemea.ericsson.se>
	 <20091207165628.GA24981@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1260250042; bh=rUwFM1gTDYKV88ypMJtz4AaV5Rg=;
	h=MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:From:
	 To:Cc:Content-Type:Content-Transfer-Encoding;
	b=D8+UuvjDJMgICb3SVNcXLfDpvOi0+ea4ldSGldqs1xoeAd7wCBbthHNCWuxVm38p6
	 zZGE/KiXlyjJrqCWD8hUg==
In-Reply-To: <20091207165628.GA24981@rakim.wolfsonmicro.main>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Rebecca Schultz Zavin <rebecca@android.com>, Mike Lockwood <lockwood@android.com>
Cc: Linus Walleij <linus.walleij@stericsson.com>, cbou@mail.ru, dwmw2@infradead.org, LKML <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org

On Mon, Dec 7, 2009 at 8:56 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
>
>> One of the things we're facing is Android, which has
>> its userspace in plain Java JNI at the end of this link:
>> http://android.git.kernel.org/?p=3Dplatform/frameworks/base.git;a=3D=
blob;f=3Ds
>> ervices/jni/com_android_server_BatteryService.cpp;h=3D8e7cadc6b680fc=
420d34
>> 1faa094c71922946fdab;hb=3DHEAD
>
> Something word wrapped that link but I think I found the same code.
>
>> If you browse down to line 275 you can see it parse the sysfs
>> attribute "capacity", then this propagates up to the battery
>> status indicator on *all* Android phones out there. So if
>> you want to run Android unmodified, this is what you need to
>> provide. They are effectively using the power sysfs as
>> their hardware abstraction layer in this case.
>
> Oh dear. =C2=A0Using the power sysfs as the hardware abstraction seem=
s
> perfectly reasonable but assuming that a given battery driver is goin=
g
> to have this level of information doesn't match up with an awful lot =
of
> actual charger hardware. =C2=A0My main concern here is that battery
> performance monitoring has no pressing need to be in kernel and that
> pushing it into the kernel creates a barrier to implementing more
> advanced schemes in userspace, which is especially serious given how
> involved this needs to be in order to be accurate.

We should tidy up the userspace side to have better abstraction for
this.  On a number of devices we do obtain all the information
necessary from the kernel driver (or, in some cases battery monitoring
on the baseband side that the kernel driver chats with).  On other
devices we don't (Motorola Droid, for example uses a userspace battery
daemon).

>> Note: I'm not claiming that Android is doing it right or that
>> we can't modify this code or so, it's just that this is the way
>> a few million Android devices out there are actually doing it.
>
> I don't think the existing Android devices are much of an issue here,
> it's not as though end users have the ability modify the firmware on
> them (modulo the fairly small number of ADP devices). =C2=A0This is a=
n issue
> for people producing new devices who are already going to be doing so=
me
> development to get the kernel up and running on their hardware.

My preference, from an Android point of view, would be to make sure we
have some reasonable userspace abstraction and provide a default
implementation that will do the right thing with an intelligent
battery driver (our usual design for inhouse work).  Then alternative
implementations can be plugged in, should that not be sufficient.

Brian
