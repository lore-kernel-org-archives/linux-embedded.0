Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAA01891B2
	for <linux-embedded@vger.kernel.org>; Sat, 12 Oct 2024 21:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728770323; cv=none; b=PpKRpfiDgrxRWfRwxniqhRNe7Pw7c0rXuRpt9wwBmt6Voj17yPIirlPnwXdOoCppKypOTtuOcS9UJQIck3a0sEBxTCJNgcKR2cF1LzQ9duaXAIQmZpxNNqRabJQ2ekiUB4BJtd4wHNHojiNUVxnTxvg9t2u3WufqNR/7GadVBnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728770323; c=relaxed/simple;
	bh=4p9zMCHyTvIHqWb+RiLLmYJIcUZSBcLyXxn110UCViQ=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=ume9GHeymRJKl+CVGYsd10nskNsHDSA2Zvd9eshXopyXmhuaxhIzCfTwnW216TumYQsjeix01Hhm/AznilZlUfbCuNFhzENEEnwNiPTcxw6LY6Iy5zMpYKEPNd6n+are7zdGsaPeymXSli4FgPipWgyzlahbjV/muPNFR0+yjPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQnKzTKK; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQnKzTKK"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2e2fb304e7dso1467558a91.1
        for <linux-embedded@vger.kernel.org>; Sat, 12 Oct 2024 14:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728770320; x=1729375120; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4p9zMCHyTvIHqWb+RiLLmYJIcUZSBcLyXxn110UCViQ=;
        b=NQnKzTKKXxHzzg9s6J8GjSUZyuB1ncp7Ez3oIdeowXLhgA2XYYU2SeFA60oHEvEQ8G
         GyQ43xGkqwMPUo7qscfT+WUcrV5udT38Ks4vQTpjB9TiLsjOa/NoPMe94IGXc9KMqpUW
         MnIyb13aYTW8D5OQ1IAxqR4tTP5yMZyysbsPoFk1PUh5Dhv1GGghK0IPTdjQhedLt9yA
         9vgnInIPkwDej5FlIEYRKQHJZzaAY3xqKZEAqoSS0JGSatm64fRed//fZaYdH8iRNWu8
         kM3OUG0nilVjSRfBF6bDmcJPMRfB6e1f/whhRie2To4T7oU1TiOYP7wZ67InSqSfNJhV
         Yt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728770320; x=1729375120;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4p9zMCHyTvIHqWb+RiLLmYJIcUZSBcLyXxn110UCViQ=;
        b=PoT2lQVzRsmEXy0C/PbX3vtKT1chTeyyJZdR0mR/SplCY1FwCddOkiNHvUjsN5EKlB
         ZhgQEsKUocpnf9TUixueJc6eW+E05UIwZNgVpwJS5OxsZi6YkDfOvC8Hul0zJJtqfHsK
         YEZQS0ZS9ubgzrrTxrP2gnQPH30N8XEOkVSUNjj1F2uX1v+hQIAwPcAU9xs6cPFhi+Vw
         9gbAMPMrxykd1Qpc3+7HGIH53fxNNNhCpoOPC//rGYk6HnXRnEm8Ld5SzBGc7kS0DkLQ
         wPy6+nLHoCWCpEHDMtv47HDZ7oydD1lOetCA7c+3A/JLnC3UvTTszdEcNetn6a4vA7hP
         crDg==
X-Gm-Message-State: AOJu0YwJMeUNLJWsNz8W/MmOzrc2VZc+j/BAFTInmpcY+fPRScgFptnh
	z7M4ygtG8xVk9TcZDRIQavv7x2hA3OMxU+nkUD36C2+fkiZDSTX/PZvlPqxG
X-Google-Smtp-Source: AGHT+IEQaF91OO/4ihyJoMN6RQMG4H7dpQaO+UJKazmbeoiHZotFSvakQTQJfjQVo+5Wb5I81q6lYg==
X-Received: by 2002:a17:90b:1202:b0:2e2:e32b:86b1 with SMTP id 98e67ed59e1d1-2e2f0a08a40mr9438213a91.6.1728770320564;
        Sat, 12 Oct 2024 14:58:40 -0700 (PDT)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a57096f6sm7854298a91.26.2024.10.12.14.58.38
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Oct 2024 14:58:40 -0700 (PDT)
From: Josey Swihart <nuraadino55@gmail.com>
X-Google-Original-From: Josey Swihart <joswihart@outlook.com>
Message-ID: <d5d6de0cf4a29308349b434bb837687a4881b978cc86e633dbfd25f9ce8d0de1@mx.google.com>
Reply-To: joswihart@outlook.com
To: linux-embedded@vger.kernel.org
Subject: Yamaha Piano 10/12
Date: Sat, 12 Oct 2024 17:58:36 -0400
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,

I?m offering my late husband?s Yamaha piano to anyone who would truly appreciate it. If you or someone you know would be interested in receiving this instrument for free, please don?t hesitate to contact me.

Warm regards,
Josey
