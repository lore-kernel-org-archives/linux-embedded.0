From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Mon, 28 Dec 2009 11:33:41 +0000
Message-ID: <4B389795.5060203@warmcat.com>
References: <20091221193038.38CB63F6EF@gemini.denx.de> <200912270127.35414.rob@landley.net> <4B373253.9050006@warmcat.com> <200912271821.38258.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=+uhAmFtKTGPB569YphlSCa/6k9ooxgbMfx7qgR8iMJ4=;
        b=bHgFnCLlZ8rdidAs0HtXrfAAMRcntN2lJKvD4meya7zH8kcdnL9TZj1Az2WnxMAtst
         25w8EP63mfGinHKUXfWfpitdCnhbU8B1NgkK3cnCve5I8D5IAcFdr2XSG59sLmWNtPct
         jMlVvp8EHsaJI3GUKgk2W6OCAD8pIUwL7pXNM=
In-Reply-To: <200912271821.38258.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Landley <rob@landley.net>
Cc: celinux-dev@tree.celinuxforum.org, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

On 12/28/09 00:21, Somebody in the thread at some point said:

Hi -

> I started programming on a commodore 64.  By modern standards, that system is
> so far down into "embedded" territory it's barely a computer.  And yet people
> did development on it.

My dear Rob I got started on a PET, I can understand your POV :-)

> kicked into the server space by the iPhone and such.  I want to follow Moore's
> Law down into disruptive technology territory and find _out_ what it does.

The big challenge I see is delivering highly complex Linux devices with 
insufficient developers in a way that won't disappear up its own ass and 
kill the project / customer with delays or failure to perform.

It's nice if the device is efficient with every cycle, but that is a 
geek preoccupation.  Many customers in suits will tell to spend an extra 
$1 to overcome it by hardware and gain back $5 from accelerated time to 
market, so long as they can depend on the high quality of the software 
basis to not kill that logic by delays.

-Andy
