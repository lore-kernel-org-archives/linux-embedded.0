From: Phillip Lougher <phillip-cnXvMjJKhjYG2Il/BtU0GPXRex20P6io@public.gmane.org>
Subject: Re: Status of SquashFS LZMA support in mainline
Date: Thu, 22 Apr 2010 02:37:25 +0100
Message-ID: <4BCFA855.8070407@lougher.demon.co.uk>
References: <4BCF9863.2000903@am.sony.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <squashfs-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <4BCF9863.2000903-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
	<mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
	<mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: squashfs-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
Cc: squashfs-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-embedded <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>

Tim Bird wrote:
> Does anyone (Phillip?) know the status of SquashFS support
> for LZMA compression in mainline?  I seem to recall that
> Phillip got the patches for this into linux-next sometime
> in January, but I'm not sure if the latest kernel
> (2.6.34-rcxx) includes this or not.
> 

Short answer, no it doesn't include this, Linus rejected my
changes to the LZMA code that made it available for
use by non init code (the LZMA code is currently only used by
initramfs/initrd and the kernel decompression code).

See the thread with the response from Linus here
http://linux.derkeiler.com/Mailing-Lists/Kernel/2010-03/msg01462.html

So even though AFAIK there was no issues with the Squashfs LZMA
wrapper, I had to drop it because it's useless without my changes
to the LZMA code.

I salvaged as much as possible, and submitted a second pull request
with only the new Squashfs decompression framework (so it can use different
decompressors cleanly).  This was accepted.


> I also see in Linus' git tree the following commits in
> March:
> 
> 2010-03-05	Linus Torvalds	Merge git://git.kernel.org/pub/scm/linux/kernel/git...
> ...git://git./linux/kernel/git/pkl/squashfs-linus
> ...org/pub/scm/linux/kernel/git/pkl/squashfs-linus:
> Squashfs: get rid of obsolete definition...
> Squashfs: get rid of obsolete variable...
> Squashfs: add decompressor entries for...
> Squashfs: add a decompressor framework
> Squashfs: factor out remaining zlib dependencies...
> Squashfs: move zlib decompression wrapper...

The partial pull is why the commit history is slightly confusing, part of the
work is there, but all LZMA work is mysteriously missing.

What now?  It's clear the Squashfs LZMA work isn't going to be accepted until
I clean up the STATIC and __init mess that Linus objected to.  This is one
of my next tasks when I get enough free time to work through the issues.  It
may be quite a lot of work because to fix this requires touching quite a
few different architecture files.  It's not something that's going to be fixed
in a couple of evenings :-(

Phillip

------------------------------------------------------------------------------
