From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: GPIO triggers kernel reboot
Date: Mon, 27 Jan 2014 09:25:01 +0100
Message-ID: <CAMuHMdX-sRhwddcvrS8KSO9hTMc94PyAhaBTef7rckwvnL-OiQ@mail.gmail.com>
References: <52E3E031.6040709@denx.de>
	<CALLGbRKK_ZcOB6nAiV67njrphXMQXN7Y2s81n5k3PWoSVrsrUw@mail.gmail.com>
	<52E5FB1A.2020205@denx.de>
	<8761p5hmni.fsf@lebrac.rtp-net.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=pyRs3GgR3Wq+f9yJpF8pm2ejo6r8QzmNAcuwuBGjN2M=;
        b=j2L6u7A9NYtI6gQ/BQtihDH8PIoq378/g553yvhzELWqcRoXIvgm+KqIa67S8h2GEi
         keEQHHfuHyrRp9LGrQ36UxiMObMxdbsB5qfBognUxH5GjfE6GvAZHuQUWhqmU3uUsPAu
         4Z19tJdni0IeT5CxLZOHl0yHVOK/eS6Z5bCkkfaSG+fnW5gwopBdOWR+S9hiHz+jJFxF
         TDzplJ95rN+UKrOeCCg/eG17qaysey+E3Oz61hAvtJ6MEjq1xnf8+vIza1L4PULMCD5W
         6cuTd/nRpWjNqBAXHtzjcx20WQkN4w2uayicX6fnmJogVG9RDD8wtXP8J2Be+t7Csptc
         w6Cw==
In-Reply-To: <8761p5hmni.fsf@lebrac.rtp-net.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: hs@denx.de, Steve deRosier <derosier@gmail.com>, Linux Embedded <linux-embedded@vger.kernel.org>, Wolfgang Denk <wd@denx.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Jan 27, 2014 at 9:08 AM, Arnaud Patard
<arnaud.patard@rtp-net.org> wrote:
>>> It's certainly possible, and it's also easily done from user-space.
>>>   Something like this is more policy than function.  It's also a potential
>>> security issue.  As such I'd expect it highly unlikely that the kernel
>>> maintainers would allow it to go upstream. Give it a try though.
>>
>> Ok, thats what I also think ...
>>
>>> I'd approach this from user-space.  Add in the gpio-keys driver and use the
>>> input-event-daemon to trigger a reboot.  Super easy.
>>
>> Yes, that was also my suggestion, but is there a way to do this without
>> user space usage in a generic way?
>
> I think that you can register an input handler for that. iirc, there was
> a driver doing something similar for apm.

According to Documentation/sysctl/kernel.txt, the default for the
"ctrl-alt-del" input is to just reboot.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
