From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 0/3] RFC: direct MTD support for SquashFS
Date: Wed, 31 Mar 2010 08:35:49 +0200
Message-ID: <k2u2ea1731b1003302335s84cf9757t8127050d242710f6@mail.gmail.com>
References: <87mxxxltk6.fsf@tac.ki.iif.hu>
	 <1269955969-26123-1-git-send-email-wferi@niif.hu>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=/Zk6P+HeZ99cKt8qBS0ASmX2VipQX36P6T2p035M5ZE=;
        b=l7kuWbG/t/Bd66y+9K+owvA2XJEpa00vgX5snbyJkj/z1K3cO+B02dwH8yw8Nem1fK
         VbOWHGfgAhyKkM9ibL2SEa1YbKR5QvVWs9K2sIgHbVz3sgMfE+SwXdE1c0caCO7u5Jzf
         IeSr4K+BxqG1MiOSiuxnqkM3CUMXga/odtmxU=
In-Reply-To: <1269955969-26123-1-git-send-email-wferi@niif.hu>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ferenc Wagner <wferi@niif.hu>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, Phillip Lougher <phillip.lougher@gmail.com>, linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

2010/3/30 Ferenc Wagner <wferi@niif.hu>:
>
> Extra question: does squashfs_put_super require BKL protection?
>

We should get rid off of BKL, so if you need a lock, you should use a
local mutex.

Marco
