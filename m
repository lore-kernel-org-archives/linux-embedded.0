From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Representing Embedded Architectures at the Kernel Summit
Date: Sat, 13 Jun 2009 21:48:39 -0600
Message-ID: <fa686aa40906132048t52aae093m1c67a9982c218531@mail.gmail.com>
References: <1243956140.4229.25.camel@mulgrave.int.hansenpartnership.com> 
	<20090602172941.GL3095@hansolo.jdub.homelinux.org> <20090602222132.GK6399@game.jcrosoft.org> 
	<1B5FD82F-79A5-4FD1-BA99-59F3041B0470@kernel.crashing.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1B5FD82F-79A5-4FD1-BA99-59F3041B0470@kernel.crashing.org>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kumar Gala <galak@kernel.crashing.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit-2009-discuss@lists.linux-foundation.org, linux-arch@vger.kernel.org, linux-embedded@vger.kernel.org

On Wed, Jun 10, 2009 at 5:13 PM, Kumar Gala<galak@kernel.crashing.org> wrote:
>
> On Jun 2, 2009, at 5:21 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>
>> I'd like to propose AMP and kernel relocate
>> as more and SoC will came with multiple core with or without the same arch
>
> I think AMP or at least the idea of the kernel communicating with other OSes
> on the same SoC in multi-core systems is interesting.

Indeed, and not just for SoCs.  I'm currently looking at Ira's
adaptation of virtio to use it for IPC between two separate CPUs
running separate Linux instances and connected via PCI.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
