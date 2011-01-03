From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 01/16 v5] pramfs: documentation
Date: Mon, 3 Jan 2011 08:45:27 +0100
Message-ID: <20110103074526.GA2687@ucw.cz>
References: <4D0A5377.1020007@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D0A5377.1020007@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Hi!

> +But the disk-based fs over non-volatile RAM block driver approach has
> +some drawbacks:
> +
> +1. Complexity of disk-based fs: disk-based filesystems such as ext2/ext3/ext4
> +   were designed for optimum performance on spinning disk media, so they
> +   implement features such as block groups, which attempts to group inode data
> +   into a contiguous set of data blocks to minimize disk seeking when accessing
> +   files. For RAM there is no such concern; a file's data blocks can be

Yes, and they are also used on 99% of machines out there -> well
debugged.

Is there fsck for pramfs available, for example?

> +   This increases the efficient use of space on the media, i.e. more
> +   space is dedicated to actual file data storage and less to meta-data
> +   needed to maintain that file data.

So... how big is overhead of pramfs compared to ext2?

Can pramfs handle powerdown at arbitrary time?

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
