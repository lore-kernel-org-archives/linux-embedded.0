From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: Can I manage/modify console baud rates from userspace?
Date: Mon, 3 May 2010 20:17:29 +0100
Message-ID: <20100503201729.1ffff2d5@lxorguk.ukuu.org.uk>
References: <1272758524.27961.1114.camel@homebase>
	<4BDD4CC7.3050507@gmail.com>
	<1272816895.27961.1131.camel@homebase>
	<20100502202534.GA29535@merkur.ravnborg.org>
	<1272907707.31303.23.camel@psmith-ubeta.netezza.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1272907707.31303.23.camel@psmith-ubeta.netezza.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: paul@mad-scientist.net
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-embedded@vger.kernel.org

> Is there some other way to modify the baud rate of the console device
> from userspace once I figure out the right one?  It would definitely be
> less than ideal since we'd lose all the boot output, except what we can
> get from dmesg _if_ the system boots, but it would be something.

stty 57600 < /dev/ttyS1

etc. The console baud rate and settings should behave exactly as any
other serial port if set from user space.

> Any other thoughts or ideas?

If you don't mind doing some small private kernel tweaks then I guess you
could set the default console baud rate based on the dmi strings which
would hopefully differ between the blade types.

Alan
