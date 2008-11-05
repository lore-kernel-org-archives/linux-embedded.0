From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH] phylib: make mdio-gpio work without OF (v2)
Date: Tue, 4 Nov 2008 19:09:05 -0500
Message-ID: <8bd0f97a0811041609l3bd474afh7e526be368d4c5cf@mail.gmail.com>
References: <20081104144518.4429.37325.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
	 <fa686aa40811040824x52dab7fel9f76567cb6d49c8@mail.gmail.com>
	 <200811041604.22947.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=f4QnUmA6AUE6nHb8kR1RcAxjTP1dZJuXAyavC5av4Kc=;
        b=vNIyRc6LEYT4DQTacwohS9HNTBngoVGJYOLLOjo2M85SrDY63LdHen+au4AFFlN9qj
         UMQdwDxlgVUkDNhgYl6pE2WTz5HiGn3N2Di6lJrJBHs3BMK1kEtGmcj/Q3C0iSFFuIcH
         TtQFiUe73++XiFRR2KHEvKxZQNbRQoMXcnRBA=
In-Reply-To: <200811041604.22947.david-b@pacbell.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Brownell <david-b@pacbell.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, Paulius Zaleckas <paulius.zaleckas@teltonika.lt>, netdev@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org, Laurent Pinchart <laurentp@cse-semaphore.com>

On Tue, Nov 4, 2008 at 19:04, David Brownell wrote:
> On Tuesday 04 November 2008, Grant Likely wrote:
>> At this point, instead of #ifdeffing the function signature, I would
>> much rather see this generalized as something like
>> 'mdio_gpio_setup()'.  Then move the OF and non-OF specific bits into
>> two new functions; mdio_ofgpio_probe() and mdio_gpio_probe().  The two
>> new functions should be placed with the appropriate bus binding in the
>> #ifdef/#else block at the bottom of the file.
>
> Or if possible something that creates a single #ifdef that
> ensures dead code elimination will remove the "other" branch,
> but ensures all platforms will build both versions:
>
>    #ifdef OF
>    #define using_of    true
>    #else
>    #define using_of    false
>    #endif
>
>    ...
>
>    static int __init mdio_gpio_init(void)
>    {
>        if (using_of)
>                return register mdio_ofgpio driver;
>        else
>                return register mdio_gpio driver;
>    }
>    subsys_initcall(mdio_gpio_init);
>
>    ...
>
> That's generally the preferred way to handle #ifdeffery.
> But I could imagine OF isn't (yet?) set up to handle it.

i agree completely with the inclination to do it all in C as you've
suggested and let the compiler do dead code elimination, but that only
works if the functions in question are defined everywhere (in other
words, there's a linux/ api for it).  i dont think that's the case for
OF (which is what you were implying?) ...
-mike
