From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: Re: XZ (LZMA2) decoder
Date: Wed, 25 Mar 2009 22:41:40 +0100
Message-ID: <20090325214140.GE12190@mx.loc>
References: <200903221557.33588.lasse.collin@tukaani.org> <c384c5ea0903251439k2ba46bffq729c013a48e2d6b9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=+LFRlWgfEyQ+N229NBYbR73xJd6rX/T2sbR+VAUY+PE=;
        b=nvJiLFxrjWYVzsb2frGZH54mB5qlqlabmTIK5YsKftPVpbfgwi7qzgCEBeB1Xkw5OI
         5C3X6Z1ZeaZoELBlsD/3RObPvdZbe3HdZLn8gnf8AE6DsB6gZmGprudHhtVqmPtueGuQ
         t/taMR+DNPEBQVS5WadnOq9vK4kNk8VxDy91Y=
Content-Disposition: inline
In-Reply-To: <c384c5ea0903251439k2ba46bffq729c013a48e2d6b9@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Cc: Lasse Collin <lasse.collin@tukaani.org>, linux-embedded@vger.kernel.org

On Wed, Mar 25, 2009 at 10:39:06PM +0100, Leon Woestenberg wrote:
>Hello Lasse,
>
>On Sun, Mar 22, 2009 at 2:57 PM, Lasse Collin <lasse.collin@tukaani.org> wrote:
>> (Please CC your replies to me, I'm not on the list.)
>>
>> An initial version of the .xz file format decoder for Linux is now
>> available at <git://ctrl.tukaani.org/xz-embedded.git>. It supports both
>> stateful and single-call decoding using the LZMA2 algorithm.
>>
>Is this something the linux-embedded community must pick up, or maybe
>even the LKML?

This is certainly the way to go, yes.
