Received: from pv50p00im-ztbu10021601.me.com (pv50p00im-ztbu10021601.me.com [17.58.6.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FFF19DFB5
	for <linux-embedded@vger.kernel.org>; Wed, 23 Oct 2024 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729714485; cv=none; b=EreeDVkxo6tSVt2lmWJxKoVPkn0agmRWo7hSKqDflEtZf+9sDfIDV9ZGTVFsGRLjzl+VQHnZhZrelbg9b/mB0zBZVUZWPKrE0xno9Z83M9QuhnEijeYgk6X1vWqUi6/cORMx4mkHAYp1ImD8OiGfkjE2i93xr1g+I+oNlniaEe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729714485; c=relaxed/simple;
	bh=a1kmVIQrInZRs7Lr4iX3D0d+N6lcQI6lecp26zuZKh8=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To; b=gTQzujdi+mBevOHSjrnebOxsp0JRQG8Z9yStE7mYjOYJkr6n/bLiZ67JceZhEMr0DQhu2BRQA+x25ufjjzVbEpjbfWmO977J41+SbrMrOJii/QQwooh/M1TKLjBPnkB8ATtyUl9TKw0pc30zl0XdRDoY7/5tYeUCSBGa/LSxpbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=TzwtMn/U; arc=none smtp.client-ip=17.58.6.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="TzwtMn/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1729714483; bh=a1kmVIQrInZRs7Lr4iX3D0d+N6lcQI6lecp26zuZKh8=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
	b=TzwtMn/U/mHv4T+4DIA0YPycRCxS5IKbkAHynNNz4cbdxPmNbxHQFNkrJa4Zt/QX6
	 tvC5NEOE98xMceYGc/79MMvWK4oMrH/XzynfmzuikxXtU+UlPaZe1m96GEK3d6FZE8
	 zF1CKPr4me7oWFJg1FjEdzIjH4CvQNvfTHNj7TjW4tmw/E6L1hdzyQkJ3c5jw+jCq/
	 KDj8BvEDnGZidf+Rl92laRJWKjU5OYInc7HrWy2x2pBC3IOGc9b6vBDKlOeohACEr1
	 DWTErkYPUwxvh86gOFJhOpTkXj1WdtK+j/Gl36yuapUfmUcLp7NnfFPiDhe9UQDBJ6
	 4czyRFOEFoP2w==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztbu10021601.me.com (Postfix) with ESMTPSA id EB3BC8028A
	for <linux-embedded@vger.kernel.org>; Wed, 23 Oct 2024 20:14:41 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Stephen Aaskov <stephen.aaskov@me.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Wed, 23 Oct 2024 22:14:38 +0200
Subject: Join
Message-Id: <3738A922-5F5B-4554-B81A-9497F755AB9C@me.com>
To: linux-embedded@vger.kernel.org
X-Mailer: iPhone Mail (22A3370)
X-Proofpoint-GUID: lKwbKonmcmKqckDxvFBraTEKu49gBaxw
X-Proofpoint-ORIG-GUID: lKwbKonmcmKqckDxvFBraTEKu49gBaxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_16,2024-10-23_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=504 mlxscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410230129


Sendt fra min iPhone
