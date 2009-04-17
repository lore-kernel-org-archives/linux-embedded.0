From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [Patch] Wait for console to become available, ver 3
Date: Fri, 17 Apr 2009 15:15:28 -0700
Message-ID: <49E8FF80.1020901@zytor.com>
References: <20090417213148.GA27825@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090417213148.GA27825@cuplxvomd02.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

David VomLehn wrote:
>>  
> +	consoledelay=mS	[KNL] Wait up to mS milliseconds for the a preferred
> +			console to be registered, then continue. Useful for
> +			systems where a console may not be plugged in, such as
> +			for USB serial devices.
> +

Pet peeve:

The symbol for millisecond is "ms".  mS is a unit of conductance, 
millisiemens.

	-hpa
