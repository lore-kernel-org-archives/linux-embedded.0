From: Rob Landley <rob@landley.net>
Subject: Re: mpc8572e linux kernel board bring-up problem
Date: Wed, 23 Nov 2016 17:05:28 -0600
Message-ID: <553dc071-521f-e89c-e68e-c14ecd00c778@landley.net>
References: <MWHPR01MB2623BDB22229B22DFF06DDC2ECB70@MWHPR01MB2623.prod.exchangelabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=YC2clkfyzBNSlwOLuEw4KH1+UOBGapOdN5YSeXFkKu0=;
        b=IBraQlgt62uCTZLODXZpT6dXMKiS7lJbqMdO6UvXG8dUlGhEJLLieUCRnoPQeMIoj/
         qFWP7qVPbH34uFNvsWZIm2lTGlqf10N/FStDM08KFmfH0EWMQtRcRtjtBKOMs7jRekKW
         qFRmNNtyAytgIdNTvIh/rI//+1ZVRCCdpOU/Fo/GYpQqzjbEdK9zDc4Vmhov8Vw0zhNM
         acV8+KvYVcV8fVwKsG/lAAD6ZiOZlDUSYhc/iyomyhCSUlhPUa94rcKzOMQL0PeODSfJ
         ilJ/SNe6jYvdd/wGbi8QSEO6rkiAWBZomkxlZGmAEcPojzFGqhmTuPKDi//qckU+drW5
         4OUA==
In-Reply-To: <MWHPR01MB2623BDB22229B22DFF06DDC2ECB70@MWHPR01MB2623.prod.exchangelabs.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicolas Beland <Nicolas.Beland@dialogic.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 11/23/2016 08:00 AM, Nicolas Beland wrote:
> Btw, I'm on the right mailing list?

It's an ok mailing list for this but the volume here is pretty low. You
might have better luck on the powerpc mailing list.

The list of lists is at http://vger.kernel.org/vger-lists.html by the way.

If you want more rapid turnaround, freenode irc channels might (or might
not) work for that.

Rob
