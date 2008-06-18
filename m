From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Subject: Re: Recommendation for activating a deferred module init in the	kernel
Date: Wed, 18 Jun 2008 02:10:42 +0200
Message-ID: <48585282.4020508@s5r6.in-berlin.de>
References: <48580116.9070504@am.sony.com> <20080617190750.GA31224@logfs.org> <485815F6.20507@am.sony.com> <485816B3.3080800@am.sony.com> <20080617202318.GC31224@logfs.org> <20080617163516.2be96400@vader.jdub.homelinux.org> <48583F3B.1090705@s5r6.in-berlin.de> <20080618000306.GA25466@linuxtv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080618000306.GA25466@linuxtv.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Johannes Stezenbach <js@sig21.net>
Cc: Tim Bird <tim.bird@am.sony.com>, Josh Boyer <jwboyer@gmail.com>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Johannes Stezenbach wrote:
> I think the USB bus enumeration can take significant time:
> recognize a device is connected, turn on bus power, try
> to read descriptors (bus powered devices might be slow to
> respond after power up). And this will happen even with
> drivers_autoprobe == 0, right?

Probably... I don't know which particular steps happen in the USB core 
before upper layer drivers are bound.  Not binding the [eou]hci-hcd PCI 
driver would certainly be more effective.
-- 
Stefan Richter
-=====-==--- -==- =--=-
http://arcgraph.de/sr/
