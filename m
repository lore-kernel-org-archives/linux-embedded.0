From: "Pawel Pastuszak" <pawelpastuszak@gmail.com>
Subject: Re: Marvel 88E6063-RCJ1 driver
Date: Wed, 17 Sep 2008 18:29:04 -0400
Message-ID: <8ff29df80809171529o7b83dafft30edf4c7217a04e@mail.gmail.com>
References: <d7555edbde4d54b0693fa7bddb894cfe@reliableembeddedsystems.com>
	 <1EE62668-5A00-483F-9301-EB9AAAAE118F@kernel.crashing.org>
	 <8ff29df80809171524k415583b1x62ee2106ec0b1bd8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Mbe+nnoP0zmECxzR0Vm+qb5H5/hfIu6QtizOog54Q0w=;
        b=bJAaTQI2BEU0RyODW2WPY9i12O43PVnSa1j6dFOfrtcNzHcyhDeGf2u2nHfWcVOsb9
         +MZsD9jd154SbQisfOBdUuTL7jIH8v4q4LuMYlZ6nRrvaWPHZrApz+T9jaKMn2JWrhBu
         mGdKPDDbqIdertEgF7SopO/sJOTX/XaOA4Aeo=
In-Reply-To: <8ff29df80809171524k415583b1x62ee2106ec0b1bd8@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org
Cc: "<linux-embedded-owner@reliableembeddedsystems.com>" <linux-embedded-owner@reliableembeddedsystems.com>

You don't need any driver for the 88E6063 it uses phy id to talk to
all its ports.. so all you have to do is make sure you set up your
board to not to bind to any phy address then you can uses it as a
switch..

Which Processor is this for...I created couple tool for the marvell
switch i uses 3 different type in that family of switch's

Pawel
