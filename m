From: Lukasz Majewski <majess1982@gmail.com>
Subject: Re: [Vortex86] Vortex86DX SoC - HIGH_RESOLUTION_TIMER
Date: Tue, 12 Apr 2011 22:14:03 +0200
Message-ID: <20110412221403.1cc3f5c8@mig>
References: <20110412212739.5658f030@mig>
	<BANLkTikFFL1tPgBVwYBA3ocziNfGpW=ycQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:message-id:in-reply-to
         :references:x-mailer:mime-version:content-type
         :content-transfer-encoding;
        bh=31DvN7Y4DDj3FPyqYf4Vo3seclUG4iHXnboMGUapAJc=;
        b=TqqvvQapDVrr27rhVxhWVN46k6TGDkVxvPCu64HBP5HC8KLNjdm+0TvvZ0lZEoC3a6
         W06c92RVyeJxhPP0d93DrFS+JfhTpHur22B1N33L4YVQUcK2I1NxYMJlimQtJRvV97JP
         Boc8Y312PbRx9x16ZlmkL+cHSwGtJYExf5IXQ=
In-Reply-To: <BANLkTikFFL1tPgBVwYBA3ocziNfGpW=ycQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Carvalho de Assis <acassis@gmail.com>
Cc: linux-embedded@vger.kernel.org, linux-8086@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Tue, 12 Apr 2011 17:59:47 -0200
Alan Carvalho de Assis <acassis@gmail.com> wrote:

> Hi Lukasz,
> 
> On 4/12/11, Lukasz Majewski <majess1982@gmail.com> wrote:
> > Hi all,
> >
> > I'd like to kindly ask for some help with my embedded system.
> >
> > I'm using the Vortex86DX SoC (it's a x86 32 clone) on my PC104
> > board.
> >
> > I've managed to apply and run the 2.6.33.7.2-rt30 RT linux.
> >
> > It supports the full preemption (PREEMPT_RT enabled).
> >
> 
> I think you didn't send this email to right mailing list.
> 
> Please take a look here:
> 
> https://rt.wiki.kernel.org/index.php/Mailinglists
> 
> I suggest you to send your question to linux-rt-users@vger.kernel.org
> 
> Best Regards,
> 
> Alan

Hi Alan,

Thank you for the response.

I've already sent this mail to PREEMPT-RT list.

After that I've realized, that the problem with High Resolution Timer
sources is more broad, and maybe developers from various x86 related
mailing lists can help me a bit.

Best regards,
Lukasz
