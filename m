From: "Randy MacLeod" <rwmacleod@gmail.com>
Subject: Re: kernel dump solutions
Date: Thu, 21 Aug 2008 21:53:32 -0400
Message-ID: <21f828e90808211853r6e92f6b9ta4bf9252ed63eccd@mail.gmail.com>
References: <1218656903.10489.50.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=xhs8439rCqQEMhgrqPLtzmIkNZ/3rTU1lxyuhZUovow=;
        b=jxCuYeG4gONWozsd6zDGfmtFZh4YOgXYvW+cRC2KFY/guGO7F+z0hyPb0Bas8FruLX
         0oUaq4RmW+79i78toJP0h9lqxMtcx9r/UoZeB00MRvmIQ6ZhNPOeCwTuTlVHTzGT94YM
         8LGB/v97pGVD3NBt2ZabSk5cwkErNhXng4nKM=
In-Reply-To: <1218656903.10489.50.camel@localhost.localdomain>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Josh Boyer <jwboyer@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Aug 13, 2008 at 3:48 PM, Josh Boyer <jwboyer@gmail.com> wrote:
> Hi All,
>
> I'm curious what people are using for a kernel dump solution on embedded

Create a region of memory that pesist across resets.
Put kernel panic info, exceptiions and scheduling events into said memory.
Profit!

If only more manufactures would support this in the bios...
Intel and BIOS writter folks are you listening?


-- 
// Randy
