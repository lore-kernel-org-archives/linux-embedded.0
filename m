From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv8] UBI: new module ubiblk: block layer on top of UBI
Date: Mon, 26 Sep 2011 17:36:07 +0300
Message-ID: <1317047776.9442.10.camel@sauron>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	 <1317047152-18809-1-git-send-email-david.wagner@free-electrons.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:reply-to:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:message-id
         :mime-version;
        bh=LtR332T26Y9kMPiD8XyBpCIcdCqGBslvdNJaUkicyjE=;
        b=HSurw3BcWDibF8trLbtzavlqXZgYSW/mXaI9insjrQyFyNB3vYeezzfUqAgBvPMR88
         meLLBgei23TnPL0YK0WUHRTFf3leXXfUSnd3BVs9VxPGhgoKB/+1NmZPZ1N+dVbggzYy
         FbNegfeTJMoD5Jk1Uzj7pW6lM0hiv2vwR4dhc=
In-Reply-To: <1317047152-18809-1-git-send-email-david.wagner@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Wagner <david.wagner@free-electrons.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>, Ricard Wanderlof <ricard.wanderlof@axis.com>, Arnd Bergmann <arnd@arndb.de>

On Mon, 2011-09-26 at 16:25 +0200, David Wagner wrote:
> +MODULE_PARM_DESC(volume,
> +       "Format: volume=<ubi_num>:<vol_id>\n"
> +       "Create a ubiblk device at init time.  Useful for mounting it as root "
> +       "device."); 

Sorry, you still did not change the documentation. It should describe
what this parameter is. Now I see that it requires volume ID.

-- 
Best Regards,
Artem Bityutskiy
