From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: [Ksummit-2009-discuss] Representing Embedded Architectures at
	the Kernel Summit
Date: Wed, 3 Jun 2009 09:18:42 -0400
Message-ID: <20090603131842.GT3095@hansolo.jdub.homelinux.org>
References: <1243956140.4229.25.camel@mulgrave.int.hansenpartnership.com> <1244034286.24482.84.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=pdzhQhm4MQDZvTaSCpxNL7dItQa0IP+/l/etUm9L3Ig=;
        b=nGw85A3Y3Uy1UYY0Bd5XcudhszWDGVBNpuUb8CLueIy3rF8NW4ma7RZwLGuCPSXjzC
         GbzPzdWWsDBruhpV/cDTcmEa+i0mgUlomioJBMyqMpfhi1fB2uODXdJlVV9uhApSeh6q
         Ub4T1zrIKynsLS1qWBo7Wl+AD8MBA/BrolglI=
Content-Disposition: inline
In-Reply-To: <1244034286.24482.84.camel@pc1117.cambridge.arm.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Jun 03, 2009 at 02:04:46PM +0100, Catalin Marinas wrote:
>      * Mixed endianness devices in the same system - this may only need
>        dedicated readl_be/writel_be etc. macros but it could also be
>        done by having bus-aware readl/writel-like macros

ioread/iowrite{8,16,32} and ioread/iowrite{8,16,32}_be don't suffice here?

josh
