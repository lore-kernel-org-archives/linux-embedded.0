From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: Re: How to store kernel panic/oops
Date: Mon, 28 Dec 2009 19:03:48 +0100
Message-ID: <4B38F304.4020801@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=DWFXoMEdLXABLoLZ2dQbkVxN68YHYFB8EdvpA1vnpHc=;
        b=tVFLB2jEQ6UZJv16J5HtP0IWhfIdTK5s2SGOo3Z8xO6sHeVAJ6znIDl2RB3p3kjrr2
         KFnmP4zAckzVGMcDrPxNupzkFgsDqaMnqlkXJPm2LXKOnf/ZrJ9nElNqXXi3wn4Rmeca
         D8EYXVEV4Kkk2ADz3pVoiu19Itjvqbl5PWaGs=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dwmw2@infradead.org
Cc: CeLinux <celinux-dev@tree.celinuxforum.org>, Linux Embedded <linux-embedded@vger.kernel.org>

David Woodhouse wrote:

> Can't it be done with what's in the tree already? Just create an MTD
> device using phram or something else, then point mtdoops at it

Yes of course, if possible we shouldn't reinvent the wheel but I
wondered if there was something more specific. To add mtdoops (more or
less 1k) we have to add mtd subsys (more or less 14k) to the kernel to
achieve this and it's all overhead.

Marco
