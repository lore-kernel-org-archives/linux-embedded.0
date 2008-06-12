From: Shaz <shazalive@gmail.com>
Subject: Re: Cross Compiler and loads of issues
Date: Fri, 13 Jun 2008 00:02:06 +0500
Message-ID: <7b740b700806121202w73c7f442k1bf8625e375b83df@mail.gmail.com>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
	 <402b1f4b315f572ac6459f78fa8b5ee4.squirrel@www.geekisp.com>
	 <20080612184927.GA8363@nibiru.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=6aKS8UVqw00rFmZ7rc/Zno6sq7FgEY+Yb0nptDHr+ok=;
        b=RiatQvHm8J6ZIFSYTiM5/x4GbeKckHQqToKSxdmeUxzQlD0YNHjXg5/vYLQKams86B
         TzwoCWm7i+KLMi5E6rn87hG5f5Jz1kXGLbg5ti+PdLKEzfqBtrgZb8KDjmaCDUJvPdK6
         590SNXfEuRNkYH3KuX/1Tv91K9iB9gi1aC61w=
In-Reply-To: <20080612184927.GA8363@nibiru.local>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: weigelt@metux.de
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Thu, Jun 12, 2008 at 11:49 PM, Enrico Weigelt <weigelt@metux.de> wrote:
> * Bill Traynor <wmat@naoi.ca> schrieb:
>
>> There is no "one good way".  I've had decent success building Dan Kegel's
>> "crosstool" in the past: http://www.kegel.com/crosstool/
>
> I'd also like to mention Yann's crosstool-ng :)
I guess I have to reconsider cross-tool because earlier I visited this
http://www.kegel.com/crosstool/crosstool-0.43/buildlogs/ and I want to
get the latest kernel up and running on OSK OMAP5912, arm9. The board
is in process of shipment but I started out with a qemu
(arm-generic/versatilepb) based test run.

I am in the middle of a confused experience :-)
>
>
> cu
> --
> ---------------------------------------------------------------------
>  Enrico Weigelt    ==   metux IT service - http://www.metux.de/
> ---------------------------------------------------------------------
>  Please visit the OpenSource QM Taskforce:
>        http://wiki.metux.de/public/OpenSource_QM_Taskforce
>  Patches / Fixes for a lot dozens of packages in dozens of versions:
>        http://patches.metux.de/
> ---------------------------------------------------------------------
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
Shaz

Security Engineering Research Group,
Institute of Management Sciences,
Peshawar, Pakistan

Group: http://serg.imsciences.edu.pk

Email: shazalive@gmail.com
cell: +92 300 5944647
