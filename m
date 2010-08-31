From: Andrew Murray <amurray@mpcdata.com>
Subject: [RFC] Kernel 'boot cache' to reduce boot time
Date: Tue, 31 Aug 2010 20:13:09 +0100
Message-ID: <AANLkTimJkPD=shB9oi3ASocaLEpG=C7oDJMbq8BEy2Fe@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Hello,

I have a suggestion for a kernel framework which aims to reduce boot
time in embedded devices and would be interested in hearing your
feedback.

A large portion of kernel boot time is spent in driver probe functions
often waiting for hardware for example calculating LPJ values or
trying to determine what type of camera is connected (PAL/NTSC) etc.
However for most embedded devices the hardware remains constant and
these probes always determine the same information. Therefore boot
time can be decreased by removing some of this probe code and
replacing it with known values.

To some extent some of these optimisations have already been done
through a variety of methods - for example the LPJ calculation can be
bypassed with the lpj= parameter and some drivers have their own
methods. My solution aims to generalise these solutions...

The solution is to provide a very simple framework which will allow
drivers to identify and record such values (LPJ, camera type, decoder
chip version) during boot. Once booted the user can obtain a
collection of these values and pass them back to the kernel on
subsequent boots. During subsequent boots - drivers upon realising
these values have already been provided can bypass some of their probe
code and thus reducing boot time. Taking advantage of this framework
would be very trivial for drivers.

I wanted to see your views on the overall solution prior to
considering how it could be implemented.

Thanks,

Andrew Murray
