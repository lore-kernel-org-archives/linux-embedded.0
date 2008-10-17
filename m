From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: PRAMFS with XIP support
Date: Thu, 16 Oct 2008 17:20:06 -0700
Message-ID: <6934efce0810161720q65dfb211v78745912e6743e9c@mail.gmail.com>
References: <48EB288C.9050002@coritel.it>
	 <8bd0f97a0810070851g69ad4c3exf195e5d6a983f772@mail.gmail.com>
	 <48EC5EB9.2050001@coritel.it> <48ECFB26.2090808@am.sony.com>
	 <1223491907.10283.91.camel@laptop-eth> <48EDAD3D.3040508@coritel.it>
	 <1223564414.10283.108.camel@laptop-eth>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=v75z9IQBhCEmSSAALGULw45SdiQq3hECUiG2UDa2zQ8=;
        b=BSIIf9/3z9WvnTMF/h3V3M8OAJ3gSKDDhf1YVgwpPwdfmztCICEn3Lfv68GKIZM+ck
         GVm+/Ejen9Pw7qqu37TRJkoCKSfuWKBJROq1ezsD0oSfWioD+YXgPSGQgVTQipCOCVYI
         t/MRWcwcvPAoHEfWOLCwGV+CiVUiQH/NWa2NQ=
In-Reply-To: <1223564414.10283.108.camel@laptop-eth>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Walker <dwalker@mvista.com>
Cc: Marco Stornelli <marco.stornelli@coritel.it>, Tim Bird <tim.bird@am.sony.com>, Mike Frysinger <vapier.adi@gmail.com>, Linux-Embedded <linux-embedded@vger.kernel.org>

I'd really like to see this.

> Since the feature was already submitted once (or twice even) I'd image
> there is a record of people comments in the list archives .. That should
> give a better idea of what needs to be changed ..

If they weren't recent, i.e. 2.6.26, they might not be too relevant.
The XIP framework changed a lot then.

> I looked at the code on the sourceforge page, and I saw a few clean ups
> that could happen. Otherwise, it didn't look bad in terms of code
> quality.

Which sourceforge page?
