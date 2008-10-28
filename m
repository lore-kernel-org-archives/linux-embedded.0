From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH] phylib: add mdio-gpio bus driver (v2)
Date: Tue, 28 Oct 2008 03:41:15 -0400
Message-ID: <8bd0f97a0810280041l1903c7d1u15de218ebcda24fb@mail.gmail.com>
References: <20081027105318.21923.24436.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
	 <8bd0f97a0810270753m740a2295i492532f055f13b17@mail.gmail.com>
	 <4906C14F.6000305@teltonika.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=tYkTIYm3fkJ6TLVYfAW8noCF+t0H+yYo2iaMZzm2oxY=;
        b=uU49CdBrSrC+ErMH9pbOD3T7ApPy7JJFaI1NQAcAXPYe0Sk6C2OyvlHTEt5HZhTikj
         T5Vy7Hlb7MBaecU+kINHYJ+sfR4FYZC8PKStbOe60MAmLc9WWCrWpJnYam5zenf5chW+
         AdIzKsgAVDrJimDW1+V4V0Ib0WoRWxXjbxbAo=
In-Reply-To: <4906C14F.6000305@teltonika.lt>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org

On Tue, Oct 28, 2008 at 03:37, Paulius Zaleckas wrote:
> Mike Frysinger wrote:
>> On Mon, Oct 27, 2008 at 06:53, Paulius Zaleckas wrote:
>>> +       new_bus->irq = kmalloc(sizeof(int) * PHY_MAX_ADDR, GFP_KERNEL);
>>
>> oh, and this should be kcalloc()
>
> Why? kcalloc() fills allocated memory with zeros and in this case it has
> to be filled with -1... this is done by further for() routine. I don't
> see the point to fill it with zeros before...

i thought it was a call to kzalloc().  kcalloc() is better for arrays,
but if you dont need the memory zero-ed first, it's a hard sell of
proper style vs wasted performance.
-mike
