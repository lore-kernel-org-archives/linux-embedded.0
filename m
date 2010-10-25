From: Pawel Suchanecki <subdcc@gmail.com>
Subject: Re: How to spin down the SATA hard drive on ARM target (Open-RD)?
Date: Mon, 25 Oct 2010 18:35:47 +0200
Message-ID: <AANLkTi=Mh7X128uypFbcjNBNvQX6+XhzToGWAt-U5N4S@mail.gmail.com>
References: <AANLkTim6xmfWSF92GzenqfYOgzjj73TF6wS7QM06T=Ps@mail.gmail.com>
	<AANLkTinzVGgsCRuqdShJbCLO-CGFGd_Pt-jeYMZV1+sh@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type;
        bh=15SUjabzPo7tCRt/3PGplffrbO+piz6zhjaR78fr2g4=;
        b=cOUeWUlsjhd6PvywQxDST2lTe0Ejhu6IfgbfRUyUQox7CfC3smykWIfbvEfVEQ4jn2
         zW0TufL1I7xA9Cby4e/G/oEzBff+l0MU7otzAxtWRwhssU8h0V+44xmEH2WrO7ZoPuKy
         TEIW9GQGETiW2L7AwL/C0PLOKt0avnZlwRT0w=
In-Reply-To: <AANLkTinzVGgsCRuqdShJbCLO-CGFGd_Pt-jeYMZV1+sh@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

> How can this happen that hdparm replies with IO error when the device
> is there (and serving a working filesystem) ?


Guys,

I had a feeling to test hdparm -t/-T but it confuses me even more:

hdparm -t /dev/sda  <and>  hdparm -T /dev/sda

seem to work, providing reasonable stats.

Here is the output from the latter one:

root@XXXX:~# hdparm -T /dev/sda

/dev/sda:
 Timing cached reads:     436 MB in  2.01 seconds = 217.11 MB/sec

Any clues?


-- 
Robotics engineer * GNU generation member
Linux reg. user # 145057 * Open BSD secured
Perl programmer * C coder * Firmware engineer
