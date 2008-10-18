From: marco.stornelli@coritel.it
Subject: Power cut in management
Date: Sat, 18 Oct 2008 13:20:49 +0200 (CEST)
Message-ID: <4917.79.37.233.237.1224328849.squirrel@nausicaa2.coritel.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi all,

I'm working with a board where the power is turn on/off through a key as
in a car. Is there any design pattern to afford that? It's the first time
I have to manage a situation where the power can suddenly cut in anytime.
Hardware guys are working to get "time" to do a clean shutdown (I turn the
key but I still have the power) but any suggestions are welcome. However,
I can't use a simply read-only filesystem (at least for root fs) because
the board has got an sdcard that can be inserted (and then mounted in rw
mode) anytime. Thanks.

Regards,

Marco
