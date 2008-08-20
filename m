From: vb <vb@vsbe.com>
Subject: Re: Adding a new platform
Date: Tue, 19 Aug 2008 22:15:01 -0700
Message-ID: <f608b67d0808192215q5b8ffbf0w70531c31cdd66bcd@mail.gmail.com>
References: <48AB0A7A.8040209@cisco.com>
	 <7d1d9c250808192019g6ec73ec7x53563b8ad2130df@mail.gmail.com>
	 <f608b67d0808192057w29988500o2793dfb7f0c99314@mail.gmail.com>
	 <7d1d9c250808192129j3fb7ef28p8f404c6affd82078@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=TF1uNUpZ6gUgb3iK1/Jjbut010GeKsVS7UUzLXZvg5E=;
        b=fOHYizvAWLGN40uvA1X0665pTuWnCH0FfwYzJ5TQbivzsZ8yKIdyTUGWJmu4pft67P
         Mt2XTFfuFu1hvGqlFRmkEBaFGaJyVRNfyc0UEB1zoonT/nonZuYSUDhUwCtho73DPp5G
         u7Tc554kaZvAFUMFuWcfMsHryM3gUl4JZJoIU=
In-Reply-To: <7d1d9c250808192129j3fb7ef28p8f404c6affd82078@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Gortmaker <paul.gortmaker@gmail.com>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>, corbet@lwn.net

On Tue, Aug 19, 2008 at 9:29 PM, Paul Gortmaker
<paul.gortmaker@gmail.com> wrote:
> On Tue, Aug 19, 2008 at 11:57 PM, vb <vb@vsbe.com> wrote:
>>
>> so, say a developer submits a proprietary driver and it gets accepted.
>
> Doesn't happen.  By design.  If the driver is proprietary then it is presumably
> not meant for open distribution, and hence not compatible with GPL and
> widespread distribution into 100,000 public git repositories.  So it won't
> get submitted and it won't get accepted.
>

I guess 'proprietary' is not the right term then, how do you call a
driver which is not a secret and not a problem to release, but
controls some hardware present in only in certain devices of a certain
company.

Would such a driver be accepted? Wouldn't such a driver get stale
after a few kernel releases?
