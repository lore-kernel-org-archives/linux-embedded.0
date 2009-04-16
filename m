From: Markus Brunner <super.firetwister@googlemail.com>
Subject: Re: root on Squashfs breaks mknod
Date: Thu, 16 Apr 2009 19:21:55 +0200
Message-ID: <200904161921.55667.super.firetwister@gmail.com>
References: <200904021340.27277.super.firetwister@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=4P01FuyhGpiUp8DEI+czzb8oStCidg4oyxbG4e0JbXw=;
        b=Q5+IMfkB68cKo+3iqCVNqn8MIq/stbEpbXEvYgDIytzyVJFMy1ux6GUIir/5Xq91hw
         BRa2PNQLKtLmBGHkvwT9Dis9R+XywaWmTLK0xmxsE5UhvpMr6xb+9N68dZOTzrIbTsYs
         uqxpO0KixwLIPUVpTaTOJiiHbcmKIRsJfjQQw=
In-Reply-To: <200904021340.27277.super.firetwister@gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: squashfs-devel@lists.sourceforge.net
Cc: linux-embedded@vger.kernel.org

Hi,

I've got good news:

1. It has nothing to do with squashfs, more with the readonly loopback device
2. The Problem is with an old version of uclibc
3. It's already fixed in the latest version of uclibc.
4. Everybody who cannot update uclibc, can use mknod of klibc


Best Regards

Markus

