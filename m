From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Mon, 22 Aug 2011 10:42:13 +0300
Message-ID: <1313998939.2644.52.camel@sauron>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	 <1313587042-30846-1-git-send-email-david.wagner@free-electrons.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:reply-to:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:message-id
         :mime-version;
        bh=Oi+8ON14046du8uzDckQITgvjVDVhRDCRdQB8/m5dTk=;
        b=Jq0zET6u7Gf2CVYmJd1yL/RtZOS6PGqhj6g1thrzp5/Bbxw4I3XwydnST3nK/v8HsE
         6JsqIvhk1++iL7r0SNWtzFyYBf21pWC2FK64qqStqDVrGAEEvne64F04H5ShVP1qkdOm
         rE99RGWk/gvUKNyd+A0w06+NCNyZxK8Pr49s4=
In-Reply-To: <1313587042-30846-1-git-send-email-david.wagner@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david.wagner@free-electrons.com
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>, Arnd Bergmann <arnd@arndb.de>

On Wed, 2011-08-17 at 15:17 +0200, david.wagner@free-electrons.com
wrote:
> Questions:
> ==========
> I wasn't sure what magic ioctl number to use, so I settled to use the same one
> as a part of UBI: 'O', which was so far only used by UBI but on a higher range
> and leaving some room for UBI to add ioctls (for nw, it uses 'O'/0x00-0x06 and
> ubiblk uses 'O'/0x10-0x11).  Is it ok or should ubiblk use a different
> number/range ?

I think this is OK to share them between UBI and ubiblk, as long as this
is documented. But I always CC Arnd when it comes to ioctl-related
questions.

P.S. Arnd, you can always find the initial post in lkml, if needed.

-- 
Best Regards,
Artem Bityutskiy
