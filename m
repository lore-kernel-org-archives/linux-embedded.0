From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 01/17] pramfs: documentation
Date: Mon, 10 Jan 2011 19:17:33 +0100
Message-ID: <4D2B4D3D.2030903@gmail.com>
References: <4D25AF02.60208@gmail.com> <AANLkTimGt5hi+TpFHWxktJEg3tcDQmmARdqFqzAt++OQ@mail.gmail.com> <4D2777FC.6040509@gmail.com> <AANLkTimtvYfHXG=rMLbFLzVaKbfB6nrj_ZE1AH4quRG2@mail.gmail.com> <4D281D65.1070102@gmail.com> <20110110080839.GA16066@atrey.karlin.mff.cuni.cz> <987664A83D2D224EAE907B061CE93D5301940801B2@orsmsx505.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=3wbENuzi19KKtnBoKnI7OMtN8lwRHDnKRbmLiuyQlPM=;
        b=qbfkTdML+7lcISNsnqFd0Cr16aYp5SmEvcHFhzgOzKWzC/ygD1Yc4hXfVkiYG4CugG
         8Qn/ilmq97rz1JxkcyZHvvn5xkuyP5bhniW6PGcmO29WnvrVtqeo5nBxjEP+UDUYWwVi
         40vnBwdtqPswD7t+XFHfrFF7QD9CDtEm4rItQ=
In-Reply-To: <987664A83D2D224EAE907B061CE93D5301940801B2@orsmsx505.amr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

Il 10/01/2011 18:35, Luck, Tony ha scritto:
>> You'd be better running ext2 over special block device,
>> it is quite simple.
> 
> Marco,
> 
> You might want to spend some more time answering this question
> (it is a particularly good one).  What are the reasons to use
> pramfs, rather than a ext2 over a mem<->block driver.  You covered
> some in your part 0 patch (like ext2 wastes time getting optimal
> block placement for rotating media). But it might be a good idea
> to go back over them here.  From my (lightweight) reading of your
> code, it looks like the biggest benefit is avoiding duplicating
> the data in the pramfs memory region and the VM page cache ...
> which is a big deal for your target audience of hand held devices
> where memory is a somewhat scarce resource. But you probably
> have other goodness in there too.
> 
> -Tony
> 

I can add that you can "place" the fs wherever you want, ext2 not
without to build something "special" as Pavel said. Sincerely I don't
know what other add. I think documentation, web site information and
benchmark say all. You have got a fs that it's simple, it doesn't
consume a lot of resources (you can do a fine tuning via N and bpi
options for the metadata space for example), better in performance in
this "environment", with the memory protection feature when
available....other? I could write a piece of code that it turn on your
coffee machine at morning, what do you think? :)

Marco
