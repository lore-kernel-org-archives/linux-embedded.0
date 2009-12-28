From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: How to store kernel pranic/oops
Date: Mon, 28 Dec 2009 12:43:23 +0100
Message-ID: <4B3899DB.1020308@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=vz9/FQH8g+8zTOsXc8Twj6TYMIvBpghePH96d+o/wEE=;
        b=Iy5PAzjjpSntd5H9NpFqV0GGIDuoesdvZ4yTqCKkYCYSfkHSZzd0wECJTXB+mvkDOn
         oxvWrvcvyfhFUT94mTuC4jCWvSuztLxEsC1k7tMvHDss1A7ZGTuzsQYz6UwDaaEwjrIk
         7FVmhFdZY4VAS0doChnzUKyYIqnd4kcBh0Kqk=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: CeLinux <celinux-dev@tree.celinuxforum.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Hi,

I know the open project proposal 2010 is closed, but it's just to start
a discussion. It would be nice to save oops/panic automatically in a
structure/file in ram. At the moment there are two way to save
information: mtdoops (save the information in flash), with kdump/kexec
(we can extract the dmesg from vmcore file). With these tools there are
some drawbacks:

1) There are embedded systems without a flash where to save the information;
2) we could consider this kind of logs too volatile for a flash, I mean
there's no reason to store it for a long time, it's important to recover
and read them as soon as possible, at next boot for example.
3) kdump requires a lot of ram and resources for embedded systems.
4) kexec is available only for some archs.

It would be nice to have a "ramoops" to save in a circular buffer in a
persistent ram this kind of information. Any comments? Is there already
anything similar out-of-tree?

Marco
