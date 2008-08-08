From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk output for crash logging
Date: Fri, 8 Aug 2008 16:13:44 -0400
Message-ID: <8bd0f97a0808081313v4df788b9xcd25308ca64b0862@mail.gmail.com>
References: <489BAD5C.2080009@cisco.com>
	 <1218210904.19162.144.camel@localhost.localdomain>
	 <8bd0f97a0808080905u1b515556gd68c2ba1d0b47cb4@mail.gmail.com>
	 <1218212266.19162.149.camel@localhost.localdomain>
	 <8bd0f97a0808081109q693f6f1at650a9be0547b7f9b@mail.gmail.com>
	 <1218226225.19162.189.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=BtM2U+Vh/YvNkgrkjxShuaQVc4gclxOKaUbQUgUn6H0=;
        b=T7P7TFHRRJ0D+XedwCA+mIWdAaHvjElzdXb/EzLN7XMnS9NwOyfe09j5++6EHVPt7H
         5PI0nHoEC+mNaGm5NGh2p7VSQH6+Gzh37vF32jmvsfkllEhtL6VW594gI/71f4uINPX9
         kgQk9nyYWtXijEn5cZFfE9cmNgTR/YsqajnNs=
In-Reply-To: <1218226225.19162.189.camel@localhost.localdomain>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Walker <dwalker@mvista.com>
Cc: dvomlehn@cisco.com, linux-embedded@vger.kernel.org

On Fri, Aug 8, 2008 at 4:10 PM, Daniel Walker wrote:
> On Fri, 2008-08-08 at 14:09 -0400, Mike Frysinger wrote:
>> > I invite you to give some of the "plenty of
>> > examples in the tree", you might surprise me..
>>
>> look at all the new syscalls added without any userspace code in place
>> (still) to use it.  or Linus' recent printk modifier extension.  or my
>> printk extensions for extracting portions of the kernel log buffer.
>> people usually submit interfaces with backend extesions, or the intent
>> to use it is obvious.
>
> Syscalls and Userspace are unrelated .. You clearly can't add userspace
> code to the kernel .. If you add a _kernel_ interface like David has
> done you need at least one user of the interface.. Otherwise it's just
> plain bloat inside the kernel which no one wants.
>
> Your changes for extracting part of the kernel log buffer (commit
> 0b15d04af3dd996035d8fa81fc849d049171f9c3),
>
> with:
>   text    data     bss     dec     hex filename
> 4322000  386760 2592768 7301528  6f6998 vmlinux
> without:
>   text    data     bss     dec     hex filename
> 4321876  386760 2592768 7301404  6f691c vmlinux
>
> Adds roughly 120bytes of bloat to my kernel, since 2007 .. What's the
> point? I grepped for users , and there are none ..

same sort of things as the point of David's code.  early/crash
scenarios for people to safely extract portions of the kernel log
buffer for transmission/storage elsewhere.  as was explained in the
original thread behind the commit.
-mike
