From: Florian Fainelli <florian@openwrt.org>
Subject: Re: LZMA inclusion
Date: Wed, 3 Dec 2008 20:50:20 +0100
Message-ID: <200812032050.20857.florian@openwrt.org>
References: <492BA3FA.9010204@openwrt.org> <4936DFCD.2010204@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id:sender;
        bh=YGWCOpQxS3q0t9ut3DzIlBamJ0fkLvluq+Jb+vIpE4s=;
        b=ABzTIIp/DaY6ne1VGc0VfhJt5ClGq4n//oPjKjkVi8B6mx8w1ubLCl5TjgR8TQc+CV
         Ypi6WF+lpeUAOD5DGEY8ksb7+CyK8sjUl6ZUSufrGy3vESp4YiwIarbneMzuHAOFr4dQ
         c6BkYuUBk/t5Swhr/TM9bsKv0eoTRPEf+P81I=
In-Reply-To: <4936DFCD.2010204@am.sony.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tim Bird <tim.bird@am.sony.com>
Cc: glp@openwrt.org, linux-embedded@vger.kernel.org

Hi Gregers, Tim,

Le Wednesday 03 December 2008 20:36:45 Tim Bird, vous avez =C3=A9crit=C2=
=A0:

> Did anyone answer this?  CELF is currently considering funding
> a project to do this (add LZMA support to the kernel), and
> it would be good to get a feel for the current status...

There has been an effort for x86 to have kernels compressed using bzip2=
 or=20
lzma [1]. The LZMA decompression code in lib/ and could be used by othe=
r=20
architectures as well.

[1] http://lkml.org/lkml/2008/9/6/165
--=20
Best regards, Florian Fainelli
Email : florian@openwrt.org
http://openwrt.org
-------------------------------
