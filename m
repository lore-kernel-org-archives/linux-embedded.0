Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EB921348;
	Tue, 23 Sep 2025 23:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758668585; cv=none; b=g9X++JSODIfjgOBcjaof1oYh5GPkxkXO2aECewFbr4NWyxmnSMIqr3kuvVaSbHo6kyBmXn+J5sxiVjbY5K8fa4hcmXf5/AKe3BP8rq9UUMfSXVr8sVFqjgS3sgN2KxxEdZVkcJTGqnFl5lWbZ537uNkaqQYgi9h4NW/Qwqb/0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758668585; c=relaxed/simple;
	bh=A5dBr5PpaLQmJuxydR8a5pjwhHT9xCswrCUlSGd9Jxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMAefPnSUqvH6HkpBQ+AEO13NobPwLOzt6yhhvMkMO4jQAlOPJnb+OlRTabohLNkIvKHOYp4RPWAMyxPQ1rOH45iUDIWET6DsoKs6i84FNpyvNbAqbHxVqBaV7IOnYJoCGkUiu1wYQ/84hRNougTnJBm6JFOTt/HOHRLhN1YQCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYk4QuiA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYk4QuiA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F76C4CEF5;
	Tue, 23 Sep 2025 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758668585;
	bh=A5dBr5PpaLQmJuxydR8a5pjwhHT9xCswrCUlSGd9Jxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYk4QuiANLqAYBKBMQBkOL+iwQ6W/E/SXGvPQAvHkHqa4HXfB+Gynw+sgddMIuFLx
	 sYXwR61KqTFKF/Zfmae9CEXHk4hi3p69eJfcyWbzLy6EVH5XNax8pDmKHL0+HhZE02
	 q+3FjdU0NcxomWCJkKwEtkvOclicfGJmU2DNjoT1Drz1VQpYjkgfoyfx24vNO3sNj/
	 eRbArcv3evXuc3lqX6z5jFBRG3+yAa/URvuqfiqvdvaO0/VrPAYvrnE2KBtGRPXhLW
	 M21qOtY/JqjktuJ7UqJ6Wbsthgw9nc5qP9E8BrbEzqb4hgKkX4BmBK1ZZFj6STOjvw
	 NaA1YBMhbFTlA==
Received: by venus (Postfix, from userid 1000)
	id 2BF3C1805CF; Wed, 24 Sep 2025 01:02:59 +0200 (CEST)
Date: Wed, 24 Sep 2025 01:02:59 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Stefan Schmidt <stefan@datenfreihafen.org>, 
	Jan Lubbe <jlu@pengutronix.de>, stefan.schmidt@linaro.org, linux-embedded@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, RD Babiera <rdbabiera@google.com>, 
	Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	kernel@collabora.com
Subject: Re: Call for Participation: Embedded & IoT micro-conference at Linux
 Plumbers 2025
Message-ID: <j5dtkmnu55ycmqpaseazots7mevqyt5lafclvguxj6oz5r5cts@n563dsnvwuu7>
References: <2a353817-f1da-4e7c-8b2c-0853779ec054@datenfreihafen.org>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xi4we3ntoqtlf52u"
Content-Disposition: inline
In-Reply-To: <2a353817-f1da-4e7c-8b2c-0853779ec054@datenfreihafen.org>


--xi4we3ntoqtlf52u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Call for Participation: Embedded & IoT micro-conference at Linux
 Plumbers 2025
MIME-Version: 1.0

Hi,

On Fri, Sep 05, 2025 at 09:45:26AM +0200, Stefan Schmidt wrote:
> We are happy to announce that the Embedded & IoT micro-conference was
> again accepted for Linux Plumbers this year. Hosted in beautiful Tokyo,
> Japan December 11-13. https://lpc.events/event/19/contributions/2005/
>=20
> Topics cover all things embedded and IoT. Boot time to kernel size, low
> power communication, telemetry and also RTOS. Devicetree and build
> system have their own MC and we can move sessions between them as needed.

I would like to present / discuss fusb302 (or other chips handled via
the TCPM framework) using boards that are mainly powered via USB-C and
not having any backup power source. This kind of setup is often found
on Rockchip boards (e.g. Libre Computer ROC-RK3399-PC, Radxa ROCK 5B
or ArmSoM Sige 5) and quite a pain, because a hard-reset effectively
kills the board power.

I would present the problem(s), what I've done so far to get it working
to some degree with the upstream kernel and then discuss how to improve
the situation.

I think to become a worthwhile discussion the session would need some
people that know the USB-PD specification and kernel subsystem, such as:

 * Heikki Krogerus (USB-C maintainer)
 * Greg Kroah-Hartman (USB maintainer)
 * RD Babiera or Amit Sunil Dhamne (Google is actively working on
   ensuring TCPM code being compatible with the USB-PD specification
   and they were unhappy about some of my changes :))

P.S.: I'm not sure how the CfP for the LPC micro-conferences works.
Please tell me if this mail is not good enough and I need to insert
something into some system.

Greetings,

-- Sebastian

--xi4we3ntoqtlf52u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmjTJx8ACgkQ2O7X88g7
+pqU2w/6AxYzW774s5ImPsNv11xmIY3uOTWpKgS1cJeVCUVV/75CGcgNZlnhYboe
KvAvCso1L78HrqMA3pQ/N2tfa5IfRUd/q7kkRJT+vlp9UH1LxClEiKKam6GSAsuF
5L382YDSD1x+inub52F21GnpSIE4E4JWAkn1RdMwNMZZ0L72eMYoOeXy1qnFNUc5
f99ME2nqClgAHPmyP3QPyuKuRdu3LVxlgZKzxLHG79jJgWCQOyTGV/TYaGi9ip0P
6ol/inpHjokcWnqhZyQPycuX7zCaqDrf9jhfHZ7Tl0Z48XtGAJySFf0wtxfiOkDE
sFeSD56IG/3/usMiX61FevEHiHovefpw9cN2Z/6W5b6SyJBeofMNoqkRSHbvayJc
BSN82nXAxaN6qwgLdfM3qab0GIUYLmkmP3SNXD+rybr+EWbsOaKtwKEvxE0CVVbW
800/ay8/ti1/4XFfJD2jD6vD4StHAWtIHLkGhO+hCL+8p4uiRC3tiCJvBq89gplY
ACprfRPqA5qE31/8h8Zz5lJkvvpZkNsZl1wFRjIYGFyjigUO/bxHA1Meba7PJBOv
WeL9OiSvKiQsa40D9UcNQnl7SzY1TVDnwhMZQAdEbb1AB1l6FLbF+AVs5ph97b/f
W6FnZ5F60XShgJZp7z41fPp02u5ujNsJNAHy0DeARrdW+oBjGaU=
=oU21
-----END PGP SIGNATURE-----

--xi4we3ntoqtlf52u--
