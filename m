From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Mon, 20 Oct 2014 10:32:58 +0200
Message-ID: <CAMuHMdXxp0+MW_mqJOCOLpG4Ehy4oWZhvFppjUKgm6SB83_uTw@mail.gmail.com>
References: <5441F592.6090807@gmail.com>
	<nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
	<20141018140536.GA10616@piout.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=m2iGaIOMrFO9D1LmPdraHArs3HCs9o+RCM/gM4NHKEU=;
        b=LgYlZ6UuVBcWOuii+gu9DmWQp0seMzc6LWZhzdNaJ+eWjzyEqN2hkAir1rpUVgq//y
         PteAQmr/DTKWiTrlUKKkbwdwf4er31dqI/+r9r82uXbgaRif/nBALUL2MwKKpkZACtL/
         UXaCbueAGaL0uXPHT/esFFPoZnDjbyC/fjGsHl6CQuxaqDN6H2cPnypc7/8tJEDy4Sr9
         5BocgqXtPklP+vDP7vDmkmUZCTAJ3hpPQvXIaGf+rWorMpf8muq1IgdAgCx6JlfTIB7y
         jKq1VHj+IjVHdb3xKUlqfkUoexXZWTCRvfKt5lYzid5O0Ziy9S5rKGPn4FylkOi+B+FF
         bW/Q==
In-Reply-To: <20141018140536.GA10616@piout.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: "Bird, Tim" <Tim.Bird@sonymobile.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "tim.bird@am.sony.com" <tim.bird@am.sony.com>, "Christopher_Hallinan@mentor.com" <Christopher_Hallinan@mentor.com>

On Sat, Oct 18, 2014 at 4:05 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> On 18/10/2014 at 10:11:27 +0200, Bird, Tim wrote :
>> The answer is pretty easy, I think.  I tried to mainline it once but failed, and didn't really try again. If it is being found useful,  we should try to mainline it again,  this time with more persistence.  The reason it got rejected before IIRC was that you can accomplish a similar thing with modules, with no changes to the kernel. But that doesn't cover the case where the loadable modules feature of the kernel is turned off, which is common in very small systems.
>
> There is also the case of subsystems that can't be compiled as modules.
> I didn't even try to push that to the mainline because I believe we
> prefer not having code without any users/calls in the kernel. You would
> still have to patch your kernel to use deferred_module_init().

Using deferred_module_init() instead of module_init() is a configuration thing.
Perhaps we can extend Kconfig to handle this? I.e. there will be a new
CONFIG_FOO=d value, to indicate deferred initialization, and turn module_init()
into deferred_module_init()?

As this should work for both modules and subsystems that can't be compiled
as modules, this would also force us to clean up the two uses of bool.
Currently "bool" is used for both
  1. Options that can be enabled/disabled,
  2. Modules that can be built-in or disable.
Only the latter should get a third value (deferred initialization).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
