From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: RE: [PATCH v2 0/5] cramfs refresh for embedded usage
Date: Wed, 30 Aug 2017 23:03:10 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1708302301460.2606@knanqh.ubzr>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org> <SG2PR06MB1165C1FB6FB5D43A10FD7D758A9D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=vxksHGEy+f5k63SNsNEOc/iTyY7H03VgDwuiHUrS25U=;
        b=C1aA2+3OwAbfFd50mXtVuKcy6EMQUlCsVJjG714EnQUZQ4sfYHBO/C8yEdLqcEoL+v
         qUoPQw47hP80h180/0J78zX2M2phXLYJuLJt5f/cUr14JJTCr0dzzbu25YPvJLFK5WCQ
         /dIMtiDjcYjl1fQGZxUWRvGeI26/c/zFZI9H0=
In-Reply-To: <SG2PR06MB1165C1FB6FB5D43A10FD7D758A9D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, 31 Aug 2017, Chris Brandt wrote:

> On Wednesday, August 16, 2017, Nicolas Pitre wrote:
> > This series brings a nice refresh to the cramfs filesystem, adding the
> > following capabilities:
[...]
> For this whole series:
> 
> Tested-by: Chris Brandt <chris.brandt@renesas.com>

Thanks


Nicolas
