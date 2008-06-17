From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Tue, 17 Jun 2008 21:07:51 +0200
Message-ID: <20080617190750.GA31224@logfs.org>
References: <48580116.9070504@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48580116.9070504@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Tue, 17 June 2008 11:23:18 -0700, Tim Bird wrote:
>=20
> I'm not that happy using an ioctl for this trigger.  What is
> the preferred method of activating a kernel feature like this?
> I presume something in /proc or /sys, but I'm not sure.

I personally would be unhappy with any kind of interface for this.  It
would be much nicer to make it transparent and still get the benefits.
One option would be to start a kernel thread for the initialization and
renice it to 19 or so.

If you want an explicit trigger, you could either hook into init_post()
or have hooks in the open functions of drivers with deferred
initialization.  Obviously you need to wait for completion here anyway,
so adding a trigger wouldn't be too expensive.

J=C3=B6rn

--=20
Joern's library part 13:
http://www.chip-architect.com/
--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
