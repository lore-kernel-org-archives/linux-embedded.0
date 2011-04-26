From: Bill Gatliff <bgat@billgatliff.com>
Subject: Expose regulator:set_consumer_device_supply()?
Date: Mon, 25 Apr 2011 21:16:55 -0500
Message-ID: <BANLkTi=dCHXEtv+=+sRaDp_Pt3zQy5o7ug@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Guys:


I have been looking at incorporating use of the voltage regulator
framework into one of my platforms, and have come across a problem
that I'm not quite sure how to solve.

In a nutshell, I have a lot of i2c chips, each of which is powered by
its own voltage regulator.  Among other things, I'm trying to write
the i2c drivers so that they are as platform-agnostic as possible,
because I intend for these drivers to be reused on future platforms
with different voltage regulator layouts.  On future platforms
regulators might be shared with multiple i2c chips, for example.

What I'm hoping for is i2c driver code that asks for a regulator based
on the name of the pin to which the regulator is connected.  So
instead of doing this:

i2c_chip_probe(i2c_client *this, ...)
{
...
   /* request the name of a regulator that will change
    * when the platform changes; ugh */
   reg = regulator_get(NULL, "VREG_U11");
...
}

... I can do this:

i2c_chip_probe(i2c_client *this, ...)
{
...
   /* ask for the regulator connected to our VDD pin */
   reg = regulator_get(this, "VDD");
...
}

The problem with i2c devices is that if you register them with
i2c_register_board_info(), you don't have a device pointer that you
can associate a regulator with.  So you have to register the regulator
after the i2c chip gets registered, which means doing it in the i2c
chip's probe method.  Ugly, and it won't work when regulators are
shared between devices.

A much cleaner way might be to pass a struct regulator_dev pointer in
the i2c chip's platform data, and then use something similar to
set_consumer_device_supply() to add the i2c chip's "VDD" pin as a
consumer of the regulator.  Or maybe that function exactly.

Any reason why we couldn't expose set_consumer_device_supply(), so
that I can add a device as a regulator consumer after a regulator is
already registered?


Curious,


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
