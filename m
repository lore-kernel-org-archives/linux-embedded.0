From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 16 Jan 2009 08:28:22 +0100
Message-ID: <200901160828.23159.neundorf@eit.uni-kl.de>
References: <495FEEAF.5020005@zytor.com> <20090114025115.GB22154@shareable.org> <200901160011.11679.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901160011.11679.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

On Friday 16 January 2009 07:11:09 Rob Landley wrote:
...
> P.S.  I still hope autoconf dies off and the world wakes up and moves away
> from that.  

Parts of it did already :-)
In KDE we switched to CMake, getting rid of automake, autoconf, libtool and 
m4, and many of those developers now bring CMake into other projects they are 
working on.
Still, the configure (or cmake) step remains, and it remains non-parallel, it 
is much harder to parallelize than the build itself.

Alex
