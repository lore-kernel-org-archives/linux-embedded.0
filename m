From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: FPGA programming driver architecture
Date: Thu, 8 Jan 2009 23:47:58 +0100
Message-ID: <c384c5ea0901081447i5ad807b3yb0ec3adebeaa46a0@mail.gmail.com>
References: <20081212150314.6ea24996.hugo@hugovil.com>
	 <200812131358.03010.florian@openwrt.org>
	 <20090108151827.72f50cee.hugo@hugovil.com>
	 <82ecf08e0901081414u15af3c2dy9c88a242db024dc7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1763607AbZAHWsb@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=+2OudS6hRdBFkvRzQyqHaijxYjemwLM02PTr7M/Eago=;
        b=jQB6zkRV7tZTQaxtlGE/atxZ+1/vyfwDMvDsNHMVwxfJh9BKSr005tGfgPM6HyUNZL
         navHK+3xNGxqx56Vpedwl1xuSyCOI0F4nNtcngxGoI7D/sXPdduTzUF4DOg43S1UeDxj
         ujXnRWr5C6+GAEOR9hVQR4dh1yGW4xCT3nnPg=
In-Reply-To: <82ecf08e0901081414u15af3c2dy9c88a242db024dc7@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thiago Galesi <thiagogalesi@gmail.com>
Cc: Hugo Villeneuve <hugo@hugovil.com>, Florian Fainelli <florian@openwrt.org>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Hello,

On Thu, Jan 8, 2009 at 11:14 PM, Thiago Galesi <thiagogalesi@gmail.com> wrote:
>> > > Hi,
>> > > I have written some code to program a FPGA in Linux, for two
>> > > different types of boards: one uses a serial interface (SPI) and
>> > > the second a parallel interface. I have been able to sucessfully
>> > > program both boards. I'm now trying to clean my code and make it
>> > > more generic, as well as better in line with the Linux driver
>> > > model.
>
> Considering the several FPGA models available and ways to program it,
> I guess the important thing to consider is what can be made generic.

Indeed.

The programming back end should be generic enough so that it can use
other subsystems.

The FPGA configuration interface could be on the memory bus (and in
many cases the DMA helpers can be used) or behind a PCI bus, or can
even have SPI etc front-ends.

In general the programming API should accept a blob of data,
preferably in one chunk (pointer plus length) or at least 4kB chunks
or so, so that configuration is not severy overheaded by a callback
per byte (or even bit).

Regards,
-- 
Leon
