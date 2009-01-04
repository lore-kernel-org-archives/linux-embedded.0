From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 20:23:04 -0600
Message-ID: <200901032023.05001.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901020656.32013.rob@landley.net> <20090102140409.GA4758@mit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090102140409.GA4758@mit.edu>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Theodore Tso <tytso@mit.edu>
Cc: Christoph Hellwig <hch@infradead.org>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Friday 02 January 2009 08:04:09 Theodore Tso wrote:
> Sounds like though modulo dealing with 64-bit arithmetic, your patches
> are mostly dash/POSIX.2 comformant, so you're probably mostly good on
> that front once you address the 32/64-bit issues.  I'd also suggest
> explicitly add a reminder to the shell scripts' comments to avoid
> bashisms for maximum portability, to remind developers in the future
> who might try to change the shell scripts to watch out for portability
> issues.

I changed the scripts to start with #!/bin/sh and retested under dash.

If scripts say #!/bin/sh when they actually need bash, or say #!/bin/bash when 
they work with dash, that should probably be fixed.

Rob
