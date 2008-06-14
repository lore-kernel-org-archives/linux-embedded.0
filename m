From: Shaz <shazalive@gmail.com>
Subject: Re: Cross Compiler and loads of issues
Date: Sat, 14 Jun 2008 14:44:35 +0500
Message-ID: <7b740b700806140244n734335b7n3b5f64546186e23b@mail.gmail.com>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
	 <20080612181902.ACEBF240E8@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Bwimearg93Y1XcW3RcfRorFYTAk977fakj/SWYNNKdI=;
        b=QRNeLxih/BEtdtXsKRhDrwuP9fV2Yz5gwWZiu3geGKq1ifuc9I+RS/mMVl37zu7ivX
         MuPpHQxMM9t+zqXIyBUBveSxYAD0wBT+qjdV/mIL+QGHDHCl9dj8FkFLepv+V5fPqeqJ
         EpUy4S8uWXSKY1SI+YdQuSmKtkde/1FhU57Uc=
In-Reply-To: <20080612181902.ACEBF240E8@gemini.denx.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wolfgang Denk <wd@denx.de>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Thu, Jun 12, 2008 at 11:19 PM, Wolfgang Denk <wd@denx.de> wrote:
> In message <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com> you wrote:
>>
>> I have been following "Re: [PATCH 0/1] Embedded Maintainer(s)" and
>> felt like asking that is there one good way to get a cross compiler
>> work. I tried buildroot, scratchbox and even openMoko with
>> openEmbedded but all of them had lots of issues and don't know which
>> will be the best alternative.
>>
>> I also went through the material provided freely by Free Electron but
>> still I am not successful to build a custom kernel. Next I am trying
>> MontaVista's kit. I just wish I don't get lost.
>
> For completeness, there is also the (free) ELDK. Some people are using it.
>

I got a toolchain giving an output. Going to test some stuff with
Qemu. I hope it works. ELDK seems to be a smooth tool. Now got to get
it working with my kernel, eclipse and target board :)

> [And yes, I'm obviously biased :-) ]
>
> Best regards,
>
> Wolfgang Denk
>
> --
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> A list is only as strong as its weakest link.            -- Don Knuth
>



-- 
Shaz
