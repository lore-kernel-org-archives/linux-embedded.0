From: Phillip Lougher <phillip.lougher@gmail.com>
Subject: Re: [PATCH V2 6/8] lzma: Make lzma available to non initramfs/initrd 
	code
Date: Thu, 7 Jan 2010 00:37:15 +0000
Message-ID: <bffbecbb1001061637i31260775ja14523458cc1ed51@mail.gmail.com>
References: <E1NIuOW-0001ol-RC@dylan.lougher.demon.co.uk>
	 <20100106140409.ba0f63d1.akpm@linux-foundation.org>
	 <4B4528C8.3020603@lougher.demon.co.uk>
	 <20100106163113.637e47db.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=I6n8CXjTt7w5EqsqqfpjOp5PwVct09qdO2cL3gz7p1c=;
        b=YhfKWltO3Jw4RZzKMUwTzi5jsB1I003tEYgd/r1xatHniG9W0qVJC8cP8bei2NgJUC
         fsAQgr86b4IKu4g6VXMMz747AajEU9s3rvTOJ3JhqKjStMKb1+AeU3+UC0IdMyVzO7mR
         LtdGT1ccKGQxtpaqvpfILhAfvAuaVIhBO2ed8=
In-Reply-To: <20100106163113.637e47db.akpm@linux-foundation.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com, Stephen Rothwell <sfr@canb.auug.org.au>, Albin Tonnerre <albin.tonnerre@free-electrons.com>

On Thu, Jan 7, 2010 at 12:31 AM, Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> Your email client is doing space-stuffing.
>

Sorry, I was worried it might do that - the curse of Thunderbird.  I
normally use a
really dumb client like mailx to send patches, but I obviously didn't have the
email thread under mailx to do that.

If you want, I can resend the patch using my favourite dumb client.

Phillip
