From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk output for crash logging
Date: Fri, 8 Aug 2008 14:09:04 -0400
Message-ID: <8bd0f97a0808081109q693f6f1at650a9be0547b7f9b@mail.gmail.com>
References: <489BAD5C.2080009@cisco.com>
	 <1218210904.19162.144.camel@localhost.localdomain>
	 <8bd0f97a0808080905u1b515556gd68c2ba1d0b47cb4@mail.gmail.com>
	 <1218212266.19162.149.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=uIp0K5YnETtgU92htp+ITYe8MwFLtPr1hhCE8U11DQY=;
        b=aL3I70aLLrrsWZjUba3/iOCENwu7QRHHp+9lpVHOZuWdq8T3cgMMEjnmDu1iFkFZl3
         /gwEyXijJIBDqT/wFwX/9noK6cKzOvig1xX1PJHXE/E2HFU4Rjj+UutpeJsTj0EUycj4
         KDbwyj6wUFNDfM0YD6ffKQJHDC4AuYTVe/jpI=
In-Reply-To: <1218212266.19162.149.camel@localhost.localdomain>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Walker <dwalker@mvista.com>
Cc: dvomlehn@cisco.com, linux-embedded@vger.kernel.org

On Fri, Aug 8, 2008 at 12:17 PM, Daniel Walker wrote:
> On Fri, 2008-08-08 at 12:05 -0400, Mike Frysinger wrote:
>> On Fri, Aug 8, 2008 at 11:55 AM, Daniel Walker wrote:
>> > Another note, usually when submitting new interfaces like this you
>> > should also submit the code that uses the interface .. In your case you
>> > might not be able to do that, but it could never be accepted without at
>> > least one user.
>>
>> i really doubt that.  lack of existing tangible users makes it a
>> harder case, but it certainly is not a "never" case.  there is plenty
>> of examples in the tree where things were merged without any users and
>> the commit wouldnt be immediately leveraged.
>
> Well, I did say "usually" ..

you said "usually people submit new interfaces", not "it is usually
not accepted without at least one user".

> I invite you to give some of the "plenty of
> examples in the tree", you might surprise me..

look at all the new syscalls added without any userspace code in place
(still) to use it.  or Linus' recent printk modifier extension.  or my
printk extensions for extracting portions of the kernel log buffer.
people usually submit interfaces with backend extesions, or the intent
to use it is obvious.
-mike
