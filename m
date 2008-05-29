From: vb <vb-gSajP0OrAZc@public.gmane.org>
Subject: Re: problems bringing up CF based file system (2.6.25)
Date: Wed, 28 May 2008 21:55:47 -0700
Message-ID: <f608b67d0805282155w5a34a6d1uf4959ac2c6172e9@mail.gmail.com>
References: <f608b67d0805221022n18199654n457c47459375213c@mail.gmail.com>
	 <f608b67d0805271547t4469fe39xab541cdbd995dc65@mail.gmail.com>
	 <20080527230457.GH11310@cs181133002.pp.htv.fi>
	 <200805282217.49143.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        bh=uhCmtE9Zn3VRbbN9EK8N9zHB/sSnI7a3Uoo3okH54Uk=;
        b=go6XCYS8W0qfy8IfOdo3LJyPeMi6YDGXJdwLymFbS+/oWowzH7lYgrjVnU0PFfOFUyrjo9k9VVDop/cIq01HqIXgAaH02CLQGv2JNOWd8rbHixxpvYddxT27mbhroODCWiu7VNVtjODuXbucvdT0BkERiIMkHcUdfu1uNH0HJTw=
In-Reply-To: <200805282217.49143.rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org

On Wed, May 28, 2008 at 8:17 PM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> wrote:

>
> Is it even possible to use just _parts_ of the SCSI layer, without sucking in
> the whole thing?
>
> I think the fact it's called a "layer" is a bit of a hint, actually.  Don't
> embedded folks generally try to _avoid_ unnecessary layering, and pulling in
> large code libraries to perform a small task?
>


Good questions, it does seem quite excessive. Interestingly enough,
there is a platform option for the IDE driver as well
(CONFIG_BLK_DEV_PLATFORM): could it be the a better way to drive the
CF card in true IDE mode?

I must be missing something very basic, but can't get over this hurdle:

if I enable PATA platofrm, and define the card local bus/card in the
dts file, the card gets detected and properly recognized, but no
device seems to be created in /dev, so the card does not get mounted
when the board comes up.


If I enable CONFIG_BLK_DEV_PLATFORM instead (and no dts file
definitions), I can't get the probe function to be invoked, so the
card does not even get detected.

People, does anyone have CF card up and running in 2.6.25 - please,
share your secrets! :-)

Seriously, it is quite frustrating, I would really appreciate any extra hints,

TIA,
vadim

> Rob
> --
> "One of my most productive days was throwing away 1000 lines of code."
>  - Ken Thompson.
>
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
