From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] printk: implement support for extended console drivers
Date: Mon, 29 Jun 2015 17:47:49 +0200
Message-ID: <CAMuHMdXTn0+z4PV9UVZZmpMdk_-JUc4x-GqZweOhQyYMTzSOGQ@mail.gmail.com>
References: <1430318704-32374-1-git-send-email-tj@kernel.org>
	<1430318704-32374-4-git-send-email-tj@kernel.org>
	<CAMuHMdWwH-3kx1ma5KE=fP94by8boxM_QYqPKpU=YJw8t3hYeg@mail.gmail.com>
	<20150629152805.GM15805@mtj.duckdns.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=aP42VF4o+Qj5jha26tuT2X78NgXvPgsW7DjFw9iJNoE=;
        b=MKXzmjczBkK3SmFWxzg4WH3nieVph0St1efeyMx876fyiniuyX3XczT4dTVi3MNTxd
         c0ZEix7D8Zmx/TgRnMKkjtU6cRKKgpVkAkG3X/kFQU8JltMRcDyE0rMTqhbXcpG8ctkL
         CzNZWg/CdEIIF99kIzVBpQt73meYeSHrGg4aC9/fMhBpQtMLxJJCG9N27G/5G7XCNg5i
         /dJGMgmrd5VeenAMhlj9Tv7b2+v4H8tV6s8Ff+e+ojuJ0vsHR2AI2AGX+Y8sPYtHtGuk
         ywhViz43yLyJ9d74YyzDPcdYBpTvlFIPxDUhJR6gJtrOehHO3t0Cm0cncJMbuuJPFGwd
         pAiQ==
In-Reply-To: <20150629152805.GM15805@mtj.duckdns.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>
Cc: pmladek@suse.cz, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kay Sievers <kay@vrfy.org>, Josh Triplett <josh@joshtriplett.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Hi Tejun,

On Mon, Jun 29, 2015 at 5:28 PM, Tejun Heo <tj@kernel.org> wrote:
> On Mon, Jun 29, 2015 at 11:20:41AM +0200, Geert Uytterhoeven wrote:
>> On Wed, Apr 29, 2015 at 4:45 PM, Tejun Heo <tj@kernel.org> wrote:
>> > --- a/kernel/printk/printk.c
>> > +++ b/kernel/printk/printk.c
>>
>> > @@ -2196,6 +2227,7 @@ out:
>> >   */
>> >  void console_unlock(void)
>> >  {
>> > +       static char ext_text[CONSOLE_EXT_LOG_MAX];
>>
>> Can you please
>>   a) make this feature optional,
>
> netconsole itself is optional & modular.  I'm not sure making further
> splits is called for, especially given the use cases.

It could be a hidden option, selected by its users (e.g. netconsole).

>>   b) (de)allocate this buffer dynamically when the first/last console with
>>       CON_EXTENDED set is (un)registered?
>
> But yeah, making the buffer allocated on demand should be simple
> enough.  Will get to it.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
