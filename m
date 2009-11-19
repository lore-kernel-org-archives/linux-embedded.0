From: Johnny Hung <johnny.hacking@gmail.com>
Subject: How to move two valuables to x86 CPU register ebx, ecx by using AT&A 
	inline asm.
Date: Thu, 19 Nov 2009 17:50:30 +0800
Message-ID: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755069AbZKSJu0@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=BOUqc74y2BA5jQ3otx2E2qpolGIL1pD6wbskVEFT/ck=;
        b=nWw/DAOGO6LwMsXFg3rL9AoOhCZfXLUPq+p0t6WDS5xeYL862BwT/QN3L8zbOWY+kl
         9OUyjTBILz9hwBn95qMlku7A4JVtTt4J4ZgpQpSnpK5FBxVrTSUcJZmrrXCh0o42LJq/
         mFYkGhDe3uFT4wfFxjdU4EmhZoNneg/QccHZk=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Hi All:
    I want to move two local valuables to x86 arch CPU ebx, ecx
register and do outb cpu instruction by using AT&A inline asm in
kernel driver.  The following code was I wrote but gcc report syntax
error:
==
    unsigned int val = 10;
    unsigned int tmp = 5;
    ....
    __asm__ volatile ("movl %0, %%ebx"
          "movl %1, %%ecx"
          "outb $0x27, $0xb2"
          :
          :"r"(val), "r"(tmp)
          :"%ebx", "%ecx"
   );

Does anyone can point me out. Any reply is appreciated.

BRs, H. Johnny
