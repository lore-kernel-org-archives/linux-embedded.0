From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: Super Fast Boot of Embedded Linux: 300 ms from boot loader to
 shell
Date: Thu, 14 Apr 2011 20:52:04 +0200
Message-ID: <20110414185204.GJ3811@pengutronix.de>
References: <BANLkTi=Zahmo_d1Fo7JnaD3iJHAuhSAZGQ@mail.gmail.com>
 <4DA331F9.5070902@gmail.com>
 <BANLkTimLGVfS=wbkmYMRkirsARwFHNYWVw@mail.gmail.com>
 <4DA5DD10.6030305@gmail.com>
 <4DA6A5A7.2060701@parrot.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4DA6A5A7.2060701@parrot.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthieu CASTET <matthieu.castet@parrot.com>
Cc: Marco Stornelli <marco.stornelli@gmail.com>, Constantine Shulyupin <const@makelinux.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Thu, Apr 14, 2011 at 09:43:35AM +0200, Matthieu CASTET wrote:
> Not to say such case are not interesting : loading a linux kernel with
> only a serial driver, a ramdisk and a shell as init doesn't reflect
> reality.
>
> In real product what you want if fast user interaction (sound,
> mounting big filesystem with user data, lcd display, ...)

Well, it depends on the application. In the automotive box I've shown
the barebox based boot optimizations for in my ELC-E talk, the task is
to get CAN communication running in < 200 ms. For that kind of
application it's useful to be in userspace as fast as possible, just in
order to have one socket-can application running, and everything else
comes later.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
