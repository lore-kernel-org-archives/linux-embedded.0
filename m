From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Subject: Re: [PATCH] phylib: add mdio-gpio bus driver (v2)
Date: Tue, 28 Oct 2008 09:37:51 +0200
Message-ID: <4906C14F.6000305@teltonika.lt>
References: <20081027105318.21923.24436.stgit@Programuotojas.82-135-208-232.ip.zebra.lt> <8bd0f97a0810270753m740a2295i492532f055f13b17@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0810270753m740a2295i492532f055f13b17@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org

Mike Frysinger wrote:
> On Mon, Oct 27, 2008 at 06:53, Paulius Zaleckas wrote:
>> +       new_bus->irq = kmalloc(sizeof(int) * PHY_MAX_ADDR, GFP_KERNEL);
> 
> oh, and this should be kcalloc()

Why? kcalloc() fills allocated memory with zeros and in this case it has
to be filled with -1... this is done by further for() routine. I don't
see the point to fill it with zeros before...

> -mike
