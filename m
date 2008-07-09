From: Marek Skuczynski <mareksk@easymail.pl>
Subject: Re: building Rootfs
Date: Wed, 09 Jul 2008 10:22:20 +0200
Message-ID: <4874753C.4010601@easymail.pl>
References: <BAY131-W252EE4B85EEB3F7A87466FE2940@phx.gbl> <4871E98F.8030802@gmail.com> <20080707181018.GG4319@pengutronix.de> <63386a3d0807071334q2242ac45x540cee2a3fcb231b@mail.gmail.com> <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Haller, John H (John)" <jhaller@alcatel-lucent.com>
Cc: Linus Walleij <linus.ml.walleij@gmail.com>, linux-embedded@vger.kernel.org



Haller, John H (John) pisze:
>> What else is there out there for rootfs, really? A hack
>> from every embedded company there is? I'm more after
>> what people actually *use* and what is community driven
>> here, not so much opinions on what is best (which will
>> probably be the unwanted side effect of this mail
>> anyway...)
>>
>> Linus
> 
> There are three issues in building an embedded cross-filesystem:
[--CUT--]
> 3. Getting files into the filesystem when the development
> system does not allow root access.

Couple years ago, I found a simple solution for this issue. The 
filesystem image is described in the initramfs_list file format. That is 
  easy to modify (adding new nodes, fixing paths, etc).
The final image building scenario is as follows:

cat initramfs_list | check_fs_integrity | mk<fs>image > image_file

Of course the initramfs_list file is cooked up dynamically basis on 
configuration of kernel, drivers and etc.

mareksk
