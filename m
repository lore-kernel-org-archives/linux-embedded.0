From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Tue, 17 Jun 2008 12:52:22 -0700
Message-ID: <485815F6.20507@am.sony.com>
References: <48580116.9070504@am.sony.com> <20080617190750.GA31224@logfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080617190750.GA31224@logfs.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

J=C3=B6rn Engel wrote:
> On Tue, 17 June 2008 11:23:18 -0700, Tim Bird wrote:
>> I'm not that happy using an ioctl for this trigger.  What is
>> the preferred method of activating a kernel feature like this?
>> I presume something in /proc or /sys, but I'm not sure.
>=20
> I personally would be unhappy with any kind of interface for this.  I=
t
> would be much nicer to make it transparent and still get the benefits=
=2E
> One option would be to start a kernel thread for the initialization a=
nd
> renice it to 19 or so.

That's an interesting idea. I'm pretty sure the product guys want
an explicit trigger, so they can make sure they've got the main
application well underway before this deferred initialization occurs.

>=20
> If you want an explicit trigger, you could either hook into init_post=
()
> or have hooks in the open functions of drivers with deferred
> initialization.

This would presumably require multiple calls (one to the open of
each deferred module).  I would still need a trigger for the memory
free operation, unless I hardcode the order of the opening and just
"know" that the last one should free the memory.  I'll have to see
if all the modules being loaded like this have open()s.

Thanks for the ideas!
 -- Tim

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
