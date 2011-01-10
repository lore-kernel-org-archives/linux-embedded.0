From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 01/17] pramfs: documentation
Date: Mon, 10 Jan 2011 09:14:29 +0100
Message-ID: <AANLkTi=DbZ8eU05Sq0jxpCTNKm7rW52FWVNbR16U3Zse@mail.gmail.com>
References: <4D25AF02.60208@gmail.com>
	<AANLkTimGt5hi+TpFHWxktJEg3tcDQmmARdqFqzAt++OQ@mail.gmail.com>
	<4D2777FC.6040509@gmail.com>
	<AANLkTimtvYfHXG=rMLbFLzVaKbfB6nrj_ZE1AH4quRG2@mail.gmail.com>
	<4D281D65.1070102@gmail.com>
	<20110110080839.GA16066@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=LHdPyMbpYKKn8PXITGTLLnMtLelHMMQKc8h/4HRNYRs=;
        b=t4+/SCb6vj9TzTLQK7XgtGS6s4lPje+2PM4lop1ZZ2zC1AgoEArCfNGYwQT4jrcqok
         iNAmoHCjpUrsVFRNiLxBHTB2W5AoYut2AvxDzkgglopxdcEtl2s7uYmIDZQszd/rh19x
         +UE0NxowFCXewbD/n+z35pxOSof6payDbNq/M=
In-Reply-To: <20110110080839.GA16066@atrey.karlin.mff.cuni.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pavel Machek <pavel@ucw.cz>
Cc: Tony Luck <tony.luck@intel.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

2011/1/10 Pavel Machek <pavel@ucw.cz>:
>> On 07/01/2011 22:59, Tony Luck wrote:
>> > On Fri, Jan 7, 2011 at 12:30 PM, Marco Stornelli
>> > <marco.stornelli@gmail.com> wrote:
>> >> constraint). About the errors: pramfs does not maintain file data=
 in the
>> >> page caches for normal file I/O, so no writeback, the read/write
>> >> operation are done with direct io and they are always sync. The d=
ata are
>> >> write protected in hw when the arch provide this facility (x86 do=
es).
>> >> Inode contains a checksum and when there are problems they are ma=
rked as
>> >> bad. Superblock contains checksum and there is a redundant superb=
lock.
>> >
>> > But you can still get pramfs inconsistencies if the system crashes=
 at an
>> > inopportune moment. E.g. when making files you write the new inode=
 to
>> > pramfs, and then you insert the entry into the directory. A crash =
between
>> > these two operations leaves an allocated inode that doesn't appear=
 in
>> > any directory. =A0Without a fsck option, it will be hard to see th=
at you have
>> > this problem, and your only recovery option is to wipe *all* files=
 by making
>> > a new filesystem.
>>
>> Is it a problem if you lost some logs? However do you expect that fs=
ck
>> in this case will drop the inode?
>
> Ask it the other way around.
>
> What is persistent filesystem good for when it is only persistent
> sometimes?
>
> You'd be better running ext2 over special block device, it is quite s=
imple.
>

Ok I can work on it. However can an userspace tool prevent the insert
of fs in linux next?

Marco
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
