From: Bill Gatliff <bgat@billgatliff.com>
Subject: Question on "regulator" platform device
Date: Fri, 4 Mar 2011 08:41:00 -0800
Message-ID: <AANLkTinHgEeF6o1xkNvQFydqwfUJ1vAt-xsrXTSG2DaO@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Guys:


The text in Documentation/power/regulator/machine.txt describes how to
place regulator_init_data and regulator_consumer_supply structures
into the .dev.platform_data field of a platform_device structure.  The
platform_device.name field equals "regulator".

Trouble is, I can't find anywhere in the drivers/regulator code that
registers a platform_driver named "regulator".  Am I just going blind?


Thanks!


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
