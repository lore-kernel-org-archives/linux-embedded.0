From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [RFC 0/6] Proposal for a Generic PWM Device API
Date: Wed, 08 Oct 2008 21:23:52 -0500
Message-ID: <48ED6B38.7030001@billgatliff.com>
References: <cover.1223482372.git.bgat@billgatliff.com> <8bd0f97a0810081227u15173a70ke6ab41ea8211e66c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0810081227u15173a70ke6ab41ea8211e66c@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike Frysinger wrote:
> On Wed, Oct 8, 2008 at 12:43, Bill Gatliff wrote:
>> This series proposes a "generic PWM" driver API.
> 
> seems that the API is solely geared to handle PWM as an output signal.

True.  The peripherals I'm currently targeting are output-only devices, and the
API reflects that.

>  what about input ?

Well, the SAM9263 has timer/counters that could be used to measure PWM period
and duty cycle.  But they are a different peripheral entirely.  I haven't done
an exhaustive survey, but I'm not aware of any PWM-generating hardware that is
simultaneously PWM-measuring hardware as well.  Seems like they are either one
or the other.

Are you proposing that the API accommodate both input and output devices?

> all the utility config functions lack "set" in their name.  it's a
> little confusing as to whether the function is a get or set at first
> glance.  rather than expecting drivers to poke directly into the
> structure, a set of "get" functions would work better (even if they're
> simply #define's that poke into the structure) and line up better with
> how the GPIO framework operates.

Good point.

Originally, I was thinking along the lines of a set-and-forget use case.  Do you
use "get" functionality much when generating PWM signals in your applications?


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
