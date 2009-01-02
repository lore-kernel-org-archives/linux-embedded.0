From: Theodore Tso <tytso@mit.edu>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 09:04:09 -0500
Message-ID: <20090102140409.GA4758@mit.edu>
References: <200901020207.30359.rob@landley.net> <200901021026.37905.a.miskiewicz@gmail.com> <20090102094934.GB17841@infradead.org> <200901020656.32013.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757909AbZABOF2@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200901020656.32013.rob@landley.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Christoph Hellwig <hch@infradead.org>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Fri, Jan 02, 2009 at 06:56:31AM -0600, Rob Landley wrote: 
> That said, how is bash _worse_ than perl?  (Where's the second
> implementation of perl?  Even Python had jython, but perl
> has... what?  The attempt to rebase on Parrot went down in
> flames...)

(1) bash implies POSIX extensions; perl is actually quite portable.

(2) There are distributions that install with perl by default but not
bash; they use dash for speed reasons.

Sounds like though modulo dealing with 64-bit arithmetic, your patches
are mostly dash/POSIX.2 comformant, so you're probably mostly good on
that front once you address the 32/64-bit issues.  I'd also suggest
explicitly add a reminder to the shell scripts' comments to avoid
bashisms for maximum portability, to remind developers in the future
who might try to change the shell scripts to watch out for portability
issues.

							- Ted
