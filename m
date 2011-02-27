From: Tony Ibbs <tibs@tonyibbs.co.uk>
Subject: Re: [PATCH 3/5] Kconfig files and Makefile for KBUS
Date: Sun, 27 Feb 2011 19:36:35 +0000
Message-ID: <6393E8B5-077F-4FA9-8BCF-E26EC30B84AF@tonyibbs.co.uk>
References: <cover.1298829754.git.tibs@tonyibbs.co.uk> <ab146dd857b6cfa607b0ea426e1c99ddcebb756a.1298829754.git.tibs@tonyibbs.co.uk> <9d2ffc1567208d8890d7ef28f93f7a8914d753af.1298829754.git.tibs@tonyibbs.co.uk> <97f70d8d0a9026658bb08d8bb4b054124553a0cb.1298829754.git.tibs@tonyibbs.co.uk> <20110227101927.3a15e535.rdunlap@xenotime.net>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110227101927.3a15e535.rdunlap@xenotime.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>, Grant Likely <grant.likely@secretlab.ca>


On 27 Feb 2011, at 18:19, Randy Dunlap wrote:

> On Sun, 27 Feb 2011 18:11:46 +0000 Tony Ibbs wrote:
>> 
>> source "kernel/Kconfig.locks"
>> +
> 
> You can drop that line.

Thanks.

>> +        tristate "KBUS messaging system"
>> +        default m
> 
> Use tabs to indent kconfig entry text, like above (not spaces).

Drat. Thank you.

> Please do not enable new configs unless they are absolutely required.

And that , of course, makes sense. Thank you again.

Tibs
