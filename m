From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 09:55:12 +0200
Message-ID: <200806160955.12752.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <20080613222523.GA28805@shareable.org> <20080613231932.GW13599@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080613231932.GW13599@pengutronix.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Saturday 14 June 2008 01:19:32 you wrote:
...
> I still don't understand why all the scons, cmakes and jams out there
> don't even try to provide the *standard* user interface everyone is used
> to on a unix system.

For cmake:
CMake has a cache, where the values of variables are stored, e.g. if an option 
is enabled or not, or where a library has been found (e.g. 
JPEG_LIBRARY=/usr/local/lib/libjpeg.so).
The way to influence the behaviour of cmake is to change the value of these 
variables, this can be done either via a GUI (curses based or with cmake 2.6 
also a graphical one), or via the command line:
$ cmake -D<name_of_variable>=<new_value> ...more options

There is no simple automatic mapping from the variables to enabling features.

Anyway, it is on the TODO for cmake to add some kind of support for 
project-configurable command line options, so that configure-compatible 
options could be provided.

> > Lots of packages need special tools or other software installed to
> > build them; this is no different.
>
> autotools need only a shell and make

Yes, and requiring a shell is a lot, in the case you want to port also to 
Windows.


Alex
