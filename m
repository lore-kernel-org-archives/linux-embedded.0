From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: LZMA inclusion
Date: Wed, 3 Dec 2008 22:16:17 +0100
Message-ID: <20081203211617.GB7255@uranus.ravnborg.org>
References: <492BA3FA.9010204@openwrt.org> <4936DFCD.2010204@am.sony.com> <20081203195852.GB8563@mx.loc> <20081203202009.GA6790@uranus.ravnborg.org> <20081203204540.GD8563@mx.loc>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081203204540.GD8563@mx.loc>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Tim Bird <tim.bird@am.sony.com>, lasse.collin@tukaani.org, glp@openwrt.org, linux-embedded@vger.kernel.org

> 
> PS: Not sure if you, Sam, are the right person who cares for it, but
> i think that the help-text and actual accepted arguments of
> scripts/kconfig/lxdialog/check-lxdialog.sh are out of sync.
I queued up the following:
From f6682f915760ccfe57ef1b6cd5ff2d8f2bf8c1d4 Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Wed, 3 Dec 2008 22:11:14 +0100
Subject: [PATCH] kconfig: fix options to check-lxdialog.sh

As noted by Bernhard - fix it up.

Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/lxdialog/check-lxdialog.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
index 5552154..fcef0f5 100644
--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
@@ -52,7 +52,7 @@ EOF
 }

 usage() {
-       printf "Usage: $0 [-check compiler options|-header|-library]\n"
+       printf "Usage: $0 [-check compiler options|-ccflags|-ldflags compiler options]\n"
 }

 if [ $# -eq 0 ]; then




> PPS: I did not verify if this is still the case, but I have this
> comment as a reminder for a small issue with "archprepare" versus
> headers_install, fwiw. It would be very handy if i could fuse those
> two into a simple "make ... archprepare headers_install":

Which architectures needs this archprepare?
It would be good to get rid of the dependency.

PS. I consider archprepare an internal target.
If some preparation is needed the recommended target is 'prepare'.
The day no targets has any special things they need to do archprepare will die.

	Sam
