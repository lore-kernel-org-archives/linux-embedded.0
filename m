From: David VomLehn <dvomlehn@cisco.com>
Subject: Adding a new platform
Date: Tue, 19 Aug 2008 11:01:30 -0700
Message-ID: <48AB0A7A.8040209@cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=229; t=1219168934; x=1220032934;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Adding=20a=20new=20platform
	|Sender:=20;
	bh=+/G+TdHjDo5ABuM5uMPpbUommnjCBZTdgZXZMeuN3hY=;
	b=jvX9JBL5B4CyPNhwk34lBMJhmeSW3CzFiHCpzU5/LK2fsKL6naWZ/uzzsx
	kGeMv+TmqOztTOt4lhLSCLroBefiUYDeGmLTemdCldMbJj2WFUMpVo18cVR3
	tWt63FsmRS;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

I'm working to educate our management on the need to get our platform in the 
kernel mainline. I expect I will be asked to tell them how much work this is. 
What do we need to do to add a new MIPS platform?
--
David VomLehn
