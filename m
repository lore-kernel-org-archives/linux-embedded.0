From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Wed, 22 Oct 2014 12:05:56 +0200
Message-ID: <CAMuHMdV1K-DpCps-a82cuYRNK5BJN604pPi2HWWAnSEOxBCSBQ@mail.gmail.com>
References: <5441F592.6090807@gmail.com>
	<nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
	<CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
	<alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr>
	<F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
	<alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=uUy7AIApSqo1+QbdGvCs2B+urmAiGNd2Ppk997F7XKY=;
        b=E8126zf1Y8DhS8CH2uH5siPe0HmiX5GYEVpG/lZmJYXVkWnb1iJMHCG0KaIp1mwmIt
         DZaH+KU/8DgP/U75ZmgnV8s/oMWjopQVZa8U/TGybtEJYrOLpoGV+i0p1TRIyjtLUDIK
         rjc0/3XKMdxxT9YokmM5K5BA/LbpmXKgnq+ZS91J8gcT+Gy0oZ/9DG1UyZNLSqpIMzHE
         6geF+azBYPdRTKJcxYZ99y+CUn2MeqEjSYLli2U5OfVzxAXKOf7Yjr2oF1GhB2x+Ke3a
         z4rTKfNNf+tSPfOJgSLhtf6EgUldRn4x63XJfc35H6bHDipywPPHRycv70daeONvRiS8
         NRVQ==
In-Reply-To: <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nico@fluxnic.net>
Cc: "Bird, Tim" <Tim.Bird@sonymobile.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "tim.bird@am.sony.com" <tim.bird@am.sony.com>

On Tue, Oct 21, 2014 at 9:58 PM, Nicolas Pitre <nico@fluxnic.net> wrote:
>> Yeah, I'm not a big fan of having to change kernel code in order to
>> use the feature.  I am quite intrigued by Geert Uytterhoeven's idea
>> to add a 'D' option to the config system, so that the record of which
>> modules to defer could be stored there.  This is much better than
>> hand-altering code.  I don't know how difficult this would be to add
>> to the kbuild system, but the mechanism for altering the macro would
>> be, IMHO, very straightforward.
>
> Straight forward but IMHO rather suboptimal. Sure it might be good
> enough if all you want is to ship products out the door, but for
> mainline something better should be done.

An alternative could be to add a processing step before linking,
changing the section name for initcalls you want to defer, based on a
small config file.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
