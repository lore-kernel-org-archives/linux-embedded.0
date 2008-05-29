From: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Subject: Re: Some embedded topics
Date: Thu, 29 May 2008 07:38:01 +0200
Message-ID: <20080529053801.E633C247CC@gemini.denx.de>
References: <8bd0f97a0805282121j10a99bb7ve92efc6a8dc8bbb1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: Your message of "Thu, 29 May 2008 00:21:52 EDT."
             <8bd0f97a0805282121j10a99bb7ve92efc6a8dc8bbb1-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-embedded-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, T Ziomek <ctz001-qbu1+ugcRq/by3iVrkZq2A@public.gmane.org>, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

In message <8bd0f97a0805282121j10a99bb7ve92efc6a8dc8bbb1-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> you wrote:
>
> how about the fact that when the core resets, the memory controller is
> often reset as well ?  that external memory is going to degrade.  or
> do we just bite our thumb and weather the few random bit errors ?

It depends. In all cases we tested  so  far  we  have  never  seen  a
corrupton because the hardware and U-Boot were quick enough to get at
least refresh running again in time.

If you are really concerned, there are other options. For example  on
systems  that  have  OCM or SRAM you can put the log buffer there. We
did this in a project on 440EPx.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org
To be awake is to be alive.        - Henry David Thoreau, in "Walden"
--
To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
