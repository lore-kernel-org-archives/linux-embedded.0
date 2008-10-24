From: "Ming Lei" <tom.leiming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: USB, Host and Device on the same machine
Date: Fri, 24 Oct 2008 16:01:38 +0800
Message-ID: <d82e647a0810240101l49a4fe39la5e7976f3df743e0@mail.gmail.com>
References: <53e45cc30810240018w1c3c73c2nf9a9b606e0e7dea4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=SutlWzpmrHkKYofvhi39Mllotelp4zbwpQ22mpRlUj8=;
        b=N7pqig8QitQHQkM5TGpOTcPKQMu7lwNUoiPliAB7UQsMsDy+Y81kwP5jkug2y1MVmo
         QslGhJ9tQMNEv4yPS95Tz6L/xLNaGFLs5LLJih5iYFApPzqmAarCihnJXARxomx95LmN
         6yuN0R/53uQ/dOl+S58aAj3Y/k5l/HEtqy0UI=
In-Reply-To: <53e45cc30810240018w1c3c73c2nf9a9b606e0e7dea4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fredrik Johansson <frejo242-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

2008/10/24 Fredrik Johansson <frejo242-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hello
>
> I am working on an embedded machine that has two USB controllers, one
> is a OTG and the other is a pure host.
>
> I have succesfully used g_serial driver on the OTG controller in
> device mode and talked to my pc using the cdc-acm driver.
> With the g_serial unloaded I have also enabled the ehci-hcd and
> cdc-acm drivers and connected the host port to another serial device.
>
> The problem I have now is that I want to be able to have my embedded
> machine work as a device on the OTG port and a host on the host port,
> but if I load the ehci-hcd driver with g_serial already loaded it
> screws everything up since ehci-hcd driver attaches to both the OTG
> and the host controller, how can i prevent it from using the OTG
> controller?

It is a platform dependent problem.  what is your platform ?( musb? )
which buses do the otg controller and ehci controller attache to?

>
> Best regards
> Fredrik Johansson
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
Lei Ming
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
