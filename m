From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [ANNOUNCE] CELF open project proposal
Date: Thu, 3 Dec 2009 22:38:07 +0900
Message-ID: <9c9fda240912030538j14ea07bdr7fa2f4c1b902405c@mail.gmail.com>
References: <4B15AAFE.4030705@am.sony.com>
	 <8bd0f97a0912021336xf1ef7ebmfb502efabec187cb@mail.gmail.com>
	 <4B16E03D.3000202@am.sony.com>
	 <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com>
	 <20091203062503.4300CE6D391@gemini.denx.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=r8HpI+OSAA4E+gSO+ff4iK5RSSWdS/9wnBJZCdugZZ4=;
        b=Bdn3U12X9zvcAz0GOgDtnXZ9qjfscK3bvq71rDPoKkoLZjM/IGuc7CBg72S6OeuSky
         b9NJ1EPLO8YSMqK8kCFq1ctM58CrqWPk15i0JSL3/Om88WyVIoEdZ9rrwA7FcTfnHN60
         gIlEEgKMr1rp7KbXVzbTrVy3Hw9ey9qSmDFMg=
In-Reply-To: <20091203062503.4300CE6D391@gemini.denx.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfgang Denk <wd@denx.de>
Cc: Aras Vaichas <arasv@magellan-technology.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, Dec 3, 2009 at 3:25 PM, Wolfgang Denk <wd@denx.de> wrote:
> Dear Aras Vaichas,
>
> In message <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com> you wrote:
>>
>> Support for 2nd stage booting from NAND with newer filesystems such as
>> UBIFS. i.e. simplified UBI/UBIFS read/write/format code in a small
>> footprint.
>>
>> TFTP server in a boot loader (U-boot or other). i.e. allows you to
>> push a firmware upgrade image to a device. I do know of a few of these
>> but they are not open sourced.
>
> U-Boot supports both TFTP (and NFS) downlod, and UBI/UBIFS.

How about the TFTP over USB? It's required feature for no ethernet devices

I wish some filesystem to share between u-boot and kernel. Of course
ext2 or fat is possbile. but current u-boot implementation depends on
block device or NOR device. not for NAND/OneNAND devices.

Finally very very small jpeg or png library for u-boot (under 30KiB).

Thank you,
Kyungmin Park
