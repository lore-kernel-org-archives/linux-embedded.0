From: Matthias Kaehlcke <matthias@kaehlcke.net>
Subject: Re: Cross Compiler and loads of issues
Date: Thu, 12 Jun 2008 20:26:07 +0200
Message-ID: <20080612182607.GA3813@traven>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Received: from tern.riseup.net (unknown [10.0.1.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "*.riseup.net", Issuer "ipsCA CLASEA1 Certification Authority" (not verified))
	by mx1.riseup.net (Postfix) with ESMTP id D44C3570C5D;
	Thu, 12 Jun 2008 11:26:13 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaz <shazalive@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

El Thu, Jun 12, 2008 at 10:52:44PM +0500 Shaz ha dit:

> I have been following "Re: [PATCH 0/1] Embedded Maintainer(s)" and
> felt like asking that is there one good way to get a cross compiler
> work. I tried buildroot, scratchbox and even openMoko with
> openEmbedded but all of them had lots of issues and don't know which
> will be the best alternative.

crosstool-ng looks like a promising option:
http://ymorin.is-a-geek.org/dokuwiki/projects/crosstool
 
-- 
Matthias Kaehlcke
Embedded Linux Engineer
Barcelona

     Nationalism is an infantile disease. It is the measles of mankind
                         (Albert Einstein)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
