From: Ran Shalit <ranshalit@gmail.com>
Subject: Q: file system for embedded
Date: Wed, 13 Jun 2012 23:31:05 +0200
Message-ID: <CAJ2oMhLpMJZ_UT1Z+12s7=5hGjRbA9WNvv3CU4m9B2rDp9yr3Q@mail.gmail.com>
References: <CAJ2oMh++ji7YBrx6UcLdhPVDmLuTZCr8kGQR8aEAYWyob_ccBQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=98bHRN8641ghvwkS7P5+7868tnWDWsgyAjTlmcY3YkE=;
        b=MJbYb+ucWFj427cYkOJ8gTM+YpAkmu/Pu5tIPFY82ovASDgPIxj5lT/EiTNL3rWoiR
         BOC5tnqBtsRpp1hv+MbuDyYpiRGNifZ7j0LVeJKhygZkCUU3fFvs5gFv4mfVRmoEIlOz
         gD/KugB4lx7iCy6uNQt8um2hglnGHplmKXqinX4SjXoYO7BkfqTIKTfeA+dMclTak0RE
         rOdoycTh8Bbk6kRHh8i5EpXUmBwTooiHvVnzJSAE1pVo1VYqjq3RI9QMzbqK+BFhjY5p
         byWsG7yW+udutyW6FmapfFL1NQ47J0bNefHwtOqfbhmTwRLj8yVd5oyOiXdTRvbLfMJH
         2r6A==
In-Reply-To: <CAJ2oMh++ji7YBrx6UcLdhPVDmLuTZCr8kGQR8aEAYWyob_ccBQ@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Hello,

I hope you can help main understand issue of file system for embedded linux.
I read free-electrons "Embedded Linux system development training" and
some of the files recommended there such as cramfs, are aceesing the
flash during execution of apllications. As far as I understand
accessing the flash after initilization is not good in embedded
system.
Is there something here that I am missing ?

Thanks, Ran
