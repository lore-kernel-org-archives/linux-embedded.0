From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH] console - Add configurable support for console charset translation
Date: Thu, 5 Jun 2008 09:46:30 +0900
Message-ID: <20080605004630.GA26259@linux-sh.org>
References: <48447615.5050806@am.sony.com> <4845C7A3.1020607@zytor.com> <20080604025648.GA17524@linux-sh.org> <200806041236.12349.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806041236.12349.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wed, Jun 04, 2008 at 12:36:11PM -0500, Rob Landley wrote:
> Actually if you ever need to diagnose early boot stuff on _any_ platform, you 
> do need a console.  But it can be serial or netconsole, as long as that 
> works...
> 
Except for the minor fact that most early boot debugging happens long
before the console subsystem is even available..

At the risk of perpetuating the stupidity of this thread.. If you ship a
device to a customer expecting them to debug it for you, you are likewise
not likely to be very commercially successful, either. Devices are not
shipping with consoles, period. If you disagree with this, you've
obviously never shipped a device.
