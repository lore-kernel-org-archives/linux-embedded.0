From: Rob Landley <rob@landley.net>
Subject: PATCH [0/3]: Simplify the kernel build by removing perl v2
Date: Sat, 3 Jan 2009 19:24:15 -0600
Message-ID: <200901031924.15869.rob@landley.net>
References: <200901020207.30359.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754449AbZADBYc@vger.kernel.org>
In-Reply-To: <200901020207.30359.rob@landley.net>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

Here's an updated set of patches to remove use of perl from the kernel build's 
"hot path" (roughly defined as "make allnoconfig; make; make 
headers_install").

This update incorporates feedback from Sam Ravnborg, Ted Tso, Joe Perches, 
Ingo Oeser, and others.  It also fixes an integer overflow error in the first 
patch, and all three scripts have been retested under dash.
