From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: Evolution of Linux kernel sizes
Date: Wed, 27 Nov 2013 10:59:14 +0100
Message-ID: <20131127095914.GA4609@netboy>
References: <CAMuHMdUr2Vr9+STwcYf1PcB=PF+u3SJxU3LYnzqQ+vdbDsp71A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=F2Vh2LLlQptqLifB+M32viMoIW1h+gRVH5/WMXXvZOY=;
        b=rMFkqZLf4TJxESqU1dYLS1fOTqixBaFgC44NGH67irvxN+VwXazndHSBVuFFgAkQwK
         rlhTHwC+dKa1m6YolQRE/u0NDH3JSWalbkV9iQaW5QPhROpg+ebOJXQu54Y7FSh1N5El
         oqPpwa1/1vWmofYiUpP0/ibd91YitWaxDxyaGm9tvgHZBbLI1Vg2xFS2qDwCi7OvaBVM
         8uaujPVNclnRQlAATmw+z1VcKxo3obUIM1hbRawzFHvjjoJiAM/yhzXhcXvLjsYa91TO
         ElwlHjOhjhUw0OLf6v492teHwJx3HM9w9bnMKvv+o01aQqTWj1FVe5iugTelixDVNrBE
         doSA==
Content-Disposition: inline
In-Reply-To: <CAMuHMdUr2Vr9+STwcYf1PcB=PF+u3SJxU3LYnzqQ+vdbDsp71A@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 27, 2013 at 10:35:25AM +0100, Geert Uytterhoeven wrote:
> For v3.13-rc1, the top 10 is:
> 
> Disabling CONFIG_NET saves 1038404 bytes
> Disabling CONFIG_INET saves 572034 bytes

...

> I hope you find this useful!

As another poor soul stuck with tiny resources, thank you for this
work! Now, if I could only leave networking out...

Thanks,
Richard
