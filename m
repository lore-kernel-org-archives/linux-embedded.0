From: Johannes Stezenbach <js@sig21.net>
Subject: Re: Recommendation for activating a deferred module init in the
	kernel
Date: Wed, 18 Jun 2008 11:38:12 +0200
Message-ID: <20080618093812.GB26377@sig21.net>
References: <48580116.9070504@am.sony.com> <20080617190750.GA31224@logfs.org> <485815F6.20507@am.sony.com> <485816B3.3080800@am.sony.com> <20080617202318.GC31224@logfs.org> <20080617163516.2be96400@vader.jdub.homelinux.org> <48583F3B.1090705@s5r6.in-berlin.de> <20080618000306.GA25466@linuxtv.org> <48585282.4020508@s5r6.in-berlin.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48585282.4020508@s5r6.in-berlin.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Tim Bird <tim.bird@am.sony.com>, Josh Boyer <jwboyer@gmail.com>, =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Wed, Jun 18, 2008, Stefan Richter wrote:
> Johannes Stezenbach wrote:
>> I think the USB bus enumeration can take significant time:
>> recognize a device is connected, turn on bus power, try
>> to read descriptors (bus powered devices might be slow to
>> respond after power up). And this will happen even with
>> drivers_autoprobe == 0, right?
>
> Probably... I don't know which particular steps happen in the USB core  
> before upper layer drivers are bound.  Not binding the [eou]hci-hcd PCI  
> driver would certainly be more effective.

Well, in embedded systems you often don't have a PCI bus,
but platform devices. Maybe it's as simple as delaying
the USB platform_device_register() call, I don't know.

Johannes
