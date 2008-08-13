From: Josh Boyer <jwboyer@gmail.com>
Subject: kernel dump solutions
Date: Wed, 13 Aug 2008 15:48:23 -0400
Message-ID: <1218656903.10489.50.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:content-type
         :date:message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=iCoPO0gOlUZLjx0DxsCg08qANG1XcnbhiADuEaNrg3g=;
        b=UW3MR+4iBlFnzaqnqYKLvMk0tAuZDXpB6dhY+yHNG95k1WImFsa05Yuk9xw2gnDuYy
         2QE4LZMhOLyhUUXRtB9jrm91g6OjlspAZkVqhAebLVjmQ8GTWQ6NG/0mspzlLrDYqeW2
         6xt+v00M/G6KNIiF4UMSrIHTixx+SPzezgtm4=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi All,

I'm curious what people are using for a kernel dump solution on embedded
platforms.  It seems that kexec/kdump is the default solution for
desktop and server machines, but this seems to be a bit heavy for
embedded platforms.  Requiring a second kernel to do the dump seems like
a cost that most platform designers wouldn't be willing to incur.

The only other alternative that I'm aware of is LKCD.  It doesn't seem
particularly active at all these days.  Mcore has been sufficiently dead
for years.  So what's left?  What else are people using?

josh
