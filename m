From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: PRAMFS with XIP support
Date: Tue, 7 Oct 2008 11:51:35 -0400
Message-ID: <8bd0f97a0810070851g69ad4c3exf195e5d6a983f772@mail.gmail.com>
References: <48EB288C.9050002@coritel.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=rkgSquzlZlHyAOsPzg3k+h5eo1BY8zinkDtXFfOfoCY=;
        b=QO7NAEkj0npgbOBuSI8C/VLu9mDRA+DIUOLM+lZ+iGg0XTVC/jnQsB6YenXez+Vp/Q
         1splCubSmJ7MLkR7gQRTn306OIFIhXkFLpLNyaHxRj4/MbWogS02XBsAS3Y5vexk7KO6
         PIxwMzRqlCMldOx651HyJxgrEp+CdQ8Hb4Gjw=
In-Reply-To: <48EB288C.9050002@coritel.it>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@coritel.it>
Cc: Linux-Embedded <linux-embedded@vger.kernel.org>

On Tue, Oct 7, 2008 at 05:14, Marco Stornelli wrote:
> I enjoyed to make a porting of pramfs to the kernel 2.6.26.5. In
> addition, I made a patch to add execute-in-place support. You can
> download the patches from the project site under "tracker/patches". If
> you have comments and/or suggestions you can write to me an email :).

why not submit it for inclusion to lkml ?
-mike
