From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [RFC] Remove more code when IP_MULTICAST=n
Date: Mon, 25 Aug 2008 18:31:31 -0400
Message-ID: <8bd0f97a0808251531n5bcee0fbg2c23e3318ad2a070@mail.gmail.com>
References: <20080819150047.38f09acf@surf>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=65HSoBcFzvaI+JnfCo5CRw6unTvH2Zm8tlWS2YtV4uY=;
        b=jQbktAjK6nflHLae95hBFOKq+a0PTfZ/Xw0FmcU7zyH+pNgAKEQfiKpYGo/s1QCVp2
         gWnJvSLt3rSBTf9+hk2l0yOMlNHrqf+GqxGYjWOxmjxE+rchS/H88AfDJskNfOlaX6cl
         NEMeRch0lz37JxfxM6zST3QiFp39ZKkSPneuo=
In-Reply-To: <20080819150047.38f09acf@surf>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-embedded@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

On Tue, Aug 19, 2008 at 9:00 AM, Thomas Petazzoni wrote:
> Index: linuxdev/include/linux/igmp.h
> +#define ip_check_mc(a, b, c, d) ({ 0; })
> +#define ip_mc_sf_allow(a, b, c, d) ({ 1; })
> +#define ip_mc_init_dev(a) ({ })
> +#define ip_mc_up(a) ({ })
> +#define ip_mc_down(a) ({ })
> +#define ip_mc_destroy_dev(a) ({ })
> +#define ip_mc_init_dev(a) ({ })
> +#define ip_mc_drop_socket(a) ({ })

i thought kernel headers in general use static inline stubs rather
than macros so that nested arguments get correct behavior (arg++).
-mike
