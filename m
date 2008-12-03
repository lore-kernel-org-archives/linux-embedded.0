From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: Re: LZMA inclusion
Date: Wed, 3 Dec 2008 20:58:52 +0100
Message-ID: <20081203195852.GB8563@mx.loc>
References: <492BA3FA.9010204@openwrt.org> <4936DFCD.2010204@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=cDGGftjvvwCHlff2jsj4NRE+nEHpU/r46oKBr75TzLI=;
        b=OsyVGKZALnz1d6FEoMNMKSpDmbHjDbbC9S0vWSBBF/CY10ArcGabhfU5ZwoGP6UQTF
         rIzWhLvcpnfz/GmNnM8esJPKuyXuO73XDSdpZLyhoUo2FiOhiAyFmYQbP36ePpnMvzb2
         JVcLHTtZT5WTZOWwa5X/vWdbz96WKd8y3nZns=
Content-Disposition: inline
In-Reply-To: <4936DFCD.2010204@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>, lasse.collin@tukaani.org
Cc: glp@openwrt.org, linux-embedded@vger.kernel.org

On Wed, Dec 03, 2008 at 11:36:45AM -0800, Tim Bird wrote:
>Gregers Petersen wrote:
>> There was a small talk a few days ago involving a few of the OpenWrt
>> developers and David Woodhouse. One of the topics discussed, was a
>> question about the potential of including LZMA in the kernel.
>> Such an inclusion would be quite benefitial in terms of embedded
>> systems, but the major hurdle seems to be the code quality of LZMA itself.
>> This leads to the question I would like to raise; are there ongoing
>> plans (or considerations) to rewrite and merge LZMA, and has anyone
>> started working on it in practical terms?
>
>Did anyone answer this?  CELF is currently considering funding
>a project to do this (add LZMA support to the kernel), and
>it would be good to get a feel for the current status...
> -- Tim

AFAIK xz will be/is incompatible with this older LZMA, perhaps
larhzu wants to chime in on that.

PS: A previous incarnation of that patch didn't work conventiently
for me, i had to do some small adjustments to the way it was put
into the kernel configury, like
http://repo.or.cz/w/buildroot.git?a=blob_plain;f=toolchain/kernel-headers/lzma/linux-2.6.22.1-002-lzma-vmlinuz.01.patch;hb=HEAD
http://repo.or.cz/w/buildroot.git?a=blob_plain;f=toolchain/kernel-headers/lzma/linux-2.6.22.1-003-lzma-vmlinuz.patch;hb=HEAD
