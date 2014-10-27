From: Benedikt Kleinmeier <benedikt.kleinmeier@esk.fraunhofer.de>
Subject: Create/Package kernel headers for self-compiled kernel
Date: Mon, 27 Oct 2014 10:27:48 +0100
Message-ID: <2F4CF2DB24861D49816948ECBDF0D4FB0103002E0F@zulu.esk.fraunhofer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Language: de-DE
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "'linux-embedded@vger.kernel.org'" <linux-embedded@vger.kernel.org>

Hi,

I run a host/target development environment. On a Debian host, I patch =
the Linux kernel 3.2.60 with the RT patch and compile it. Afterwards, I=
 move config, System.map, initrd and vmlinuz files to a Debian target.

Now, I would like to compile a kernel module on the target, but the hea=
der files are missing.

Linux' Makefile contains the target "headers_install" but this only ins=
talls the headers for user space programs under "/usr/include/linux". I=
 need the files referenced by "/lib/modules/<version>/build". Some of t=
he referenced files are also created during Linux' "make" process, e.g.=
 .config, include and Makefile. For pre-compiled kernels in Debian, the=
 headers are combined to a package called "linux-headers-<version>". Se=
e here https://packages.debian.org/wheezy/amd64/linux-headers-3.2.0-4-a=
md64/filelist.

Is there a distribution-independent way to create or package these file=
s?

Thank you very much.

--=20
Benedikt Kleinmeier
=46raunhofer-Institut f=FCr Eingebettete Systeme und Kommunikationstech=
nik ESK

Hansastra=DFe 32 | 80686 M=FCnchen=20
Telefon, Fax: +49 89 547088-0 | +49 89 547088-220
E-Mail: benedikt.kleinmeier@esk.fraunhofer.de
Internet:
http://www.esk.fraunhofer.de=20
http://www.twitter.com/FraunhoferESK
http://www.facebook.com/FraunhoferESK=20

