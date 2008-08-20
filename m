From: vb <vb@vsbe.com>
Subject: Re: Adding a new platform
Date: Wed, 20 Aug 2008 08:39:17 -0700
Message-ID: <f608b67d0808200839l2b41f0fejbf813a5dbc6e9fc4@mail.gmail.com>
References: <48AB0A7A.8040209@cisco.com>
	 <7d1d9c250808192019g6ec73ec7x53563b8ad2130df@mail.gmail.com>
	 <f608b67d0808192057w29988500o2793dfb7f0c99314@mail.gmail.com>
	 <7d1d9c250808192129j3fb7ef28p8f404c6affd82078@mail.gmail.com>
	 <f608b67d0808192215q5b8ffbf0w70531c31cdd66bcd@mail.gmail.com>
	 <20080820101044.5df8b7d8@hskinnemo-gx745.norway.atmel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=ohXzzxFroYexCsORSCP6xo4cwOEqP3nCULYJIydLnIA=;
        b=cg7n0qgjJrXigBsMFGVgfwDOnVxqUdoEg1LHfR1855svlXHj7grZwj4DYLL+86ULzr
         mQxCo+YJNoIKwUlRMqGuOitCod82S/tQtUIr6wGJZM+KZtACmnJp6cugNfbAAUNRqZ2I
         yyn4PuFJKO9n2YHPgW29L8wNuAUyTuGarvRUc=
In-Reply-To: <20080820101044.5df8b7d8@hskinnemo-gx745.norway.atmel.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>, corbet@lwn.net

On Wed, Aug 20, 2008 at 1:10 AM, Haavard Skinnemoen
<haavard.skinnemoen@atmel.com> wrote:
> vb <vb@vsbe.com> wrote:
>> Would such a driver be accepted? Wouldn't such a driver get stale
>> after a few kernel releases?
>
> Yes, the kernel contains tons of such platform-specific drivers. No, it
> won't get stale as long as someone who has access to the hardware is
> willing to test a -rc kernel every once in a while.
>
> You can't really expect to get away with no maintenance at all, but in
> my experience, it takes much less effort to maintain a driver in-tree
> than out-of-tree. It's also much easier to get help if it's in-tree.
>

fair enough, maybe this paragraph should be added to the original document.

cheers,
/v

> Haavard
>
