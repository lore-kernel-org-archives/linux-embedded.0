Received: from pv50p00im-ztdg10011301.me.com (pv50p00im-ztdg10011301.me.com [17.58.6.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD414375D
	for <linux-embedded@vger.kernel.org>; Wed, 23 Oct 2024 04:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658769; cv=none; b=usOpml6JKrskzxS3LELG3PKWmKQN9P1bGWTM4dRDNr5QccKc16UY7x+N70hbpaxy2mFKMC3zx2v3TPt4wLVPEZvXymp3kSsgmWBU6gPmrD5YO6rBI+pDslkAnIy7crrU8YkLImvtlYstIMzrH3sTRewFLtS7Cl2o4J43dSfO4X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658769; c=relaxed/simple;
	bh=4ht9G50SlYlr7BPTCuy+KjNotHQlLEXbSKghIYlF3TI=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To; b=NyC8st5ascROTz9PubKJDb9lwiQNRCNgQHZ2GK6eg33oDUtjAq9zlHaNPbie5UbjcHIg9oWYLKhjf68AAi4oDgWRo9PXjTuJ2s4rJgNiL1Cb+OSo/PRT4TdzYd+MVoy7U7Ve2EBVHCrhzJXx+Fs+xFP5Kwm15XtCuCmM9kgfXeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=qHoaQrpb; arc=none smtp.client-ip=17.58.6.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="qHoaQrpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1729658764;
	bh=4ht9G50SlYlr7BPTCuy+KjNotHQlLEXbSKghIYlF3TI=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
	b=qHoaQrpb/KUv7weV66HWDHyIqU8VE/Ksq4XwqQr98RyrMQ64OSbH5BWf5JHrI06aq
	 y0zIN00O+tPCrU8IjrBo0C/7mHcBdDaa8lILYuGM3jYlsRPNXz0gaTVpjHDXlZIdGk
	 TKz4vCkXfBaK+1be6ut0ZoU3X26b1OMTnebpKYFrAyCm8FHwiSlw+M0xVQVgHrJZhs
	 nggXFttIWRoEm2jQ88vgO3l7LPhR5ZRojG2Uy6l9v+gtZvPL0TmjDZ4j8ZNlqf7v49
	 HCMXiaDGCOK7GzsGLJefg63OOENO0OzYjr874nrtBN7NDTplxaVVRhrlK5Bddw2dE5
	 6C82LTwhVcZQA==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10011301.me.com (Postfix) with ESMTPSA id 4B0EC180252
	for <linux-embedded@vger.kernel.org>; Wed, 23 Oct 2024 04:46:02 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Srikanth Valla <srikanth.valla@icloud.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Wed, 23 Oct 2024 10:15:55 +0530
Subject: I would like to join 
Message-Id: <F48EBD09-2D24-4D75-AAA3-BFE99FC82B04@icloud.com>
To: linux-embedded@vger.kernel.org
X-Mailer: iPhone Mail (20C65)
X-Proofpoint-GUID: BvijPlXhswaOgP0vTnq6DltzveSJiI8n
X-Proofpoint-ORIG-GUID: BvijPlXhswaOgP0vTnq6DltzveSJiI8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_03,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=580 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410230025



Sent from my iPhone
