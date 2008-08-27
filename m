From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: "kernel access of bad area" while accessing flash
Date: Wed, 27 Aug 2008 07:33:56 -0400
Message-ID: <20080827113356.GA24166@yoda.jdub.homelinux.org>
References: <425469.77736.qm@web63401.mail.re1.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent:sender;
        bh=n0Vs9SCgQ7raH0boFkufgjR4axHsZdSjrF3BNgBSFaY=;
        b=vfGPTj3r2rOiPW5d9zY3c1bNNegq9jwHP2M0LRiYjGGRyPxraNYPUG86f8wTiWU5IF
         JaHz/mHQKEU7E9FKAPN7oWGvY0ubct8K3KK77zwE+tLV67b0y1vasYAU9AseH2TSz7Wf
         f5z66F5Qq914WO2/1alJGewv5hA82+3h/yCbQ=
Content-Disposition: inline
In-Reply-To: <425469.77736.qm@web63401.mail.re1.yahoo.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fundu <fundu_1999@yahoo.com>
Cc: linux embedded <linux-embedded@vger.kernel.org>

On Tue, Aug 26, 2008 at 08:13:39PM -0700, Fundu wrote:
>I have a PPC440GX based board.
>
>Do I need to reinitialize Peripheral Bank Configuration Registers (EBC0_B0CR-EBC0_B7CR) from the kernel ?
>I'm quite sure that we don't, but just want to make sure. Because the problem
>that i'm seeing strongly suggest that it's probably not accessible. 

Typically not.  The kernel tends to rely on the EBC registers being properly
programmed by the bootloader/firmware for the devices contained in it's banks.

>Here's the problem, i'm getting "kernel access of bad
> area" when i erase any of the upper 64mb out of 128mb flash region, surprisingly i can easily erase (all of the flash) from u-boot. which makes me ask the earlier question.   
>

That sounds more like a mapping issue than an EBC config issue.  Make sure
the kernel is calling ioremap on the entire flash memory region.

josh
