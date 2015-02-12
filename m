From: Tim Bird <tim.bird@sonymobile.com>
Subject: Re: embedding dtb file into kernel
Date: Thu, 12 Feb 2015 14:01:35 -0800
Message-ID: <54DD22BF.4040607@sonymobile.com>
References: <54DD0018.7010409@graphitesystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <54DD0018.7010409@graphitesystems.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: K Richard Pixley <rpixley@graphitesystems.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 02/12/2015 11:33 AM, K Richard Pixley wrote:
> I'm having trouble figuring out how to embed a dtb file into my kernel.  
> I'm thinking that there should be a standard, architecture independent 
> facility for this akin to initramfs, yes?
> 
> Could someone please either point me to the standard facility, relevant 
> doc, a currently building board that uses the standard facility, or 
> outline what needs to be done to do this with a new board?
> 
> If it matters, (I can't think why it would), I'm working with powerpc on 
> a 3.10 kernel.  But if there are better facilities in other versions I'd 
> appreciate hearing about that too.

The normal method is just to cat the two files together, like so:
 $ cat zImage <filename>.dtb > zImage_w_dtb

See https://community.freescale.com/thread/315543 for one example, on ARM.
I'm not sure what the status is for appended DTBs on powerpc, but it's
easy enough you can just try it and see what happens.
 -- Tim
