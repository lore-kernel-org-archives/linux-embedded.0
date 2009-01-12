From: "Mark A. Miller" <mark@mirell.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Mon, 12 Jan 2009 04:55:32 -0600
Message-ID: <31014a580901120255q368714a7o897a328d9da479ad@mail.gmail.com>
References: <200901020207.30359.rob@landley.net>
	 <20090112101803.GB10086@uranus.ravnborg.org>
	 <31014a580901120222s747d9641o641b2991baa5f8f8@mail.gmail.com>
	 <200901121144.16255.neundorf@eit.uni-kl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901121144.16255.neundorf@eit.uni-kl.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Neundorf <neundorf@eit.uni-kl.de>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

On Mon, Jan 12, 2009 at 4:44 AM, Alexander Neundorf
<neundorf@eit.uni-kl.de> wrote:
> On Monday 12 January 2009 11:22:47 you wrote:
> ...
>> entire environment, QEMU allows it nicely with distcc at a reasonable
>> speed. (Albeit there is no distconfigure, but that's entirely an
>> unrelated tanget of muck and despair and rants against configure, but
>> we're not going there...)
>
> I'd be interested in hearing your issues with configure for cross compiling
> right ?
> I added cross compiling support to cmake, so I'm interested to see whether we
> did it better :-)
>
> Alex

Actually, I've mostly avoided that with doing most of the compiles in
QEMU. I just pine for a distconfigure, and rant about configure in
general, since it takes quite a while to do all the checks under an
emulated host, and it checks for *stupid things* in a lot of packages,
like, "Do we have the MacOSX 10.5 SDK installed...", when it already
determined that it was running on Linux, and...

Yah. Muck and despair...muck and despair.

-- 
Mark A. Miller
mark@mirell.org

"My greatest strength, I guess it would be my humility. My greatest
weakness, it's possible that I'm a little too awesome" - Barack Obama
