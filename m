From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] tools: fix cross-compile var export
Date: Mon, 8 Jan 2018 14:45:53 +0300
Message-ID: <20180108114553.37buovfs7qimokzq@mwanda>
References: <20180106201601.11074-1-martin@martingkelly.com>
 <20180107161140.GM6273@windriver.com>
 <549cf839-9ae7-78ce-58df-3d84fc7b3d05@martingkelly.com>
 <c021c0f9-4504-6323-98ed-455a196463fc@martingkelly.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2017-10-26;
 bh=973ml5aY0R/V1b4BD7ZBaak/DiAeYOnAOMQZphWqe7E=;
 b=Nv0koNETbK/m3wI46SEk8CIvyZpt9MZlB7CmxwbCnL/6dBSusPCD0utIwlA1ShcRGPa6
 ebsU0v2SoUeEmK+yxn68CZl+3XC0dCna88F7Sr4sSdQrxa8Ux4gPyw5lH9OBrsnd1rYs
 U9PPUck4qYX+rr+fNdv/I97Y6p+TTJ5XZJ0PAJqd9VcZjreHA0rEyEYiskJsACHiDjew
 dd47vOuL0wvv0OIeJMq3rPRwhw522TzGoQBHVXMn5pR0SaOcUIVHjSZPdgK/llcPdPWN
 quzwiRnknJNT/zdCkZhTIQmrQFYJ5ton829QWPibKjcWhvXKY8v35qy9OZclhEO2MUh+ 7w== 
Content-Disposition: inline
In-Reply-To: <c021c0f9-4504-6323-98ed-455a196463fc@martingkelly.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Kelly <martin@martingkelly.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-embedded@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Matt Mackall <mpm@selenic.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Sun, Jan 07, 2018 at 10:51:21AM -0800, Martin Kelly wrote:
> Urg, I accidentally sent to kernel-kbuild instead of linux-kbuild, changed
> now. It appears that past changes to tools/scripts/Makefile.include have
> been handled by linux-kbuild and often Masahiro Yamada.
> 
> Perhaps the best sequence here is to send a patch to kbuild adding the
> call-override function and calls to it to the main common Makefile. Then I
> can send individual subsystem patches dropping the individual CC = lines and
> similar. It will be 13 patches instead of 1 but will eventually result in
> the same thing.
> 
> Paul, any thoughts?
> 

That sounds good.

regards,
dan carpenter
