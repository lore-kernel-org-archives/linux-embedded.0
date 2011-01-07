From: Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH 01/17] pramfs: documentation
Date: Fri, 7 Jan 2011 13:59:27 -0800
Message-ID: <AANLkTimtvYfHXG=rMLbFLzVaKbfB6nrj_ZE1AH4quRG2@mail.gmail.com>
References: <4D25AF02.60208@gmail.com>
	<AANLkTimGt5hi+TpFHWxktJEg3tcDQmmARdqFqzAt++OQ@mail.gmail.com>
	<4D2777FC.6040509@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type;
        bh=+gpCrddkNzseERSit0+cvo5L9pmbrulKL6AzEFcVzEM=;
        b=ZPwsFMKjxFDCzhFhGo7F+JDHwt61FsC6WWKpjUjsTkYIOVau8Tf3Yq7Q/fseBNCceA
         MwINMa5g8fc7NQvbMq/7aKY8EVZWsZp562mU9A2kfw5ViWzfs7rOgXm+jqgotBdkHUwB
         fbbCqr9M0LdbqbrVQX9dzFPc8Qfhjc3yPPl+8=
In-Reply-To: <4D2777FC.6040509@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

On Fri, Jan 7, 2011 at 12:30 PM, Marco Stornelli
<marco.stornelli@gmail.com> wrote:
> constraint). About the errors: pramfs does not maintain file data in the
> page caches for normal file I/O, so no writeback, the read/write
> operation are done with direct io and they are always sync. The data are
> write protected in hw when the arch provide this facility (x86 does).
> Inode contains a checksum and when there are problems they are marked as
> bad. Superblock contains checksum and there is a redundant superblock.

But you can still get pramfs inconsistencies if the system crashes at an
inopportune moment. E.g. when making files you write the new inode to
pramfs, and then you insert the entry into the directory. A crash between
these two operations leaves an allocated inode that doesn't appear in
any directory.  Without a fsck option, it will be hard to see that you have
this problem, and your only recovery option is to wipe *all* files by making
a new filesystem.

-Tony
