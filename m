From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] console - Add configurable support for console charset
 translation
Date: Wed, 4 Jun 2008 20:20:16 +0100
Message-ID: <20080604202016.1422ec09@core>
References: <48447615.5050806@am.sony.com>
	<20080604103353.GC27335@cs181133002.pp.htv.fi>
	<20080604183432.GC27768@mx.loc>
	<20080604190146.GE4189@cs181133002.pp.htv.fi>
	<20080604192137.GD27768@mx.loc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080604192137.GD27768@mx.loc>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Fischer <rep.dot.nop@gmail.com>
Cc: Adrian Bunk <bunk@kernel.org>, Tim Bird <tim.bird@am.sony.com>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

> So yes, 5k help, several 5k help more. I can see how it's problematic to
> represent that in menuconfig without adding too much clutter but still
> letting the user decide whether or not to include certain families of
> features, but that should not turn out to be a real problem.

Combinatorial explosions, ugly messes, maintenance.

Far better would be target the actual sizes and get stuff down in size
without removing feaures. There is some obvious 'easy reward' stuff here
- such as being able to build an output only console.

