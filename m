From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk output for crash logging
Date: Fri, 8 Aug 2008 12:05:17 -0400
Message-ID: <8bd0f97a0808080905u1b515556gd68c2ba1d0b47cb4@mail.gmail.com>
References: <489BAD5C.2080009@cisco.com>
	 <1218210904.19162.144.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=WUMeOz1fYiwAIzx98iY2gS49yFyiT6nTVIpGPUcLG1o=;
        b=ikt19vIuzmnxOb6jzfH0uuuA2GCZSQ6SB38t9H3xrB2v3b8i2cakMS+PRYCjN1Moxo
         D0sXcQJJU7JJ5V0xu57ei65S6DgsU0Wf/A3rhkG9OFpjxfmAsfbQT83UsFF5oPHizpTu
         bEL8O7dRyOeWJiSeSXK92CIj2nb4VcF7KqdUM=
In-Reply-To: <1218210904.19162.144.camel@localhost.localdomain>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Walker <dwalker@mvista.com>
Cc: dvomlehn@cisco.com, linux-embedded@vger.kernel.org

On Fri, Aug 8, 2008 at 11:55 AM, Daniel Walker wrote:
> Another note, usually when submitting new interfaces like this you
> should also submit the code that uses the interface .. In your case you
> might not be able to do that, but it could never be accepted without at
> least one user.

i really doubt that.  lack of existing tangible users makes it a
harder case, but it certainly is not a "never" case.  there is plenty
of examples in the tree where things were merged without any users and
the commit wouldnt be immediately leveraged.
-mike
