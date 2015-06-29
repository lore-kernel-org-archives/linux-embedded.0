From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] printk: implement support for extended console drivers
Date: Mon, 29 Jun 2015 18:11:40 +0200
Message-ID: <CAMuHMdX-cA3RccXF2kBifMEyT8e14rURp9Li_WFm7ODBOti=QQ@mail.gmail.com>
References: <1430318704-32374-1-git-send-email-tj@kernel.org>
	<1430318704-32374-4-git-send-email-tj@kernel.org>
	<CAMuHMdWwH-3kx1ma5KE=fP94by8boxM_QYqPKpU=YJw8t3hYeg@mail.gmail.com>
	<20150629152805.GM15805@mtj.duckdns.org>
	<CAMuHMdXTn0+z4PV9UVZZmpMdk_-JUc4x-GqZweOhQyYMTzSOGQ@mail.gmail.com>
	<20150629154914.GQ15805@mtj.duckdns.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=lwTPrNS6GCbdMnsn6gm1jOyHXmlPjesu3qa1FbCCpW8=;
        b=PRzely0Sva5Wm+A2GV3cubw3hzChajcIRkMYdFG7eSkGaMsuqX0IHNSkQY2e4b+vDC
         qd7TbxXRtr10XUNVc0zvkFgi6R90C5CqcoBVIZ5gsQOYz60sCHP7rDEYcSOoDkT2v5mc
         UV41VBiF4bUnuNtTXglUynBCf+ZagZyaMK8SmeW9KqkqkBHvIfa1LV2KniGLMNhmi+q9
         CIPM/r8CyIKbOLwzw1yCh7UzTxMMmPPSPU87yAo1LpMVsLtIIMRKigpJqRjt6FzhLEKd
         fmlbjf4mR3d6at+y+OsH0mUAOAqyXhO25cxd2D1YJdOwyY0bwNgmdI8F/KJ1VyGNgWpq
         GF6w==
In-Reply-To: <20150629154914.GQ15805@mtj.duckdns.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>
Cc: pmladek@suse.cz, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kay Sievers <kay@vrfy.org>, Josh Triplett <josh@joshtriplett.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Mon, Jun 29, 2015 at 5:49 PM, Tejun Heo <tj@kernel.org> wrote:
> On Mon, Jun 29, 2015 at 05:47:49PM +0200, Geert Uytterhoeven wrote:
>> > netconsole itself is optional & modular.  I'm not sure making further
>> > splits is called for, especially given the use cases.
>>
>> It could be a hidden option, selected by its users (e.g. netconsole).
>
> Hmmm... what do you mean?

init/Kconfig:

        config PRINTK_EXT_LOG
                bool

drivers/net/Kconfig:

        config NETCONSOLE
                tristate "Network console logging support"
                select PRINTK_EXT_LOG

kernel/printk/printk.c:

        void console_unlock(void)
        {
#ifdef CONFIG_PRINTK_EXT_LOG
                static char ext_text[CONSOLE_EXT_LOG_MAX];
#endif

etc.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
