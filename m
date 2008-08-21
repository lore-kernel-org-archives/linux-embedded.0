From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 08:32:08 +0200
Message-ID: <ac9c93b10808202332n2654884eh877848df2da59f20@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=8xpiuwbab4A1k8OJibpemPRWBqYQjsumUTSbhKzaIRI=;
        b=CyyyKsK2IQohZEgDjiIhLQAhZJdopGUZHtCufbjKBh38varTFgyXjZh5NfLBrAkp3p
         muA0bTwVtf4evInlm4I7So7eoePbOQeHjvRAM1ynM4P4OMG+5tKfAxnQ/L+xl8W1VQzY
         x54CUUNwpHgtDv6eXvy57dZrQ1rEElBgd4n3U=
In-Reply-To: <48AD00C4.6060302@gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

Jared, nice work!

I've also read your paper from the linux symposium
(http://ols.fedoraproject.org/OLS/Reprints-2008/hulbert-reprint.pdf)

A few questions:
- how does this benchmark compared to cramfs and squashfs in a NAND-only system
  (or is it just not a good plan to use this with NAND-only (of course
I won't get XIP with NAND, I understand that)
- would axfs be suitable as a filesystem on a ram disk?

Background for the last question is that if you do not have the memory
to retain all pages uncompressed (as you would with ramfs), this could
be a nice intermediate format.
Furthermore compared to ramfs, a filesystem on a ramdisk does not need
the initialisation during startup (decompressing the cpio file,
creating the files, copying the data), so when it comes to boot times
a filesystem on a ramdisk (e.g. axfs) could be a better choice.

Appreciate your feedback.

Frans.
