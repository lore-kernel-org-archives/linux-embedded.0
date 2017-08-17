From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Wed, 16 Aug 2017 21:17:45 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1708162111170.17016@knanqh.ubzr>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org> <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com> <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr> <SG2PR06MB116563FCF10E2615C65080F28A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141405390.17016@knanqh.ubzr> <SG2PR06MB1165D300028F81087B045C8A8A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com> <alpine.LFD.2.20.1708150001380.17016@knanqh.ubzr> <SG2PR06MB1165749BD3C8336AB0CD27618A8D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708160105470.17016@knanqh.ubzr> <SG2PR06MB1165E8DC60659449C24DD6B68A820@SG2PR06MB1165.apcprd06.prod.outlook.com> <alpine.LFD.2.20.1708161002500.17016@knanqh.ubzr>
 <SG2PR06MB116565941AF758C40E6145228A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=AFTOWDFEZr/QCTwkH+nwQY7YYcj4swaB0jxyyU24boA=;
        b=V6ZokfKTvamFksy0gDeGKvzfkixU7YBmzHtA7ZYJKIVXzsNBfWfyaqyOwjSloyjUPT
         67Kw+NP62nZiYL71iG8B0udFoIqtROlpm0R/EseiRMY4szWNfXfDq8Reb6as+HwGu8h1
         55aRC8VTQJ9PKNJT/DEuPCHt2FlfK6oDefIvM=
In-Reply-To: <SG2PR06MB116565941AF758C40E6145228A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, 16 Aug 2017, Chris Brandt wrote:

> I made an example once were all the graphics were RAW and uncompressed 
> and marked as XIP in AXFS. The result was a large saving of RAM because 
> as the graphics framework (DirectFB) would copy directly from Flash 
> whenever it needed to do a background erase or image re-draw (button press 
> animations).
> 
> Same went for playing MP3 files. The MP3 files were XIP in flash, so 
> mpg123 pulled from flash directly.

I wouldn't have expected mpg123 to mmap() its input files though.
If you use read() and not mmap() then you don't get the full benefit.


Nicolas
