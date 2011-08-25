From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Thu, 25 Aug 2011 10:06:44 +0300
Message-ID: <1314256010.18988.18.camel@sauron>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	 <1313587042-30846-1-git-send-email-david.wagner@free-electrons.com>
	 <1313998939.2644.52.camel@sauron> <201108241823.20904.arnd@arndb.de>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:reply-to:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:message-id
         :mime-version;
        bh=aDCQeLWRdUQkIJhfMa563x6uVoTdpRiXDa9gaHg4rFM=;
        b=jUDSuBqeMAGtnCsLBQKlZrpKB2COe00omT2NnzVj4DGU85EVDUTVxWuwQqWOUMmpnv
         MHhmLPJDRDk5EEMY07fXuHmv6gLDbcgChAcnK7K2LRhEuU1IxH6nfQaIseHyerqcx/15
         7WFPS+EvHlWN938Gjzb+gkhGbQvaPqplkKadc=
In-Reply-To: <201108241823.20904.arnd@arndb.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: david.wagner@free-electrons.com, linux-mtd <linux-mtd@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

Hi Arnd,

On Wed, 2011-08-24 at 18:23 +0200, Arnd Bergmann wrote:
> That should  be fine, yes. I would probably put them into the same
> header file though if they are in the same number space even
> when you use them on distinct devices.
> 
> It does feel a little clumsy to have yet another character device
> to manage the block devices though. What do you think about one
> of these alternative approaches:
> 
> * When the ubi block device driver gets loaded, create one block
>   device per volume and let the user deal with permissions for
>   the devices instead of having to first create them as well.

I think this wasteful. Why should I have block devices which I do not
need? If I have 4 UBI volumes, and need only one ubiblk, why should I
waste my resources for 3 more of them (e.g., I do not want to waste
memory for struct inode for each sysfs entry which these useless block
devices will add). Also, will this mean 3 more block devices registered?

I think it is much uglier to have 3 "dummy" block devices and confuse
users than have one nice control character device. For the sake of not
having a separate control chardev?

> * Use the existing UBI control device for the block devices as
>   well and just add two more ioctls to create the devices.
>   You can add a logical bus_type for this so that the ubi block
>   driver gets automatically loaded matched with the device when
>   one is created using the control device.

This sounds  better IMHO, but I am still not sure that adding another
dummy bus and exposing it in sysfs and more complexity in the ubiblk
code is more elegant and less wasteful than just creating a separate
chardev...

-- 
Best Regards,
Artem Bityutskiy
