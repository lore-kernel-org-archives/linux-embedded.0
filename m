From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Can I run an application compiled with gcc ABI 2.95 on a
	kernel compiled with gcc ABI 3.4?
Date: Fri, 15 May 2009 22:42:36 +0100
Message-ID: <20090515214236.GY650@n2100.arm.linux.org.uk>
References: <20090515115009.110740@gmx.net> <1242390699.4201.3.camel@macbook.infradead.org> <20090515135105.GC8235@shareable.org> <20090515135557.GC18976@trinity.fluff.org> <20090515143230.GE10977@mvista.com> <20090515145435.GF8235@shareable.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=caramon; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:In-Reply-To:
	Sender; bh=LOSSzqZ56lNxP3RfizZ19EyAoqiWW6tMVgU+uWg4FUM=; b=SjZRc
	sCcI6ypOXyCKiuyvBFKuGpaO1MSkOI3sRu1F94pAZZarH9di8SmtZQJp3dEoRWLC
	b56okBtAzcfq7taPR5qeLw5EmdxEEEPe9ESwltH0B272c9nu9dfBF5U07Bd1VyEi
	QDYa/xvShn6f67E8fJmTu6Qim8LSSX+f120vj0=
Content-Disposition: inline
In-Reply-To: <20090515145435.GF8235@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: "George G. Davis" <gdavis@mvista.com>, Ben Dooks <ben-linux@fluff.org>, David Woodhouse <dwmw2@infradead.org>, muzungu@gmx.net, linux-embedded@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

On Fri, May 15, 2009 at 03:54:35PM +0100, Jamie Lokier wrote:
> Register/parameter assignment: How is that relevant to the kernel
> interface, if the kernel itself and modules are all EABI?  The system
> call interface is a fixed set of registers.

No it is not.  The syscall interface obeys the ABI register allocation
rules as well, otherwise we have to have veneeer layers to reshuffle
the registers prior to calling C functions.
