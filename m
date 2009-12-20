From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: CELF Project proposal: UBIFS mount-time speedups
Date: Sun, 20 Dec 2009 14:46:08 +0900
Message-ID: <9c9fda240912192146u7e815d80o6915db5506336ba0@mail.gmail.com>
References: <4B26ECBD.9030005@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=g6sSAXEdap4j1Kbs4lBU+gyvfCCzclAbfnYhpJGwr4E=;
        b=ma2XDFrr6Xm07/5TApdauSUJ3DIoU76LkaNmFq4aZvoZMds1eNgvv972cZXwKstrIW
         72krlE0WuM1owTluxlYNvTck5EGWPZ+73bZdZ6w3ZZ7+OUJ+3sn8zT4R02uHgvvwPUbG
         veZfvJfsgx3vQ/SYWY69SKEDIaTsbVQuq9KAM=
In-Reply-To: <4B26ECBD.9030005@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: CE Linux Developers List <celinux-dev@tree.celinuxforum.org>, linux-embedded <linux-embedded@vger.kernel.org>
Cc: Tim Bird <tim.bird@am.sony.com>

Summary: UBI block mapping on flash (UBI2 requirement)

Proposer: Kyungmin Park

Description: UBI scans all physical block at boot time. and maintain it at RAM.
Usually this scan time takes almost 2 or more seconds. To reduce the this time
UBI maintain block mapping information on flash and use it at next boot time.

Also it have to support or provide rescan mechanism at runtime to use
single image into another flash

* UBI2
** see portions of
http://www.mjmwired.net/kernel/Documentation/filesystems/ubifs.txt

Scope: This project might take about 2 months.
