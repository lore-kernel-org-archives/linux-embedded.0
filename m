From: Tony Ibbs <tibs@tonyibbs.co.uk>
Subject: Re: RFC: [Restatement] KBUS messaging subsystem
Date: Sun, 7 Aug 2011 17:47:19 +0100
Message-ID: <D4FF13B8-FD82-4E87-96DA-87A22DD536E4@tonyibbs.co.uk>
References: <cover.1300450604.git.tibs@tonyibbs.co.uk> <201105171050.38903.florian@openwrt.org> <37F5AF18-99E5-4516-B31F-00F7BD348ADE@tonyibbs.co.uk> <201107061815.36294.florian@openwrt.org> <5F531701-B760-45F0-989D-669013409FE8@tonyibbs.co.uk> <CADkLE3XRg6N2cWHXH_JsU56tfw5v5XmJJLfLBM_RtWJRMcZWtA@mail.gmail.com> <81866CAA-9010-4167-A556-84191E0BDFBA@tonyibbs.co.uk>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <81866CAA-9010-4167-A556-84191E0BDFBA@tonyibbs.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tony Ibbs <tibs@tonyibbs.co.uk>
Cc: Colin Walters <walters@verbum.org>, lkml <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Florian Fainelli <florian@openwrt.org>, Grant Likely <grant.likely@secretlab.ca>, Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>


On 3 Aug 2011, at 21:14, Tony Ibbs wrote:

> On 29 Jul 2011, at 00:58, Colin Walters wrote:
> 
>> You don't mention what your performance requirements are
>> (if any) for example.
> 
> We don't particularly have any...

My colleague says that he has previously done measurements that show
KBUS to be about 3 times slower than using shared memory and futexes,
but (of course) much simpler to use.

His implication is, I believe, that this is a respectable speed.

Tibs
