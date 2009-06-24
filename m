From: Michael Opdenacker <michael-lists@free-electrons.com>
Subject: Status of bzip2 and lzma kernel compression for ARM?
Date: Wed, 24 Jun 2009 22:22:23 +0200
Message-ID: <4A428AFF.20307@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=lists; h=Message-ID:Date:From:MIME-Version:
	To:CC:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	List-Help:List-Subscribe:Content-Type:Content-Transfer-Encoding:
	Sender; bh=yUlAlAEWvXccjYbY8xLewhLjZ44rSSvcB+up/sjjwyA=; b=IeYyt
	W6AUwBPz4C3pp1HZ32VqIPMTo2SMuHupPljjOmi/0n/5vQTt7Y12k8/5aTo/9jKX
	ENf0tBCYOEZ3VK26lNnXm0GyV13Jy5StTtQHuBsTKHjiKRFsdaNcXim+Dq2a5y44
	uWf9IMGa8JkOz/TBkMtBNT/7AvJYmxGiyZMrkA=
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.arm.linux.org.uk/lurker/list/linux-arm-kernel.html>
List-Post: <mailto:linux-arm-kernel@lists.arm.linux.org.uk>
List-Help: <mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=help>
List-Subscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.arm.linux.org.uk
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk
To: Alain Knaff <alain@knaff.lu>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded mailing list <linux-embedded@vger.kernel.org>

Hi Alain,

I would like to test bzip2 and lzma compression on ARM.

Would you mind telling me what the status of your patches on ARM is, now
that the x86  and architecture independent code has been merged? Have
you or has anyone already updated them for 2.6.30, or shall I update
them by myself?

Thank you in advance,

Cheers,

Michael.

-- 
Michael Opdenacker, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com


-------------------------------------------------------------------
List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php
