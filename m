From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: FPGA programming driver architecture
Date: Fri, 9 Jan 2009 00:07:09 +0100
Message-ID: <c384c5ea0901081507v5d186eai5ec71d56b4c7a972@mail.gmail.com>
References: <20081212150314.6ea24996.hugo@hugovil.com>
	 <82ecf08e0901081414u15af3c2dy9c88a242db024dc7@mail.gmail.com>
	 <c384c5ea0901081447i5ad807b3yb0ec3adebeaa46a0@mail.gmail.com>
	 <200901082357.24432.florian@openwrt.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Om5QjcZNKMKKQlY7oV3Jo+/ED6GiMDkduVqoxoNmfAg=;
        b=Gb0Q7+1FLxlZXaWoI0iXrCaMiEAZBVAYwF5uqNypUKXmyhCeR8EYW4shU0uR2QYRrc
         wBLyg3BM+zZsEY21LoNMzWzs+ADtR0sOVbVyY05ZQOEjU24SkjrD64ex2KeppIYB3JiO
         1jF6wdIPYwAjuYuktioguiml72q+holV/q3QA=
In-Reply-To: <200901082357.24432.florian@openwrt.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Florian Fainelli <florian@openwrt.org>
Cc: Thiago Galesi <thiagogalesi@gmail.com>, Hugo Villeneuve <hugo@hugovil.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Hello,

On Thu, Jan 8, 2009 at 11:57 PM, Florian Fainelli <florian@openwrt.org>=
 wrote:
> Le Thursday 08 January 2009 23:47:58 Leon Woestenberg, vous avez =E9c=
rit :

>> The programming back end should be generic enough so that it can use
>> other subsystems.
>>
> That's the idea behind using request_firmware, which provides you wit=
h both a
> pointer to the data and the size of the blob.

I know, that's what I would call the front-end (near userspace).

I meant the low-level back-end (towards hardware):

> - fpgaload-core which contains all the code that can be shared
> between the drivers like requesting firmware, providing sysfs
> attributes,
> - fpgaload-spi would handle the low-level SPI connection
> - fpgaload-par would handle the low-level parallel connection
>
> fpgaload-ser and par would register with fpgaload-core and they could
> register a fpga loading callback which is low-level specific for
> instance.

My $0.02 was:

Those callbacks should also be able to accept chunks of data
(preferably in the same way using ptr/len).


Regards,
--=20
Leon
