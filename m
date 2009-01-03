From: Jamie Lokier <jamie@shareable.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 03:22:42 +0000
Message-ID: <20090103032242.GA2872@shareable.org>
References: <200901020207.30359.rob@landley.net> <200901021026.37905.a.miskiewicz@gmail.com> <20090102094934.GB17841@infradead.org> <200901020656.32013.rob@landley.net> <20090102140409.GA4758@mit.edu>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090102140409.GA4758@mit.edu>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Tso <tytso@mit.edu>, Rob Landley <rob@landley.net>, Christoph Hellwig <hch@infradead.org>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embed

Theodore Tso wrote:
> perl is actually quite portable.

Portability aside, Perl has another fun issue.  The number of times
I've had a Perl script break when copied to a newer system which had a
newer version of Perl is... noticable.

> I'd also suggest explicitly add a reminder to the shell scripts'
> comments to avoid bashisms for maximum portability, to remind
> developers in the future who might try to change the shell scripts
> to watch out for portability issues.

You can force Bash into POSIX mode if that's helpful.

-- Jamie
