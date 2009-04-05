From: Phillip Lougher <phillip-cnXvMjJKhjYG2Il/BtU0GPXRex20P6io@public.gmane.org>
Subject: Squashfs 4.0 tools (for 2.6.29) released
Date: Mon, 06 Apr 2009 00:41:53 +0100
Message-ID: <49D941C1.1050007@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <squashfs-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
	<mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
	<mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: squashfs-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: squashfs-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Linux Kernel Development <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Embedded Maillist <linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi,

I'm pleased to announce the first release of the squashfs 4.0 tools.
These are needed by any Squashfs users using linux 2.6.29.  They are available
from http://sourceforge.net/projects/squashfs

The changes from the change-log are:

1. Unsquashfs improvements:

1.1 Support for 4.0 filesystems added.
1.2 Swapping macros rewritten.
1.3 Unsquashfs code restructured and split into separate files.

2. Mksquashfs improvements:

2.1 Swapping macros rewritten.  Fixed little-endian layout allows
     code to be optimised and only added at compile time for
     big endian systems.
2.2 Support for pseudo files added.

New Mksquashfs options

Mksquashfs now supports pseudo files, these allow fake directories, character
and block devices to be specified and added to the Squashfs filesystem being
built, rather than requiring them to be present in the source directories.
This, for example, allows device nodes to be added to the filesystem without
requiring root access.

Phillip

------------------------------------------------------------------------------
