Received: from mout1.freenet.de (mout1.freenet.de [195.4.92.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5D82500AA
	for <linux-embedded@vger.kernel.org>; Sun, 24 Nov 2024 21:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.4.92.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732483653; cv=none; b=rbzgm9VALJAPd6lXNMYnjiQDltrCCDKqmji9KGbgDFG2q3ug6MsY1PRK16iFdaIdPok0uUEhLNjeZOcvV2af/31QfQ8fGoAswcA97nYomEFB/xzk+0mEk/1Mhm08Q143+pylaBjF9M+otCnADPYOHd6Ki2ACG867fTXy2+G7jYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732483653; c=relaxed/simple;
	bh=T+XrZTB2VgRHbsXYsxPrzsFkmvVzeCNaDKNUdDTDwbs=;
	h=Message-ID:Date:MIME-Version:References:To:From:In-Reply-To:
	 Content-Type; b=lnJk4MF0WeshwgRMwQSYrz+lJ2dHzj1utA144nAc81xNEW00Jf8VI6BedPz4Iodpu41D1z0umjilKZR1OeVT5/2SLKXmNlDM4ENTtwUptwVqFGRuH8Y1CFoJ1Ol8AIHLfX+CHNtrSw5UZ3rm3pSuJqtJx4wB1KKZh/kOQhc/DIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; arc=none smtp.client-ip=195.4.92.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Received: from [195.4.92.125] (helo=sub6.freenet.de)
	by mout1.freenet.de with esmtpa (ID MarkoHoyer@freenet.de) (port 25) (Exim 4.94.2 #2)
	id 1tFK8d-00GvTQ-BF
	for linux-embedded@vger.kernel.org; Sun, 24 Nov 2024 22:27:27 +0100
Received: from [2a02:8071:7010:720:288c:29b0:c26c:2c6b] (port=37492)
	by sub6.freenet.de with esmtpsa (ID MarkoHoyer@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 587) (Exim 4.94.2 #2)
	id 1tFK8d-004W2c-1q
	for linux-embedded@vger.kernel.org; Sun, 24 Nov 2024 22:27:27 +0100
Message-ID: <69dec8ad-834a-4019-ac1a-0a680d3754c9@freenet.de>
Date: Sun, 24 Nov 2024 22:27:26 +0100
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
References: <99a4b033-4459-467b-9ccd-12c6188e7977@freenet.de>
To: linux-embedded@vger.kernel.org
From: Marko Hoyer <mhoyer.oss-devel@freenet.de>
In-Reply-To: <99a4b033-4459-467b-9ccd-12c6188e7977@freenet.de>
X-Forwarded-Message-Id: <99a4b033-4459-467b-9ccd-12c6188e7977@freenet.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-FN-MUUID: 17324836476913E4F04BFAO
X-Originated-At: 2a02:8071:7010:720:288c:29b0:c26c:2c6b!37492
X-Scan-TS: Sun, 24 Nov 2024 22:27:27 +0100

|subscribe linux-embedded|
