From: Viral Mehta <viral.mehta@einfochips.com>
Subject: Re: How to move two valuables to x86 CPU register ebx, ecx by using
 AT&A 	inline asm.
Date: Thu, 19 Nov 2009 15:35:51 +0530
Message-ID: <4B05187F.6030809@einfochips.com>
References: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755633AbZKSKHY@vger.kernel.org>
In-Reply-To: <cb9ecdfa0911190150w4edbacdfp24a7069c618193f4@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

How about putting \n at the end ?

Just try out,

__asm__ volatile ("movl %0, %%ebx\n"
          "movl %1, %%ecx\n"




Thanks,
Viral Mehta,
Embedded Software Engineer,
Tel. No. 91 79 26563705, Ext. 423
www.einfochips.com <http://www.einfochips.com>
Prepare and Prevent rather than Repair and Repent


Johnny Hung wrote:
> Hi All:
>     I want to move two local valuables to x86 arch CPU ebx, ecx
> register and do outb cpu instruction by using AT&A inline asm in
> kernel driver.  The following code was I wrote but gcc report syntax
> error:
> ==
>     unsigned int val = 10;
>     unsigned int tmp = 5;
>     ....
>     __asm__ volatile ("movl %0, %%ebx"
>           "movl %1, %%ecx"
>           "outb $0x27, $0xb2"
>           :
>           :"r"(val), "r"(tmp)
>           :"%ebx", "%ecx"
>    );
>
> Does anyone can point me out. Any reply is appreciated.
>
> BRs, H. Johnny
>
> --
> To unsubscribe from this list: send an email with
> "unsubscribe kernelnewbies" to ecartis@nl.linux.org
> Please read the FAQ at http://kernelnewbies.org/FAQ
>
>
>
> Email Scanned for Virus & Dangerous Content by : www.CleanMailGateway.com
>
>
>   
-- 
_____________________________________________________________________
Disclaimer: This e-mail message and all attachments transmitted with it
are intended solely for the use of the addressee and may contain legally
privileged and confidential information. If the reader of this message
is not the intended recipient, or an employee or agent responsible for
delivering this message to the intended recipient, you are hereby
notified that any dissemination, distribution, copying, or other use of
this message or its attachments is strictly prohibited. If you have
received this message in error, please notify the sender immediately by
replying to this message and please delete it from your computer. Any
views expressed in this message are those of the individual sender
unless otherwise stated.Company has taken enough precautions to prevent
the spread of viruses. However the company accepts no liability for any
damage caused by any virus transmitted by this email.
_____________________________________________________________________
 
