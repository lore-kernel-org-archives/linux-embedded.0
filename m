From: Linux Rules <linuzoo@gmail.com>
Subject: Help needed with porting 32-bit user ioctl to run on a 64-bit kernel
Date: Wed, 30 Nov 2011 11:42:04 -0800
Message-ID: <CA+ib0qH_8Ex10sjYH7abbFgaQaRRwKq73exn3jehjpts+Hx=aQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=bGo+oLsmVOe3OiLYl41PvofLL4u91Ku4vB4VJnPaPAo=;
        b=LQILVc+a0uUh51HMiHPBOkjlIDBVK3+O+mC+rhZn0ClPyDvlZlD2lfiLzw9aNebWYN
         gToJhTYyxDApHmd+Zfw4BIfbxFQ7gRyk6YZhVT+nobENqUwOPhS6BrW1GqC7QkxIzr+x
         r7+RbAVUYp4BbcfOrfXLyLWFhPWZ+fuQqzle4=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

All,

I am working on porting 32-bit application code to run over a 64-bit kernel.

The 32 bit code calls socket ioctl to programs some registers in the
driver (e1000) and then opens a raw socket.

The struct ifreq is used to construct the command as expected.

The problem i am facing is that, the data which is copied back into
the ioctl buffer is not visible in the user space at all.

[32-bit user space if req with command] ==> [IOCTL] ==> [64-bit
KERNEL] ==> [reads register copies result into ifreq->ifr_data in
kernel] ==> [The copied data is not visible in the user code].

Since the data i require is having a length of only 4 bytes,  i used
the ifr_data field itself as a buffer instead of using it as a pointer
to a buffer because i see that the ifreq structure is of 32 bytes
length and ifr_name is part of a union which has a size of 16 bytes.

I tried to do some debugging on this issue and found these:

the struct ifreq is 32 byte in 32-bit user space but is 40 bytes in
kernel space, this is probably because of the size of sockaddr inside
ifreq which is different for 64-bit, also copy_from/to_user is not
required because do_ioctl is already working on a copy of the ifreq
buffer.

I did some googling and found suggestions to use compat_ioctl to do
the porting, but that is pertaining to using the file_operations
structure, netdevice does not have a compat_ioctl, does it?

Any help is appreciated in this regard.

kind regards,
mz.
