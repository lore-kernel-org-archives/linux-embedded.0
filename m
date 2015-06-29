From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 3/3] printk: implement support for extended console
 drivers
Date: Mon, 29 Jun 2015 11:49:14 -0400
Message-ID: <20150629154914.GQ15805@mtj.duckdns.org>
References: <1430318704-32374-1-git-send-email-tj@kernel.org>
 <1430318704-32374-4-git-send-email-tj@kernel.org>
 <CAMuHMdWwH-3kx1ma5KE=fP94by8boxM_QYqPKpU=YJw8t3hYeg@mail.gmail.com>
 <20150629152805.GM15805@mtj.duckdns.org>
 <CAMuHMdXTn0+z4PV9UVZZmpMdk_-JUc4x-GqZweOhQyYMTzSOGQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=VttVg2ATEU68RFVAbQMZVdk3+hZKaZfKi8N2O000Qhw=;
        b=dEtaP/WFcNTIB4mbCM/Nm2mXLFGM+cmh0DIeqnPtbXsRC8lBqKdX1yTxBZXh/0u+pH
         1rkug56+tiFkqOFJJmnC3GJniABuTvPyxMMkea1xoi5XD+H72CMpmCeT+2b67IxjLV+i
         rPJRhjMVX3FSe3YrVZOouMRFzvhgbZ7L5DCkDgLbzMVeW3DVyGveW6DtXVUHrwJejXIh
         5spO2PfqpKcqhYbtghsLdWt5hsMVvjsys56trWk9CJ2xOtJfrhRISEZT76lqMuiLmIG3
         SuP905uJKMkHvrrRxGFjAqVem7sVqke/BdOUyc1fDFm7SOpS8wRz/2hsZBy5prDXkOjU
         zUAQ==
Content-Disposition: inline
In-Reply-To: <CAMuHMdXTn0+z4PV9UVZZmpMdk_-JUc4x-GqZweOhQyYMTzSOGQ@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: pmladek@suse.cz, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kay Sievers <kay@vrfy.org>, Josh Triplett <josh@joshtriplett.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Mon, Jun 29, 2015 at 05:47:49PM +0200, Geert Uytterhoeven wrote:
> > netconsole itself is optional & modular.  I'm not sure making further
> > splits is called for, especially given the use cases.
> 
> It could be a hidden option, selected by its users (e.g. netconsole).

Hmmm... what do you mean?

Thanks.

-- 
tejun
