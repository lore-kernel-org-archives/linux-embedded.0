From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: building Rootfs
Date: Wed, 09 Jul 2008 09:22:54 +0200
Message-ID: <877ibv5xo1.fsf@macbook.be.48ers.dk>
References: <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com>
	<20080708140034.B2B7424681@gemini.denx.de>
	<63386a3d0807081653t5e19cae2vd35c03de4bec7fa8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:to:cc:subject
         :references:from:date:in-reply-to:message-id:user-agent:mime-version
         :content-type:sender;
        bh=7EoXIH5/C//M/UReoZl8hFOLjYEydLJfw+XXDKK/OGw=;
        b=cDhMu1f+/EU7sHO3xz1o8PZhEoOTJAf4ur+HBio3mhannvDTT3YaauJpJT9uRKjroz
         A1EX1YlP0ZnpsWXTi8PZicn2yOYUw7x5jcQVBoucGlwwBNxNtcaaNbkZKVq9b5wl7nU6
         kUC3WEnkTfaMgo4aK4NIVVxqdZjstey9951eI=
In-Reply-To: <63386a3d0807081653t5e19cae2vd35c03de4bec7fa8@mail.gmail.com> (Linus Walleij's message of "Wed\, 9 Jul 2008 01\:53\:46 +0200")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: linux-embedded@vger.kernel.org

>>>>> "Linus" == Linus Walleij <linus.ml.walleij@gmail.com> writes:

 Linus> If you know some way of sneaking a device node into a
 Linus> .tar file created ENTIRELY running as a regular user,
 Linus> tell me!

You just mentioned it yourself - fakeroot.

-- 
Bye, Peter Korsgaard
