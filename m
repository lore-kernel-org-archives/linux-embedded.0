From: "Gustavo Sverzut Barbieri" <barbieri@profusion.mobi>
Subject: Re: [Celinux-dev] animated graphics on embedded linux systems
Date: Thu, 25 Dec 2008 21:59:57 -0200
Message-ID: <b1f2b8c40812251559v203d324fmdbf297a183751b74@mail.gmail.com>
References: <20831c740812250614w5525f248kffd6a6a5151afec1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20831c740812250614w5525f248kffd6a6a5151afec1@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oguz Yarimtepe <comp.ogz@gmail.com>
Cc: celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org

2008/12/25 Oguz Yarimtepe <comp.ogz@gmail.com>:
> Hi,
>
> I am searching graphics libraries that enables animated graphics on
> embedded linux systems. Here are the requirements for the graphics
> library:
>
> * Should work or able to work with DirectFB
> * Lightweight
> * Doesn't consume memory and cpu power much
>
> So it can be thought that the library will be used for a media center
> type application. At that application i want to be able to write some
> animation effects for ex for the window part that shows video covers
> and passing from one to another will be with some animation or
> pressing a close button will be with some animation or will cause the
> current window closed with some animation...
>
> I Googled a little but i want to hear some experiences also, if any.
> There are some graphics libraries suggested for embedded environments
> like Qt Embedded or SDL. I am not sure whether they are suitable dor
> such applications or whether they are memory efficient.


I use and recommend Enlightenment Foundation Libraries (EFL,
http://enlightenment.org), specially Evas (canvas) and Edje (theme,
with animations and transitions). It is very lightweight and can use
hardware acceleration when possible, with optimized (sse, mmx,
altivec) C replacement.

I wrote DirectFB engine some time ago and Denis did a review of it.
Denis said to make fully use of hardware acceleration for blits we
need to change image allocation to hardware, then paint it with
pixels, not hard to do, but I'm not doing it now... patches are
welcome or you can consider hiring our company to do such work.

Compared to SDL, EFL offers much more primitives and thus can provide
many optimizations, like occlusion culling and dirty area/movement.
Compared to Qt 4.x, it provides a bit less canvas primitives (no
vectors, for instance), but it provides Edje, a very helpful piece of
EFL. Also, EFL is BSD with one piece in LGPL, while Qt is GPL or
commercial.

You can find lots of information about EFL on my blog
(http://blog.gustavobarbieri.com.br/) or company news
(http://profusion.mobi/taxonomy/term/2). If you want to hire
consulting, training or development, feel free to contact us.

Regards,

-- 
Gustavo Sverzut Barbieri
http://profusion.mobi embedded systems
--------------------------------------
MSN: barbieri@gmail.com
Skype: gsbarbieri
Mobile: +55 (19) 9225-2202
