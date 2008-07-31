From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [patch 0/4] [resend] Add configuration options to disable features not needed on embedded devices
Date: Thu, 31 Jul 2008 11:27:03 +0200
Message-ID: <20080731092703.661994657@free-electrons.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org
Cc: michael@free-electrons.com

Hi,

This is a resend of the small patch list I sent on July, 29th. I'm
resending the patches because they didn't make it to vger lists for
some setup problem on my side, and because I've been asked by Adrian
Bunk to resend them in order to get proper review.

However, please note that the patches removing ethtool and IGMP have
both been nack-ed by David Miller. The resend of these patches is not
an intent to workaround these NACKs in any way: I'm resending because
I've been asked to do so.

I apologize for the mess, and hope that this time, the mails will
reach vger lists.

Changes since previous post:

 * Add Matt Mackall's Signed-off-by on all patches
 * Make bonding and bridging select ethtool in the ethtool-related
   patch.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
