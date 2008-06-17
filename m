From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: Recommendation for activating a deferred module init in the
 kernel
Date: Tue, 17 Jun 2008 16:35:16 -0400
Message-ID: <20080617163516.2be96400@vader.jdub.homelinux.org>
References: <48580116.9070504@am.sony.com>
	<20080617190750.GA31224@logfs.org>
	<485815F6.20507@am.sony.com>
	<485816B3.3080800@am.sony.com>
	<20080617202318.GC31224@logfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:in-reply-to:references:x-mailer:mime-version
         :content-type:content-transfer-encoding;
        bh=I7D+Q2IGvyAELrK0KfbXqkfWXX0snSmLtUlOmPCT7bc=;
        b=W63wec7nI6cMWaMN+6kk4YHnWdA0J/dp8adDQZKQ8D975zo6bpQQa9xqrb/eWvB+XZ
         qltPbWEPmxSDE8KpKPPVu7rGgIt+seTbVyvHfffz8nIUnqxSLEXDHlqLgXQhRJf5g8kz
         I2lex6vtImO4P/6LJ3VUnZqrc6eb3KkW46vMI=
In-Reply-To: <20080617202318.GC31224@logfs.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?B?SvZybg==?= Engel <joern@logfs.org>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Tue, 17 Jun 2008 22:23:19 +0200
J=F6rn Engel <joern@logfs.org> wrote:

> On Tue, 17 June 2008 12:55:31 -0700, Tim Bird wrote:
> >=20
> > Sorry - I responded too quickly.  I'm not sure I follow the
> > original suggestion.  How would I call the open function of
> > a module that is not initialized yet?
>=20
> Hmm, good point.  I guess that suggestion has just failed the reality
> test.

Have a simple module that calls the initialization functions for
anything with a deferred init.  Then you can open that and use an ioctl
to...

I think if we try really really hard, we can make this a Rube-Goldberg
Machine!

josh
--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
