From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Sat, 13 Jun 2009 16:59:57 +0100
Message-ID: <20090613155957.GA16220@shareable.org>
References: <4A33A7A2.1050608@gmail.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A33A7A2.1050608@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Daniel Walker <dwalker@soe.ucsc.edu>

Marco wrote:
> Linux traditionally had no support for a persistent, non-volatile
> RAM-based filesystem, persistent meaning the filesystem survives a
> system reboot or power cycle intact. The RAM-based filesystems such as
> tmpfs and ramfs have no actual backing store but exist entirely in the
> page and buffer caches, hence the filesystem disappears after a system
> reboot or power cycle.

Why is a ramdisk not sufficient for this?

Why is an entire filesystem needed, instead of simply a block driver
if the ramdisk driver cannot be used?

It just struck me as a lot of code which might be completely
unnecessary for the desired functionality.

-- Jamie
