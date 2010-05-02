From: Paul Smith <paul@mad-scientist.net>
Subject: Can I manage/modify console baud rates from userspace?
Date: Sat, 01 May 2010 20:02:04 -0400
Message-ID: <1272758524.27961.1114.camel@homebase>
Reply-To: paul@mad-scientist.net
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: linux-embedded@vger.kernel.org

Hi all.  I need some advice on an issue that just cropped up.  We have a
Linux embedded image (current kernel is 2.6.31-based) that we are
booting up on blade systems using PXE to obtain the kernel image, the
kernel boot line parameters, and an initrd from a server.

On these systems we REALLY need to be able to watch the console, even
after deployment into the field (e.g., not just during
development/internally).

We currently run this image on various hardware platforms, one of which
uses serial-over-LAN, where the console is connected to a dedicated vlan
from the blade to the chassis management module, which you can ssh into
and from there connect to the console on any blade in the chassis.  The
vlan configuration on these blades doesn't support any baud rate over
19200, so in order to get this working we use the PXE configuration file
to add "console=ttyS1,19200" to the kernel boot line.  Works great!

Here's the problem.  The vendor has released a new version of the blade
hardware for this platform, and while the old hardware didn't support
any baud rate above 19200 for serial-over-LAN, the new hardware doesn't
support any baud rate at 19200 or below, so there's no single baud rate
that will work for both types of blades.

These blades are interchangeable in the chassis and since the current
ones are end-of-life we have to start to support the new blade, and we
have to support combinations of new and old blades in the same chassis
(due to replacements).

So I _have_ to find a way to get the console working in this
configuration.  Even if I lose the early boot messages but then managed
to configure the console properly from userspace after the kernel
booted, that would be less than ideal but at least it would be progress.
Is there some way to do this?  Is there some way in the kernel to handle
this kind of situation?

I've looked at setserial and it supports a baud_base parameter but that
doesn't appear to be what I want (I tried it anyway: changing it didn't
work, my console output was still screwed up).

Trying to do something like creating customized PXE configs on the
server based on the MAC addresses of the blades that are "new" (or old)
would be an absolute nightmare as people swap blades between chassis,
add new ones, etc. all the time.


Please help me find a better way... :-(
