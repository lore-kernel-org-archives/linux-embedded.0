From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/5] RFC: KBUS messaging subsystem
Date: Mon, 28 Feb 2011 00:52:33 -0700
Message-ID: <AANLkTim8w4LKjGSekq6jNvvdeBrUYTUMFgCVeduPxiod@mail.gmail.com>
References: <cover.1298829754.git.tibs@tonyibbs.co.uk> <20110228074859.GE7855@angua.secretlab.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20110228074859.GE7855@angua.secretlab.ca>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tony Ibbs <tibs@tonyibbs.co.uk>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>

On Mon, Feb 28, 2011 at 12:48 AM, Grant Likely
<grant.likely@secretlab.ca> wrote:
> On Sun, Feb 27, 2011 at 06:11:43PM +0000, Tony Ibbs wrote:
>> KBUS is a lightweight, Linux kernel mediated, message system,
>> particularly intended for use in embedded environments.
>>
>> It is meant to be simple to use and understand. It is designed to
>> provide predictable message delivery, deterministic message ordering=
,
>> and a guaranteed reply for each request.
>>
>> It is especially aimed at situations where existing solutions,
>> such as DBUS, cannot be used, typically because of system constraint=
s.
>>
>> We have various customers using KBUS in real life, and believe it to
>> be useful. I had a showcase table for KBUS at the ELCE in Cambridge,
>> October last year, and there seemed to be interest.
>>
>> I am hoping to get a response from this list before attempting to se=
nd
>> to the kernel list, since I believe this list should contain people
>> who might be most interested in using it.
>
> Just go ahead and post to lkml. =A0There isn't a whole lot of point i=
n
> holding back from there, and that is the only way you'll get the leve=
l
> of review that you need to even be considered for merging.

In fact, I think I'll hold off on reviewing this series until lkml is
cc'd so that I don't end up repeating myself.  :-)

g.
