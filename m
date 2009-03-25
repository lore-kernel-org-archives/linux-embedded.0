From: Leon Woestenberg <leon.woestenberg@gmail.com>
Subject: Re: XZ (LZMA2) decoder
Date: Wed, 25 Mar 2009 22:39:06 +0100
Message-ID: <c384c5ea0903251439k2ba46bffq729c013a48e2d6b9@mail.gmail.com>
References: <200903221557.33588.lasse.collin@tukaani.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=jm8YElAQ/E+HXMfo+OWaM8zbZxzirZq/1xL/CtZP5RY=;
        b=AfONU1853B6v+XmOt9LdoThPPFPb7Gdfi3XhjuJg0Z/Mpb4yG3RcgtZg/aM1R9kB3h
         l3N+w5CucgXE/ZOE4CTCol7vNBpKyqgztaOW2b+RwyD1LXj8656W7IHGLIXM9OVeRo4T
         7xwBqpZLF9+oFIt71nghQVK4JwpB/X2+BOmhc=
In-Reply-To: <200903221557.33588.lasse.collin@tukaani.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: linux-embedded@vger.kernel.org

Hello Lasse,

On Sun, Mar 22, 2009 at 2:57 PM, Lasse Collin <lasse.collin@tukaani.org> wrote:
> (Please CC your replies to me, I'm not on the list.)
>
> An initial version of the .xz file format decoder for Linux is now
> available at <git://ctrl.tukaani.org/xz-embedded.git>. It supports both
> stateful and single-call decoding using the LZMA2 algorithm.
>
Is this something the linux-embedded community must pick up, or maybe
even the LKML?

Regards,
-- 
Leon
