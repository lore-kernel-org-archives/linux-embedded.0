From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Subject: Re: [PATCH 01/17] pramfs: documentation
Date: Tue, 11 Jan 2011 16:42:57 +0100
Message-ID: <AANLkTi=fF_hskZ7kDEby0Uga0eaU_stM9qs890mUpxWd@mail.gmail.com>
References: <4D25AF02.60208@gmail.com> <AANLkTimGt5hi+TpFHWxktJEg3tcDQmmARdqFqzAt++OQ@mail.gmail.com>
 <4D2777FC.6040509@gmail.com> <AANLkTimtvYfHXG=rMLbFLzVaKbfB6nrj_ZE1AH4quRG2@mail.gmail.com>
 <4D281D65.1070102@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=am95BXZM67YV/9gkmKoR0F7OE8emOHBy9f31MS3iiJc=;
        b=lx+QY5ZqJR6ptSNmMyaRM4Jpe5ylCo/lViB1p6iNueKQQu3/IwIgWx6gsDap8WxMTR
         NW47QVvtA2SR4oc9ZODR8hQXCSwL2OyKUnPozV4giN1tqy1mzsr2G8mzuJHbYbbwg58x
         htlg/lC7wp7A9ENF0CG7kLTe2pgv3ewVCJgPE=
In-Reply-To: <4D281D65.1070102@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

2011/1/8 Marco Stornelli <marco.stornelli@gmail.com>:
> On 07/01/2011 22:59, Tony Luck wrote:
>> On Fri, Jan 7, 2011 at 12:30 PM, Marco Stornelli
>> <marco.stornelli@gmail.com> wrote:
>>> constraint). About the errors: pramfs does not maintain file data i=
n the
>>> page caches for normal file I/O, so no writeback, the read/write
>>> operation are done with direct io and they are always sync. The dat=
a are
>>> write protected in hw when the arch provide this facility (x86 does=
).
>>> Inode contains a checksum and when there are problems they are mark=
ed as
>>> bad. Superblock contains checksum and there is a redundant superblo=
ck.
>>
>> But you can still get pramfs inconsistencies if the system crashes a=
t an
>> inopportune moment. E.g. when making files you write the new inode t=
o
>> pramfs, and then you insert the entry into the directory. A crash be=
tween
>> these two operations leaves an allocated inode that doesn't appear i=
n
>> any directory. =A0Without a fsck option, it will be hard to see that=
 you have
>> this problem, and your only recovery option is to wipe *all* files b=
y making
>> a new filesystem.
>
> Is it a problem if you lost some logs? However do you expect that fsc=
k
> in this case will drop the inode?


IF there could be some inconsistencies in the file-system AND as long
as there is no way to fixup these inconsistencies than purging their
allocated space THEN I think the best approach would be clearing these
inconsistencies at the mount time and printing a WARNING message for
debug/stats purpose. Otherwise a user-space tool would be better
because it could be used in interactive mode, also.

Obviously the best would be to not have any inconsistencies at all.
However, in a real world, the thread-off between a journaling fs and a
simpler one in terms of code and memory usage could make acceptable
adopting a simpler fs than a journaled one. Kernel documentation
should inform clearly the user about pro/cons of adopting a simpler fs
especially about data loss conditions.

-RAF
