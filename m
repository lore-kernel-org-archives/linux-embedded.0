From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH 0/9] Squashfs: Add support for LZMA compressed filesystems
Date: Mon, 07 Dec 2009 09:47:17 +0100
Message-ID: <87tyw3p3vu.fsf@macbook.be.48ers.dk>
References: <E1NHYun-000287-Vq@dylan.lougher.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:from:to:cc
         :subject:references:date:in-reply-to:message-id:user-agent
         :mime-version:content-type;
        bh=fu4IGlBjHxSXEXtdWtipx2dmwcvra9Wp9imOn70Etb8=;
        b=xj/OqDjQawaaAXaefoefUkdMW/zFAYoOUzSOPgg3re+1W7JU/cAzqne6clImS1Lata
         U+KzwgcqGtxwiMpL6C9u0yAKh+rPV2rid2a5WwBfahwgP1/5sK8jw87rQuyeBpsT9dUL
         yfmyAxPgXAvCCd+3g9Vqxn9b3659akeVeLAVI=
In-Reply-To: <E1NHYun-000287-Vq@dylan.lougher.demon.co.uk>
	(root@lougher.demon.co.uk's message of "Mon, 07 Dec 2009 08:25:53
	+0000")
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: phillip@lougher.demon.co.uk
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com

>>>>> "root" == root  <root@lougher.demon.co.uk> writes:

 root> Hi,
 root> The following patches add LZMA decompression support to Squashfs, using the
 root> in-kernel LZMA decompression library.

 root> The patches also add a decompression framework to Squashfs.
 root> This allows LZMA decompression to be added cleanly, and it allows
 root> additional decompressors to be easily added in the future.

 root> To enable the in-kernel LZMA decompression code to be used by Squashfs,
 root> there are two patches to the lzma code itself: one to make lzma available
 root> to non-init code, and one to make lzma reentrant.  These are obviously
 root> not restricted to Squashfs, but are needed by any non-init code that
 root> may wish to use lzma compression.

Nice, do you also have an mksquashfs with lzma support?

-- 
Bye, Peter Korsgaard
