From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 2/6] Container Freezer: Make refrigerator always
 available
Date: Fri, 1 Aug 2008 16:27:12 +0200
Message-ID: <20080801162712.63721e8c@surf>
References: <20080801050659.924495279@us.ibm.com>
	<20080801050700.528446138@us.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080801050700.528446138@us.ibm.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matt Helsley <matthltc@us.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Paul Menage <menage@google.com>, Li Zefan <lizf@cn.fujitsu.com>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux Containers <containers@lists.linux-foundation.org>, linux-pm@lists.linux-foundation.org, Cedric Le Goater <clg@fr.ibm.com>, "Serge E. Hallyn" <serue@us.ibm.com>, Michael Opdenacker <michael@free-electrons.com>, linux-embedded@vger.kernel.org

Hi,

Le Thu, 31 Jul 2008 22:07:01 -0700,
Matt Helsley <matthltc@us.ibm.com> a =C3=A9crit :

> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -5,7 +5,7 @@
>  obj-y     =3D sched.o fork.o exec_domain.o panic.o printk.o \
>  	    cpu.o exit.o itimer.o time.o softirq.o resource.o \
>  	    sysctl.o capability.o ptrace.o timer.o user.o \
> -	    signal.o sys.o kmod.o workqueue.o pid.o \
> +	    signal.o sys.o kmod.o workqueue.o pid.o freezer.o \

I have the impression that the code in kernel/power/process.c was
compiled only if CONFIG_PM_SLEEP was set. Now that the code has been
moved to kernel/freezer.c, it is unconditionnaly compiled in every
kernel. Is that correct ?

If so, is it possible to put this new feature under some
CONFIG_SOMETHING option, for people who care about the kernel size ?

Thanks,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
