From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Mon, 21 Dec 2009 22:38:31 +0000
Message-ID: <4B2FF8E7.505@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com> <20091221193038.38CB63F6EF@gemini.denx.de> <4B2FD7DB.10008@warmcat.com> <20091221213829.1A8B93F6EF@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=NqzeBDAWnZOFJK+++/ci+UVuHj/e9YwJP2DSjJCWI8o=;
        b=j2pFPzhjHKje2oV2Ei5dC0SkSXes8AijhD79aj2GSDRPnzi9iUWXqshmFKr8n18f1k
         jhe3Vdvxi9wjo5oEKxAhCmQUKmaL3PmXwmlKxHNaMrP0gLVFgu4aMFMJCCE8CNEt5en5
         J9Yah/0dAiGYVDhnRMWlRkLyRde1xN2vBqA/g=
In-Reply-To: <20091221213829.1A8B93F6EF@gemini.denx.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Wolfgang Denk <wd@denx.de>
Cc: Matt Hsu <matt@0xlab.org>, linux-embedded@vger.kernel.org, celinux-dev@tree.celinuxforum.org

On 12/21/09 21:38, Somebody in the thread at some point said:

Hi -

>> I was talking about GTA02 specifically here, it was (and still is AFAIK)
>> only updateable by DFU for the bootloader.  We had kernels with soft ECC
>> that differed from the ECC / bad block marking generated and used by the
>> s3c2442 NAND hardware unit.  If U-Boot wrote it, it could at least read
>> it again.  So DFU was / is the only official way to update GTA02 bootloader.
>
> This only means that the ports of U-Boot and Linux to that hardware
> were inconsistent, which means that at least one of them can be

Actually the problem of synchronizing the ECC and BBT rules between 
bootloader and Linux is a generic one where raw NAND is involved.  Soft 
ECC and Hard ECC on a particular chip may differ and the kernel decides 
what policy it has there.  It's a "raw NAND" issue not a U-Boot one but 
if anyone shipped a kernel one way and wanted to change it, they have to 
take care about matching the bootloader's view of the NAND in great 
detail if they want interoperation between Linux and the bootloader.

> considered broken. [And I'm tempted to add that this might eventually
> be a consequence of the fact that all this work was done without ever
> getting in touch with the U-Boot community. Likewise, no code or
> fixes have been contributed back into mainline.]

Well, this is getting a bit off-topic for considering the merits of Qi.

Openmoko started to use U-Boot on GTA01 long before my time, likewise 
the soft ECC was "like that when I got there".

About tapping into the wisdom of the U-Boot community, most of their 
changes were GTAxx-specific.  For example I don't know any other Linux 
device than GTA02 with a Glamo in it, there is a lot of code I ported 
from Linux for that bloating their tree.  With closed docs, that would 
be completely useless for upstream.

Bearing in mind they could only update by DFU and with GTA01, there was 
no bootloader recovery mechanism if it failed, keeping their bootloader 
tree inhouse was an established tradition by the time I got there.

For all those reasons the best way we found was deprecate their U-Boot 
tree and learn from what we had found there.  (A fair amount of Qi is 
cut out of U-Boot so I see the great work it has done as well as the 
problems: respect for your work.)

> I think it's unfair to blame U-Boot for a poor on incorrect
> implementation of the NAND driver on this specific hardware.

Yeah it would be unfair to solely blame U-Boot for the sins of GTA02. 
But it's fair to blame U-Boot with the sins of U-Boot.

The main lessons I took from that was the dollar and time value of 
removing the "unnecessary features" in U-Boot and especially the 
Openmoko tree of it:

  - video drivers

  - shells

  - environments

  - special update mechanisms

  - raw NAND at all

  - duplicating the OS in there

  - private nonvolatile state

  - PMU management when we are already able to run

  - per board variant bootloader image (ie, GTA02 v3 can only run a 
special GTA02 v3 binary of U-Boot that can't run on anything else; Qi 
has a per CPU binary that supports all variants)

After understanding that all those are needless and actively wasteful in 
developer resource, support, and device time the reasoning led to the 
development of Qi in its current form.

-Andy
