From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: initramfs size limitation
Date: Sun, 1 Jun 2008 20:25:11 -0400
Message-ID: <8bd0f97a0806011725u3dc70e2cy1b317b2b6564f5c8@mail.gmail.com>
References: <4841481E.8090406@cox.net> <200806011903.47135.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=XozHJmI8iVuXSkIGeF9z+qumjmrquHD3SPMELhOcDE0=;
        b=M/RSCPnmrljQ/k3B8wG9o0pmlu+eQr8SEb5bwH4Lj/2fxyF5YGwtsetFlKi+MgxdyeMgS4+IcVzXQsylZI99yfQmyTpMveF24uBEGmZ+eOPyrCfYx/rsvCsdkHadS2LK4ouNm/OT29RDBnmNkU63MG/5EEMe8S01rzUFwTx/yAE=
In-Reply-To: <200806011903.47135.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: pwilshire@cox.net, linux-embedded@vger.kernel.org

On Sun, Jun 1, 2008 at 8:03 PM, Rob Landley wrote:
> On Saturday 31 May 2008 07:44:14 Phil Wilshire wrote:
>> I hope this is the right place and the right sort of question.
>>
>> I work closely with the Blackfin systems and they have now integrated
>> the initramfs generation into their system build. The result is great
>> the root fs is ready to run from the page cache.
>
> Is it possible to get blackfin working with a vanilla gcc release yet, or do
> you still need out-of-tree patches?  (I have a blackfin board I got at OLS,
> but it needs a toolchain I can't reproduce.)

there's plenty of usable binaries available

> fact it would be really nice if qemu grew blackfin support because messing

i imagine it would be ... too bad qemu lacks real documentation

>> There is one problem that I can see that may be more serious for
>> embedded users.
>> As far as I can tell the initramfs filesystem is not restricted in size.
>> You can keep writing files until it uses all available memory.
>
> Yup.  There have intermittently been patches to make rootfs be tmpfs instead
> of ramfs, the most recent of which I remember was:
> http://lkml.org/lkml/2007/7/13/354

it wouldnt matter.  tmpfs on NOMMU doesnt support any of the options
like MMU.  look at mm/tiny-shmem.c and init/Kconfig.
-mike
