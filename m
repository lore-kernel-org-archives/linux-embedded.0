From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Sun, 11 Sep 2011 13:18:12 +0300
Message-ID: <1315736297.18731.1.camel@sauron>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1315280704.19067.14.camel@sauron> <1315282208.19067.24.camel@sauron>
	<201109081726.00769.arnd@arndb.de> <1315569206.7905.41.camel@sauron>
	<4E6A25B1.8070400@free-electrons.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:x-mailer:content-transfer-encoding:message-id
	:mime-version; bh=tqZP3FqMHMNGFy1A1oa3d3crQTv+fvX+j9iAfmSm6DU=;
	b=hBRkV0GGMc5iYURmNsxP8eD/UGIr9tbjUHNRuT/1oQtT2JUFc35GxBeKkgz8pMX6sN
	/XEk1ahvRgba63saX+I9LZd+Lm5jnJkgkMzsVuHmTB7oBwjevq2xSJ2k2SW/6EmrLhpu
	9PbCrw0uqsWorhO6wwe0PGVA8gwmKirgURuEM=
In-Reply-To: <4E6A25B1.8070400@free-electrons.com>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: David Wagner <david.wagner@free-electrons.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

On Fri, 2011-09-09 at 16:41 +0200, David Wagner wrote:
> > 1. Stick with the own cdev approach - the driver becomes very simple
> >    in this case - we review it.
> 
> This is the way it's implemented in v4, right ? 

Yes, but I though I sent you some feed back with minor things as well as
with major issue related to race condigions: you should keep the UBI
volume open as long as your block device is referenced, to prevent the
UBI volume from being removed.

-- 
Best Regards,
Artem Bityutskiy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
