From: "Thiago Galesi" <thiagogalesi@gmail.com>
Subject: Re: FPGA programming driver architecture
Date: Thu, 8 Jan 2009 20:14:36 -0200
Message-ID: <82ecf08e0901081414u15af3c2dy9c88a242db024dc7@mail.gmail.com>
References: <20081212150314.6ea24996.hugo@hugovil.com>
	 <200812131358.03010.florian@openwrt.org>
	 <20090108151827.72f50cee.hugo@hugovil.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=gOgG8DvATYQNK0DVqhtkwEnEKI4jMHq24wliJpOpBVU=;
        b=WgPmxK/8jqOdDJ+b5H5nJxuiBM2B9FiDXMzaBDj7v/c9bSD3kUKDUkt5DdAFdsJGQX
         BeFp8orfAKNgXTo0bbZarVyqz0eyKTWA9I0d7zoMzJrGdGW75DMzlnrle2q6uWoL6nfA
         aTMfq81db1Kc68icOSFSvANWn+yaMz4QMRLaA=
In-Reply-To: <20090108151827.72f50cee.hugo@hugovil.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Florian Fainelli <florian@openwrt.org>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

> > > Hi,
> > > I have written some code to program a FPGA in Linux, for two
> > > different types of boards: one uses a serial interface (SPI) and
> > > the second a parallel interface. I have been able to sucessfully
> > > program both boards. I'm now trying to clean my code and make it
> > > more generic, as well as better in line with the Linux driver
> > > model.

Considering the several FPGA models available and ways to program it,
I guess the important thing to consider is what can be made generic.
(that is what will become fpgaload)

Also, there may be cases where after FPGA is programmed it "becomes a
device" (PCI or whatever)

> >
> > - fpgaload-core which contains all the code that can be shared
> > between the drivers like requesting firmware, providing sysfs
> > attributes,
> > - fpgaload-spi would handle the low-level SPI connection
> > - fpgaload-par would handle the low-level parallel connection

I think this maybe split into three layers (maybe)

1 - low level connection: paralell / spi / i2c / whatever
2 - vendor: xylinx, altera, etc
3 - generic stuff

Take a look at the MTD and SPI drivers and how they split things

--
-
Thiago Galesi
