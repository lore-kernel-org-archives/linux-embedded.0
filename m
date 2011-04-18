From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] extra/1 Allow setting the maximum KBUS message size
Date: Mon, 18 Apr 2011 15:01:10 +0100
Message-ID: <20110418140110.GD9462@sirena.org.uk>
References: <cover.1300450604.git.tibs@tonyibbs.co.uk> <20110322133640.5d5c88e4@bike.lwn.net> <DBA665CD-BE12-4DC8-9B3F-4170BED789BD@tonyibbs.co.uk> <32934D05-E7A7-4A2C-92EF-96A0580F2234@tonyibbs.co.uk> <20110415164608.489d82bf@bike.lwn.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110415164608.489d82bf@bike.lwn.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>
Cc: Tony Ibbs <tibs@tonyibbs.co.uk>, Grant Likely <grant.likely@secretlab.ca>, lkml <linux-kernel@vger.kernel.org>, Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>

On Fri, Apr 15, 2011 at 04:46:08PM -0600, Jonathan Corbet wrote:

> That means getting more people to look at the patch, which could be hard.
> The problem is that, if you wait, they'll only squeal when the code is
> close to going in, and you could find yourself set back a long way.  A
> good first step might be to CC Andrew Morton on your next posting.

One other thing that it'd be good to see is a contrast and compare with
other similar things like the Android binder that are floating around.
