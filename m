From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 01/17] pramfs: documentation
Date: Sat, 08 Jan 2011 09:16:37 +0100
Message-ID: <4D281D65.1070102@gmail.com>
References: <4D25AF02.60208@gmail.com>	<AANLkTimGt5hi+TpFHWxktJEg3tcDQmmARdqFqzAt++OQ@mail.gmail.com>	<4D2777FC.6040509@gmail.com> <AANLkTimtvYfHXG=rMLbFLzVaKbfB6nrj_ZE1AH4quRG2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=4OpopWkGW0RY2HH4v/1eB7F/ALEufNucRm4Ao9dPps4=;
        b=t+hgaacggSulO5unoHlue8PLOd3AwIfaC+EMMZvr1nvKfXnbYOXEhZkSwjurAXxJZe
         ja/mX7q9/9OU0YHDRAu15xqGIu1mcLVKoFHCN9Q/zH1PUr6moBqBEG3PgiRDaBzt80bC
         tw/J7czqMm0tmEZh05fU2JJZ6qfViQ5w3wuGg=
In-Reply-To: <AANLkTimtvYfHXG=rMLbFLzVaKbfB6nrj_ZE1AH4quRG2@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tony Luck <tony.luck@intel.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

On 07/01/2011 22:59, Tony Luck wrote:
> On Fri, Jan 7, 2011 at 12:30 PM, Marco Stornelli
> <marco.stornelli@gmail.com> wrote:
>> constraint). About the errors: pramfs does not maintain file data in the
>> page caches for normal file I/O, so no writeback, the read/write
>> operation are done with direct io and they are always sync. The data are
>> write protected in hw when the arch provide this facility (x86 does).
>> Inode contains a checksum and when there are problems they are marked as
>> bad. Superblock contains checksum and there is a redundant superblock.
> 
> But you can still get pramfs inconsistencies if the system crashes at an
> inopportune moment. E.g. when making files you write the new inode to
> pramfs, and then you insert the entry into the directory. A crash between
> these two operations leaves an allocated inode that doesn't appear in
> any directory.  Without a fsck option, it will be hard to see that you have
> this problem, and your only recovery option is to wipe *all* files by making
> a new filesystem.

Is it a problem if you lost some logs? However do you expect that fsck
in this case will drop the inode?
