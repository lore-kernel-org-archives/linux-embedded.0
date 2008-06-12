From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Thu, 12 Jun 2008 20:18:07 +0200
Message-ID: <20080612181806.GA7423@nibiru.local>
References: <20080610134932.B27D62430C@gemini.denx.de> <200806110025.27575.rob@landley.net>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806110025.27575.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Rob Landley <rob@landley.net> schrieb:

Hi,


> There's also qemu.  You can native build under emulation.

did you ever consider that crosscompiling is not only good for 
some other arch, but a few more things ?
 
> In addition, if you have a cross compiler but don't want to spend all your 
> time lying to ./configure, preventing gcc from linking against the host's 
> zlib or grabbing stuff out of /usr/include that your target hasn't got, or 

#1: use a proper (sysroot'ed) toolchain
#2: fix broken configure.in's (and feed back to upstream or OSS-QM)
#3: replace libtool by unitool

> trying to figure out why on EARTH the perl build decided to use x86 signal 

Perl never was crosscompile-capable.
I've rewrote much of the buildscripts, but not finished yet.

Just in case that anyone's interested in it, let me know.

> libraries are linked inside the emulator, anything that wants to look 
> at /proc or sysinfo does it natively inside the emulator...)

Only crap sw looks at /proc at build time.
Yes, there's *much* crap sw out there :(


cu
-- 
---------------------------------------------------------------------
 Enrico Weigelt    ==   metux IT service - http://www.metux.de/
---------------------------------------------------------------------
 Please visit the OpenSource QM Taskforce:
 	http://wiki.metux.de/public/OpenSource_QM_Taskforce
 Patches / Fixes for a lot dozens of packages in dozens of versions:
	http://patches.metux.de/
---------------------------------------------------------------------
