From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: Sources of entropy?
Date: Thu, 2 Apr 2009 08:03:08 -0400
Message-ID: <8bd0f97a0904020503uf434376s2ba8f9d0e8fcfa7b@mail.gmail.com>
References: <200903241847.29104.rgetz@blackfin.uclinux.org>
	 <20090402114553.GA7568@opentech.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=OOZAlR2EJ87khRf1qcXIyrONOrnBtVwi/VgOjt5Ao9Y=;
        b=BQJO73A/MzpRGrMQUYUEYzV13IriVjPF6SF0xGPdgqIfV2XfDg25n4mExmp1U/3bWt
         1/dlZc4o2zQQigaiRDB2u+HhSP+P9jMug3qWABzSA7f9L224cfUCw6kfCtbbRgjYfRMS
         JGLfAWBIW8YNStk1m8nDLkTyoKiqrhNmgN50c=
In-Reply-To: <20090402114553.GA7568@opentech.at>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Robin Getz <rgetz@blackfin.uclinux.org>, linux-embedded@vger.kernel.org

On Thu, Apr 2, 2009 at 07:45, Nicholas Mc Guire wrote:
> On Tue, 24 Mar 2009, Robin Getz wrote:
>> I'm just wondering what people using on standard embedded/headless/diskless
>> targets (which do not have hw random number generators) as a source of
>> entropy - since networking was removed as an entropy source circa 2.6.26
>
> without claiming that this is actually usable at this point but a simple
> source of entropy that looks quite good is simply to use the timer-counter/TSC
> or what ever available. The attached trng.c has been tested on a few X86
> systems and produces remarkably good random numbers - this might be suitable
> if you have no other sources available.

unfortunately on Blackfin parts, the TSC (we call it "CYCLES" as that
is the actual register name) is writable from userspace

i have used this in the bootloader as a simple way of getting a little
bit of entropy, but then i found that our system is too reliable in
booting -- it tends to take the exact same amount of time to boot to a
prompt
-mike
