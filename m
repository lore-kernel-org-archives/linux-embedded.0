From: "Bart Van Assche" <bart.vanassche@gmail.com>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Fri, 10 Oct 2008 18:37:06 +0200
Message-ID: <e2e108260810100937tfa294e3u179d15f538df15a5@mail.gmail.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=rDsp1R7aJ+7dvbm7tE7UoES++h/P5bZri11F42RIlyE=;
        b=PsYH2PfXNXKc+lF2ZQub9702S62GR7kVRKYqzuKd88lBkb2K65yyVmU/Wf+EXuL4IG
         Ux09X8tcKhCd/CqPjTyWq3taeQ7bVC/IywXdiQ0Qi56u/Ug+gzzqY2EP6IBJQoYUhgNP
         cUqG2c2vaHfVXVaSJnHdItUwdLPBsLsR+uOLE=
In-Reply-To: <200810101815.06249.thomas.cooksey@trolltech.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Cooksey <thomas.cooksey@trolltech.com>
Cc: linux-embedded mailing list <linux-embedded@vger.kernel.org>

On Fri, Oct 10, 2008 at 6:15 PM, Tom Cooksey
<thomas.cooksey@trolltech.com> wrote:
> Is there any way to get the physical address of mlock()'d memory from userspace?

Why do you need this information ?

Bart.
