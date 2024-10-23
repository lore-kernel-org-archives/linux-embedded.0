Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46A115B0EE
	for <linux-embedded@vger.kernel.org>; Wed, 23 Oct 2024 21:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729718590; cv=none; b=lQKSzZSuqqgGBSPX2jWa2aLLvSdoXeaRo8Gm4mGo3HpWyRP/q3SGsZPaeO9EhopjWfbfM5mcXWyfMctMb/ChoR3kQCoSmnNcPuv9qT6wZonI96BlJxOKLMlRp0KMHu+T7QRwmPTYp3OUZ/BVF7YC6wVQSQzH4tURzElWcC3waUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729718590; c=relaxed/simple;
	bh=iJFG9KN0AqEJ3CKfgQ0fVqZ3Qd938LEkVI6e9VABULs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ZFZVeas63lj+Nn0IUPBKa7thz51hNgebHDpW/JB2xag3qF5VVNiQvi0jmoFdoC2wUum5SGjMH3MbLDWNDmuKoVjy/9sZnwSRuNOiX73Oerm5gE/Gqs8yAVh+5JmySkryUUJ3Qhcgh16tDn/PQsoqaiZoHTYs3FW/CkLzR2pp1io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=kaIWdrCv; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="kaIWdrCv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TUNpeIwvGuvzGpwcdNCQRuyX5u9arXFkn1XvtkCDShM=; b=kaIWdrCvpE9MiqrF0gVqUsEy0S
	N8cm8ccOqkVO+8vXai1NNommsnnvuG2ocQL8HPW4q2EAd/O1LbucSPj1hy5R8SPM4ORpYtx2E0VZW
	Ll7y3Bw2U8nkk1MmAXZPIF0OOsawZ+nCN01CBM38ZObVuz2TH4B+gSOZWVSJw7wD2dlzv/LJ36HdI
	bZzQwb4DXhIz6QR57v//P7UHh83mVXxIhmDBoOHG/g2VcZYegTDbapjBMSKd9ZSFtVEEhu8KBmQPK
	RG/ZahncpMnRs+lhw+VUMf8Hm0AfAyMbVb0Vjyk1g/1I2R4z7Y2osGggBvn6AAyUJyYwEDAmvwinh
	f69UDCGQ==;
Received: from bagu-19-b2-v4wan-170080-cust3023.vm21.cable.virginm.net ([94.174.171.208] helo=[192.168.0.92])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1t3iRk-0047Qb-T8
	for <linux-embedded@vger.kernel.org> ; Wed, 23 Oct 2024 21:59:13 +0100
Message-ID: <0a0c0f73-34ea-457e-9261-fcb09ff83fed@codethink.co.uk>
Date: Wed, 23 Oct 2024 21:59:12 +0100
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-embedded@vger.kernel.org
Content-Language: en-GB
From: Weyman Lo <weyman.lo@codethink.co.uk>
Subject: Request to join the list
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: weyman.lo@codethink.co.uk


-- 
Weyman Lo
Codethink Ltd.
www.codethink.co.uk
https://www.linkedin.com/in/weymanlo/
mobile: +44 7810 530 880

