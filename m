From: Felipe Balbi <balbi@ti.com>
Subject: Re: A new Subsystem for Current Management
Date: Tue, 8 Nov 2011 13:15:33 +0200
Message-ID: <20111108111525.GB6921@legolas.emea.dhcp.ti.com>
References: <D6D887BA8C9DFF48B5233887EF04654109F10AF2C7@bgsmsx502.gar.corp.intel.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <D6D887BA8C9DFF48B5233887EF04654109F10AF2C7@bgsmsx502.gar.corp.intel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: "R, Durgadoss" <durgadoss.r@intel.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 08, 2011 at 04:39:17PM +0530, R, Durgadoss wrote:
> [Very Sorry for the Big Email]
>=20
> [I have posted this on lm-sensors and platform-drivers-x86
> lists earlier. As per some recommendations there, posting it
> here]
>=20
> As we all know, Linux is increasingly being used in handhelds.
> The Hardware that supports the handhelds is also becoming
> Performance-centric. With this, we need a way to efficiently
> monitor the current consumption of the platform and take actions
> when the platform draws more current, than it should.
>=20
> Where this can happen ?
> -----------------------
> In a handheld, there are many components that demand high
> Current. For example, Camera Flash, Video Streaming, 3G Voice
> Call etc. Typically, two or more of these components are used
> simultaneously in a real-time scenario. When this happens, the
> current draw of the platform surges. If this surge lasts for
> more than a specific time, it could crash the platform irrecoverably.
>=20
> How do we tackle this ?
> -----------------------
> In Intel Medfield (Atom based) platform we had a driver that
> Configures the current limits. When the platform current draws
> more current than the programmed limit, the hardware generates
> interrupt. The driver receives this interrupt and notifies the
> user space to take appropriate actions.
> The patch and the subsequent discussions can be found here:
> http://comments.gmane.org/gmane.linux.drivers.platform.x86.devel/1197
>=20
> To Generalize:
> --------------
> With many more platforms to come, having a separate driver for each
> results in heavy code duplication. Also, there arises a problem of
> where to put these kind of drivers ? Hence I propose the idea of having
> a Current Management subsystem.
>=20
> This will provide a generic ABI, API, so that the platform specific
> drivers can register with this framework (and thus avail the basic
> needs) and handle the events in their own way.
>=20
> In simple terms, this framework will offer something like this:
> 	Current[1-N]_limit - set of current limits
> 	Voltage[1-X]_limit - set of voltage limits
> 	Controllers[1-Y]_enable - These are the components by throttling/
>       disabling which the current consumption can be brought down.
>=20
> With the Controllers we can follow two approaches:
> A) Each component driver registers with the current framework and gets
> notified when the current surge happens. On receiving the notification,
> it throttles its performance. There will be a follow-up notification,
> indicating that 'we are out of the high current' situation; so that
> the component resumes to operation at its full performance.
>=20
> B) The Current framework forwards the notification to the upper
> layers and lets them decide what to do.
>=20
> I agree that A) bloats the size of all the component drivers a bit,
> but considering the fact that the surge has to be brought down as
> soon as possible (and the delay in reacting to the event if we
> pass it to the upper layers) I am inclined towards A).
>=20
> I would like to see the opinion of the community on this entire
> stuff, before I start writing some code.

looks like this should be done on hwmon ?

--=20
balbi

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOuQ9NAAoJEIaOsuA1yqREDJAP/1yjZCWbVDp6dPxLO3bw2kHH
xJfCi4OCBIMkKc8DthXb3aI3Mzyf1X9wHiFo66KojWKOzOzs/D8uTksTwKHo30qw
G2QVCZPZEPdCMScc1xnxRAup59pP9fOgjQaDj2totYuOw9SqHY+ncLctZ5FH5n7V
MQyR1nWjKY/D4ZLZKFSh/IFqOd56SF071BjjBqeOEXUKECOJJjR4HrOkPIoVSbZX
vRAydGQhJ0BjQmVKGhlnt/N2AK40J45P6N11wTraB//DTyMkfvHxirvHxo4nTBm3
LWZwpolapRH7tTylyUeu4pDIg2teOjVySJ7S52OW+C4sKhpR+UuP/SWvTbJFBH2v
yr5kyfuRObYSM379KCwaLMxwweUz/jc4SUf3mf+nngIOTidXhdasKwx2wnXewvN5
bPc8RoxwTPG1BR/eJq/BVuXT2PDXv7xEjJBJDUOSwJ3iH7eztJHHUyMm7l8I66Wo
a5TboO+rLMZW73BEpMbpeu+6+pn86G4IMl9t/ashK4eABayWpTJs26ilNQ56OK+q
yVIaamjlxmkcM5JoX4XEXk3bR59TIwMw73FU757iz8PoREPK0cU2T+ZmjUh3NO2k
XsbSyrpakIN6w6tD+ic1Ata+8nR0ON/1H4NCmf1hp2mB/SF642HQuPnXQbT5UKFc
xOx8JTWMiNKYMXc7Qb0F
=b7Mw
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
