From: Wookey <wookey@wookware.org>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi,
	lightweight bootloader
Date: Mon, 21 Dec 2009 20:49:08 +0000
Message-ID: <20091221204908.GR7001@dream.aleph1.co.uk>
References: <4B29EC68.1040109@0xlab.org> <200912202045.37159.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200912202045.37159.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

+++ Rob Landley [2009-12-20 20:45 -0600]:
> On Thursday 17 December 2009 02:31:36 Matt Hsu wrote:
> 
> I still live in hope that somebody will split the first part (coreboot) out 
> from the second part (grub) in embedded bootloaders.  

blob took this approach a long time ago (started 2000-ish) trying very
hard not to do any more than was needed in the normal version, and
having a uploadable extra part for interactive stuff but was only
adopted on a fairly small number of platforms.

Popular bootloaders always grow more bits and more hardware support
until they are no longer small. It's a very difficult trend to resist,
although good architecture helps.

The codebase is still there: http://sourceforge.net/projects/blob/

I always thought it was good code (especially since I've had far too
much to do with bootldr (from familiar) for the last few years (yuk!)).

Wookey
-- 
Principal hats:  iEndian - Balloonboard - Toby Churchill - Emdebian
http://wookware.org/
