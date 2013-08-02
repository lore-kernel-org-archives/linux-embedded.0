From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: AMP on an SMP system
Date: Fri, 02 Aug 2013 17:58:05 +0200
Message-ID: <51FBD70D.2030500@gmail.com>
References: <51FB6EE1.3090708@lumino.de> <20130802114225.GR3880@pengutronix.de> <51FBA261.10301@lumino.de> <51FBC7FE.4000403@gmail.com> <51FBCF46.4080700@lumino.de> <51FBD223.9020809@gmail.com> <51FBD782.9070309@lumino.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=G/3XNbB+r0r+muyodCO69nJGBKtqGhLvo9pigqlXwGg=;
        b=JVbXECxWdfWAfMp1PQngvhlpMkeitE+sULwFaac7H7fsekcImThBXTqaJksFyLBOHy
         XPc1tX+T3136Q7UlztUi5zmKlf0+PdjIf6GrSJheMihiiRQBbKrDyeaLUN4cuGq2ZU5L
         u+Vrj4okWElhjOAitIAj5DSR7EZAu5B+Mc6GGHbXwBW7hM9xo8UdUXiIQdSw+TMFWENn
         oDINB8heVXgkEP4CzZT11VuL3AbPjOGLXmZxB7qqxJguB8klAm7o/omeM47zrH8MOyRs
         7IB2/mWFFEsQgIMe5W0dRQ5Aw7iYyMvDLh2CwSepcSCmiq6sGI+ePipq6zS87H8ONl7M
         +3HA==
In-Reply-To: <51FBD782.9070309@lumino.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Schnell <mschnell@lumino.de>
Cc: linux-embedded@vger.kernel.org

Il 02/08/2013 18:00, Michael Schnell ha scritto:
> On 08/02/2013 05:37 PM, Marco Stornelli wrote:
>>
>> I don't know your hw so my consideration are really general.
> The hardware is not decided yet (it will be some A9 thingy). So for me
> "really general" is just fine.
>
>> ISRs in rt kernel doesn't exist or at least the only work is to wake
>> up the kernel thread for the management.
> I see.
>
> But how to determine the max latency for this ?
>

Maybe on eLinux.org you can find some number.

Marco
