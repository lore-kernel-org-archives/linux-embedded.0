From: David Wagner <david.wagner@free-electrons.com>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Sun, 11 Sep 2011 12:35:53 +0200
Message-ID: <4E6C8F09.4060806@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>		 <1315280704.19067.14.camel@sauron> <1315282208.19067.24.camel@sauron>		 <201109081726.00769.arnd@arndb.de> <1315569206.7905.41.camel@sauron>	 <4E6A25B1.8070400@free-electrons.com> <1315736297.18731.1.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1315736297.18731.1.camel@sauron>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dedekind1@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd <linux-mtd@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

On 11/09/2011 12:18, Artem Bityutskiy wrote:
> On Fri, 2011-09-09 at 16:41 +0200, David Wagner wrote:
>>> 1. Stick with the own cdev approach - the driver becomes very simple
>>>     in this case - we review it.
>>
>> This is the way it's implemented in v4, right ?
>
> Yes, but I though I sent you some feed back with minor things as well as
> with major issue related to race condigions: you should keep the UBI
> volume open as long as your block device is referenced, to prevent the
> UBI volume from being removed.
>

Ah, yes, of course.  I made these changes and will send them monday.

Regards,
David.
