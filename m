From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Subject: Re: Can I run an application compiled with gcc ABI 2.95 on a kernel
	compiled with gcc ABI 3.4?
Date: Fri, 15 May 2009 11:03:59 -0300
Message-ID: <4A0D764F.80103@zacarias.com.ar>
References: <20090515115009.110740@gmx.net>	
	<1242390699.4201.3.camel@macbook.infradead.org>	
	<20090515135105.GC8235@shareable.org>
	<1242395765.4201.94.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=lists; h=Message-ID:Date:From:MIME-Version:
	To:CC:Subject:References:In-Reply-To:List-Id:List-Unsubscribe:
	List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	Content-Transfer-Encoding:Sender; bh=IAi8Qra0UZDbwsNvCFyGoR4+fso
	BP916/EXEuuwAiJ8=; b=SEaqykSdPBlIaMJhw2/36eWFEgrdux/EtiC72YxCJ/a
	3Lk7XuEGt7xfFhfMu8tn9xbXuvn+Kzhvw7DNMtOK503hayICOVfJ5r+ZHsd3TUQJ
	E9ev29DK44baHW9tvzQs3dINEvUCzSZmj2oSHGmS/lYbfWJh77tdbNa31zn9DTF0
	=
In-Reply-To: <1242395765.4201.94.camel@macbook.infradead.org>
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
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jamie Lokier <jamie@shareable.org>, muzungu@gmx.net, linux-embedded@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

David Woodhouse wrote:

> 
> It was just a note of caution that sometimes we _do_ change the ABI.
> 
> I'm not 100% sure offhand whether the EABI kernel can support OABI
> userspace; I didn't think so though.
> 

He could try CONFIG_OABI_COMPAT=y, at least in 2.6.28+.
No thumb though.
Regards.

-------------------------------------------------------------------
List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php
