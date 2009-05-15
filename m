From: muzungu@gmx.net
Subject: Can I run an application compiled with gcc ABI 2.95 on a kernel
 compiled with gcc ABI 3.4?
Date: Fri, 15 May 2009 13:50:09 +0200
Message-ID: <20090515115009.110740@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded@vger.kernel.org

Hello all

We have a target system with an old Linux environment that we can not e=
asily upgrade to a new one.

The actual development system (linux) has more or less the same age (pr=
ox. 10 year)

We intend to do the following:

- Use a new distribution as development environment (linux)
- Still compile the target application for the old system (2.2 and 2.4 =
kernels, once all compiled with egcs 2.91.66)
- Test the target applications in the new development environment

Questions:
- Can I run an application compiled with gcc ABI 2.95 on a kernel compi=
led with gcc ABI 3.4?
- In other words: does it matter if the gcc ABI of the compilers for th=
e kernel and the application are different, assuming all the libraries =
used, have the same gcc ABI as the application?

I guess:
- gcc ABI of librabies and applications compilation must generally matc=
h
- gcc ABI of kernel, libraries and applications compilation must genera=
lly match to.

Am I wrong?

I would appreciate any help

Roman
--=20
Neu: GMX FreeDSL Komplettanschluss mit DSL 6.000 Flatrate + Telefonansc=
hluss f=FCr nur 17,95 Euro/mtl.!* http://dslspecial.gmx.de/freedsl-surf=
flat/?ac=3DOM.AD.PD003K11308T4569a
