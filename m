Received: from pv50p00im-ztdg10021201.me.com (pv50p00im-ztdg10021201.me.com [17.58.6.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B617EAC5
	for <linux-embedded@vger.kernel.org>; Wed, 23 Oct 2024 06:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729664022; cv=none; b=mIW9ANuOKZShbu6x76l8dkkeY4Gb0fFvMHH8eUwkUa3alc7vIGnFpFDP5IqlIPs+4PT83R0jzMJ21uTcBTeEKYL1rWyKd8uJtsCpYtc5TgWfCfSxZ6nfD6r8HxlL90Kv2WIQROPz/QroB6re1R3VIY4+Wjrffa4/8xsCojn4RcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729664022; c=relaxed/simple;
	bh=oQVrm4JM1X0wDCMXvmOHv4D9tQl39pOLC72bTquZ9bE=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To; b=mCwYhMdFqvyDf40nMiN04AGGmvNbBvJuIWAyf67xy+wq+XWNrUVWYqEKwWSDkiKCSA75PJN9gcXntOGcnuISl8tPpjidZUFrYlZSNzk17FByEVnAbHruoORaqQoQ/ysc5ayhdRjgwbaS4XQBa6FEiAofOX4DbGZBEkOyL5CsxvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=lRYsurXF; arc=none smtp.client-ip=17.58.6.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="lRYsurXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1729664020;
	bh=oQVrm4JM1X0wDCMXvmOHv4D9tQl39pOLC72bTquZ9bE=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
	b=lRYsurXFuyXygOPM6OwxNXWfxQlrA1KWNCEzHE4LjBuXARK+CBVTdDY44mMXVMubV
	 8oPmWGNTXnuKie1VGQyRZAf+Pb/Hdf101zy5CPoz+MwQbiX9gVJ43C7lSaQAGuHSZR
	 738ZHt2P1J/wJg/Ogf29a8wla/6bGfefSb0mUmS49Y6+wgv/aJn92aIlqbCnglqgD1
	 Cd0a1+0t8kBUjvHeUB2/ZjR8M0oFw2jDF9i2VJE6NNbOD+qmSN8gy2uUQoL4eDdz7P
	 6qyQz0iRG1PKn4xMa19HVoUuNQcrszxWmfnYeo7B8RlN4cltPzj0uJ/5zB4Us7sNqR
	 6U/8g3l3j/pmA==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021201.me.com (Postfix) with ESMTPSA id 23F4E6800FA
	for <linux-embedded@vger.kernel.org>; Wed, 23 Oct 2024 06:13:38 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Muahmmad Salman <muahmmad.salman17@icloud.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Wed, 23 Oct 2024 14:13:35 +0800
Subject: Linux -Embedded
Message-Id: <6291D4CB-6A96-4ABF-98CB-9DA40B412157@icloud.com>
To: linux-embedded@vger.kernel.org
X-Mailer: iPhone Mail (22A3370)
X-Proofpoint-ORIG-GUID: YsCcbeptSTWGUGX7dq855jH8z1vuHCHt
X-Proofpoint-GUID: YsCcbeptSTWGUGX7dq855jH8z1vuHCHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_05,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=574
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1011 mlxscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410230036


Sent from my iPhone
