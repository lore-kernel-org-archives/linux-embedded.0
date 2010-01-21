From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: /dev/fw major not constant (embedded mdev devtmpfs ieee1394)
Date: Thu, 21 Jan 2010 13:59:31 -0700
Message-ID: <fa686aa41001211259v6e1c3e41mf1e94949e5597dea@mail.gmail.com>
References: <4B58BF6A.6070303@fnac.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B58BF6A.6070303@fnac.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Paul Chavent <paul.chavent@fnac.net>
Cc: linux-embedded@vger.kernel.org, linux-hotplug@vger.kernel.org, linux1394-devel@lists.sourceforge.net, busybox@busybox.net, libdc1394-devel@lists.sourceforge.net

On Thu, Jan 21, 2010 at 1:56 PM, Paul Chavent <paul.chavent@fnac.net> w=
rote:
> Hi.
>
> I'am working on an embedded gnu/linux system that allow to capture an
> ieee1394 stream.
[...]
> But when i needed to modify my kernel configuration, it has changed t=
he
> major number of /dev/fw*.
[...]
> The linux ieee1394 wiki people give me some idea
> (http://marc.info/?t=3D126390679500003&r=3D1&w=3D2) :
> =A0- maintain a local patch for making the major constant
> =A0- use devtmpfs
>
> I prefer to try devtmpfs, but i would like to have your opinion on ho=
w would
> you do for me ?

devtmpfs is probably your best bet as that is what it is designed for.
 You can also run a trivial script at boot to read /proc/devices and
create the device nodes as described in chapter 3, page 47 of LDD3:

http://lwn.net/images/pdf/LDD3/ch03.pdf

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
