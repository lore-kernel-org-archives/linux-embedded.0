From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [ANNOUNCE] CELF open project proposal
Date: Thu, 3 Dec 2009 08:50:55 -0500
Message-ID: <8bd0f97a0912030550q5ea22b17w695318e8cd536abc@mail.gmail.com>
References: <4B15AAFE.4030705@am.sony.com> <8bd0f97a0912021336xf1ef7ebmfb502efabec187cb@mail.gmail.com> 
	<4B16E03D.3000202@am.sony.com> <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com> 
	<20091203062503.4300CE6D391@gemini.denx.de> <9c9fda240912030538j14ea07bdr7fa2f4c1b902405c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type;
        bh=6TGvjTGfzHbmgLi543nBNb8qbtvj2uUst9gFU/59mxE=;
        b=KLeKP4ri9pkfZ5GkrRtzYogHb3c2/nMnD3FnyyjAhGY0RwCS9guhPpanoyMG5Sv1k5
         XySJlG71R4N0RjCksI+dBVN4fywaK0Zgei0anytwBzA8jceq8UGp/BD+aDhw8WoRrnNV
         BgRiMX2baZITR12RzWeALW1m74vLnuzJfBrHA=
In-Reply-To: <9c9fda240912030538j14ea07bdr7fa2f4c1b902405c@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyungmin Park <kmpark@infradead.org>
Cc: Wolfgang Denk <wd@denx.de>, Aras Vaichas <arasv@magellan-technology.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, Dec 3, 2009 at 08:38, Kyungmin Park wrote:
> On Thu, Dec 3, 2009 at 3:25 PM, Wolfgang Denk wrote:
>> Aras Vaichas wrote:
>>> Support for 2nd stage booting from NAND with newer filesystems such as
>>> UBIFS. i.e. simplified UBI/UBIFS read/write/format code in a small
>>> footprint.
>>>
>>> TFTP server in a boot loader (U-boot or other). i.e. allows you to
>>> push a firmware upgrade image to a device. I do know of a few of these
>>> but they are not open sourced.
>>
>> U-Boot supports both TFTP (and NFS) downlod, and UBI/UBIFS.
>
> How about the TFTP over USB? It's required feature for no ethernet devices

you'll have to be more specific if you want a real answer.  U-Boot has
USB Ethernet gadget support already.
-mike
