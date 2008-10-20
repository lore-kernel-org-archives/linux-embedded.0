From: Marco Stornelli <marco.stornelli@coritel.it>
Subject: Re: UIO - interrupt performance
Date: Mon, 20 Oct 2008 13:55:41 +0200
Message-ID: <48FC71BD.9070703@coritel.it>
References: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <5958B8D7916AB84781FE0E7B57C218CB75AB98@306900ANEX2.global.avaya.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Douglas, Jim (Jim)" <jdouglas@avaya.com>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

I quite agree with Ben and Christian. I think UIO drivers are usable for
simple devices, I think they aren't mature (will it ever be?) to use it
with complicated devices or with strict requirement.

Regards,

Douglas, Jim (Jim) ha scritto:
> We are contemplating porting a large number of device drivers to Linux.
> The pragmatic solution is to keep them in user mode (using the UIO
> framework) where possible ... they are written in C++ for a start.  
> 
> The obvious disadvantages of user mode device drivers are security /
> isolation.  The main benefit is ease of development.  
> 
> Do you know what the *technical* disadvantages of this approach might
> be? I am most concerned about possible impact on interrupt handling. 
> 
> For example, I assume the context switching overhead is higher, and that
> interrupt latency is more difficult to predict?  
> 
> --jim douglas
> Avaya UK, Registered in England and Wales under Registered Number
> 3049861, Registered Address: Avaya House, Cathedral Hill, Guildford,
> Surrey, GU2 7YL.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Marco Stornelli
Embedded Software Engineer
CoRiTeL - Consorzio di Ricerca sulle Telecomunicazioni
http://www.coritel.it

marco.stornelli@coritel.it
+39 06 72582838
