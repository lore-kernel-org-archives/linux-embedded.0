From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Tue, 06 Sep 2011 07:29:51 +0300
Message-ID: <1315283397.19067.37.camel@sauron>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	 <201108241823.20904.arnd@arndb.de> <1314256010.18988.18.camel@sauron>
	 <201108251712.40894.arnd@arndb.de> <1315280704.19067.14.camel@sauron>
	 <1315282208.19067.24.camel@sauron>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:reply-to:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:message-id
         :mime-version;
        bh=9U7y+eSPxRaPKiRA0dv39kDE9XpIAjwiblCSMGD8aVg=;
        b=kxLWmYb8h9oe3qimeOj7SBZjAwSLucbaZ0NManSH3tpvXvG+oiom+/+F0Qi8NmsZDu
         H3/Z1Odaq9FXuD/9nWF7KtE3AvLCAe9GYKQgRcTTyDsuXetDJFjIHko0TRGyWFGQq4He
         wpEcvFZi3ja3MflvCBtA+VTjlbdNUSHZCPa9o=
In-Reply-To: <1315282208.19067.24.camel@sauron>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: david.wagner@free-electrons.com, linux-mtd <linux-mtd@lists.infradead.org>, linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>

On Tue, 2011-09-06 at 07:10 +0300, Artem Bityutskiy wrote:
> On Tue, 2011-09-06 at 06:44 +0300, Artem Bityutskiy wrote:
> > > It's not a dummy bus, in this approach it would be a the bus that gets
> > > used by all ubiblk devices, which is a very common concept by itself.
> > > It's more like the classic understanding of a 'device class' that Greg
> > > wants to see get replaced by bus_types in the kernel.
> > 
> > Yes, this sounds OK. Although UBI already has notifiers, so we could
> > just add 2 more events.
> 
> Hmm, with notifications the error handling becomes a problem - we want
> the ioctls for creating/removing the block device to be synchronous,
> and, should an error occur, we want to return the error code to the
> user-space. So the existing notifications mechanism does not work well.

... but we can change it a little and have error codes handling, this is
just UB implementation issues.

-- 
Best Regards,
Artem Bityutskiy
