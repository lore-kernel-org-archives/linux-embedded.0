From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: New fast(?)-boot results on ARM
Date: Mon, 17 Aug 2009 12:15:12 -0700
Message-ID: <4A89AC40.2040109@am.sony.com>
References: <20090814170228.GM13320@pengutronix.de> <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com> <20090814204305.GA31727@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090814204305.GA31727@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Denys Vlasenko <vda.linux@googlemail.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, kernel@pengutronix.de

Robert Schwebel wrote:
> On Fri, Aug 14, 2009 at 10:04:57PM +0200, Denys Vlasenko wrote:
>>> [ =EF=BF=BD5.082616] < =EF=BF=BD0.007992> RPC: Registered tcp trans=
port module.
>>> [ =EF=BF=BD5.605159] < =EF=BF=BD0.522543> eth0: config: auto-negoti=
ation on, 100FDX, 100HDX, 10FDX, 10HDX.
>>> [ =EF=BF=BD6.602621] < =EF=BF=BD0.997462> IP-Config: Complete:
>>> [ =EF=BF=BD6.606638] < =EF=BF=BD0.004017> =EF=BF=BD =EF=BF=BD =EF=BF=
=BDdevice=3Deth0, addr=3D192.168.23.197, mask=3D255.255.0.0, gw=3D192.1=
68.23.2,
>>> [ =EF=BF=BD6.614588] < =EF=BF=BD0.007950> =EF=BF=BD =EF=BF=BD =EF=BF=
=BDhost=3D192.168.23.197, domain=3D, nis-domain=3D(none),
>>> [ =EF=BF=BD6.618652] < =EF=BF=BD0.004064> =EF=BF=BD =EF=BF=BD =EF=BF=
=BDbootserver=3D192.168.23.2, rootserver=3D192.168.23.2, rootpath=3D
>> Well, this ~1 second is not really kernel's fault, it's DHCP delay.
>> But, do you need to do it at this moment?
>> You do not seem to be using networking filesystems.
>> You can run DHCP client in userspace.
>=20
> The board has ip autoconfig configured in, because we also use tftp/n=
fs
> boot for development. But it had been disabled on the commandline:
>=20
> ip=3D192.168.23.197:192.168.23.2:192.168.23.2:255.255.0.0:::
>=20
> That shouldn't do dhcp, right?

I think it doesn't, but I'm not positive.  The DHCP trasmissions
themselves don't take very long.  There are some very long timeouts
in the network code paths, which appear to be used whether you specify
a static address or not.

See the definitions of CONF_PRE_OPEN and CON_POST_OPEN
in net/ipv4/ipconfig.c

They are set to ridiculously long values.  In my experience,
you can cut them down considerably with no dangerous side
effects (but I haven't asked the network guys about the
possible downsides).

Here's a patch which I've used in the past.  (Sorry
if it doesn't apply cleanly, I just extracted it from
a PDF and the whitespace may have gotten messed up.
It's short enough that you can hand-edit the files if
there's a problem.)

I'd like to hear back, if you apply this, whether it shortens
the network startup time for you.

diff --git a/net/ipv4/ipconfig.c b/net/ipv4/ipconfig.c
index 42065ff..e42d83f 100644
--- a/net/ipv4/ipconfig.c
+++ b/net/ipv4/ipconfig.c
@@ -86,8 +86,10 @@
 #endif

 /* Define the friendly delay before and after opening net devices */
-#define CONF_PRE_OPEN 500 /* Before opening: 1/2 second */
-#define CONF_POST_OPEN 1 /* After opening: 1 second */
+/*#define CONF_PRE_OPEN 500 /* Before opening: 1/2 second */
+/*#define CONF_POST_OPEN 1 /* After opening: 1 second */
+#define CONF_PRE_OPEN 5 /* Before opening: 5 milli seconds */
+#define CONF_POST_OPEN 10 /* After opening: 10 milli seconds */

 /* Define the timeout for waiting for a DHCP/BOOTP/RARP reply */
 #define CONF_OPEN_RETRIES 2 /* (Re)open devices twice */
@@ -1292,7 +1294,7 @@ static int __init ip_auto_config(void)
 		return -1;
 	/* Give drivers a chance to settle */
-	ssleep(CONF_POST_OPEN);
+	msleep(CONF_POST_OPEN);

 	/*
 	 * If the config information is insufficient (e.g., our IP address or

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
