From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [RFC 0/6] Proposal for a Generic PWM Device API
Date: Wed, 8 Oct 2008 15:27:07 -0400
Message-ID: <8bd0f97a0810081227u15173a70ke6ab41ea8211e66c@mail.gmail.com>
References: <cover.1223482372.git.bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=TI8yZHTxRHjsqecgb6KK9xSrTfnhoANW2jg5k12EjqY=;
        b=j2dfeiWfvQisjU59M2ROl0XKg4z93piQZ9aH6Toslq2kmdcqZCTDIamS3+ASocMO00
         QuIibPZGQt1fncUcQASd/f05V0yS+GVWLJJmdi/oTSU45dTr0YeIGTtHN3RgfttPGTmz
         LsviXM+cLR/HLVAy0OY0Opozwsy759dUWYQCU=
In-Reply-To: <cover.1223482372.git.bgat@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Oct 8, 2008 at 12:43, Bill Gatliff wrote:
> This series proposes a "generic PWM" driver API.

seems that the API is solely geared to handle PWM as an output signal.
 what about input ?

all the utility config functions lack "set" in their name.  it's a
little confusing as to whether the function is a get or set at first
glance.  rather than expecting drivers to poke directly into the
structure, a set of "get" functions would work better (even if they're
simply #define's that poke into the structure) and line up better with
how the GPIO framework operates.
-mike
