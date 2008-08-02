From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 2/6] Container Freezer: Make refrigerator always
 available
Date: Sat, 2 Aug 2008 12:39:36 +0200
Message-ID: <20080802123936.5f8613bd@surf>
References: <20080801050659.924495279@us.ibm.com>
	<20080801050700.528446138@us.ibm.com>
	<20080801162712.63721e8c@surf>
	<1217617689.25300.213.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1217617689.25300.213.camel@localhost.localdomain>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matt Helsley <matthltc@us.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Paul Menage <menage@google.com>, Li Zefan <lizf@cn.fujitsu.com>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux Containers <containers@lists.linux-foundation.org>, linux-pm@lists.linux-foundation.org, Cedric Le Goater <clg@fr.ibm.com>, "Serge E. Hallyn" <serue@us.ibm.com>, Michael Opdenacker <michael@free-electrons.com>, linux-embedded@vger.kernel.org

Le Fri, 01 Aug 2008 12:08:09 -0700,
Matt Helsley <matthltc@us.ibm.com> a =C3=A9crit :

> 	How about making it depend on a combination of CONFIG
> variables? Here's an RFC PATCH. Completely untested.

It solves my kernel size increase problem, so it's perfectly fine for
me.

Thanks!

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
