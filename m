Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828642882D4
	for <linux-embedded@vger.kernel.org>; Thu, 15 May 2025 21:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747344244; cv=none; b=AOo2GtoFRoD1DeKMf107jwUPUxSe8A0v6joJ+yeTTKRgGLqhQSoi59gCY7bIm5wcDGstKUV4KEhcLjEpuneR0gtgDAyldwdmdYZMMujXqb17UpOK+YSJGPxwBgDx0DhxAs2nIgpl7lWQB/3Y9DIoS/tnY1FEqboDwGftR5/kMwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747344244; c=relaxed/simple;
	bh=xyazXrlcgtiHvNHsAdtcm6f6/fdUvfAPeQL0pc7AfUw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ofQDvx2ff9hIvsObfvrGmeFIePfDswqLx4N0t0q+kAKAbpQFcZT67+FNTYpmWk3jDVBJveSm/SJGDih1Zmz1mNLFxZk7MqYBuse2QnMOLDSqmJqQiF7vBokzvOhq+X2iuWicTYS+avin7As2mwbH95C6xcdg0zdBSGAyt5zUDiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=a5ceNuTy; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="a5ceNuTy"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70a57a8ffc3so15648377b3.0
        for <linux-embedded@vger.kernel.org>; Thu, 15 May 2025 14:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747344240; x=1747949040; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AN71LSOudSTv5JWWHVNrF+liF/XZvXFN7CVIz2pudDM=;
        b=a5ceNuTy82PRKLarDhNXDoVImUKJusBj1w5RjWQw7saEm1POMvOCG2qSekdEaowaRK
         njpBGUJxESp0oeoPY11x/sdJSHgCeTHCXlDLrTRevkan7eR69+q9SFNfhM+krVHou2ka
         LnrtmEoHqi2RJpbHULb9xq/+ypVYTcs0NODFTXiekuPzxsjajRdztibWiRmjN2AHmMV5
         MMcx5nZbPmXBCQa4BBDlixgyz9uH/xFzZxFMeECdGqQCkL311PAsshhJkhiUnzW6LCX8
         PtD9ZxAFq9wwG5PE2DMJmnXyv4MFhtckKMhZdPGobQtK4Azem/ppusCNEhfdxY8Uss5f
         UYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747344240; x=1747949040;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AN71LSOudSTv5JWWHVNrF+liF/XZvXFN7CVIz2pudDM=;
        b=n1baj28jmInCPjAhnkMgmgN3F9wIoI+W/iGd7hQUyYATCYiGeAHRmyt+qsdDuSxFyY
         u+6c3Fv55PznR1mqjSaF2jZGU2NL34qzS418J78Q9DxRJozZ7uoeJykEUacQjfsRYSn/
         +ECwD1NLDCLUkWqQqJNUQGTZHx3UhgPssGi4DQm7acO/P3UUR/q64LPd4ECEeRKry8B/
         n9/nmost6H1Y8/WNrXvW5+y3Nd0E6IXjSosAxep8ImgXWzt4mFm4iOW+pgg3mcGL+gah
         C5nBqtkCcJjqNOYwrP8+hDOH3NCSmKnivOSbhaO7QsmRm2MxxlLcZ2vzcq7hd7txR5ZM
         cnAw==
X-Forwarded-Encrypted: i=1; AJvYcCVVQN/G+0VblrplLU8iE8nkkWPJVydom+Bb+UvjAjadILpRJpVRhZm4zXs2doJ5TKA+UbTmCnE3kiLw0Wbd6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRliuTIqp+ldRtjXUO3j/UYpjZvS4xiR8IlR8e7ddJLZReVCwu
	WjwA9xrG/dn8Wd/xeJ04kSxCip0HUwQexM9G89I1B6wri9eoUfgrZS5n+0pxUPYO7tiFus+3tXc
	01k5eEUhPEZdeanSE1sII29Nc+RIyPDkeRm1hOVX8YfLluNFeGmz/TPZx3L0vgjI=
X-Gm-Gg: ASbGncunLMQfJfmw5wjKiRsj/Yykfmki/hux3SPCVhEmptLyy29CUsNtSo+dADIge1r
	IsPrCXtXne3E/CVrWzfREKTS53+Jy1MuaJIqwbbaRkcDNVQrgEIB2dZiFkM65atWOwdx7vAhcmV
	0BuneWS54eW4K1zhvHRWyR30dTJJvHzNjz4B062H7uLE5gc1E1WQe+9SEwBykaC0BjrQ==
X-Google-Smtp-Source: AGHT+IHPhdnp4/fhlI2FShNWLCLi2V3neuEaCMAadfVcbIxcP0NkV4jp/faZYlA7JFqsSYu+7fHTypwywRleWHb+c3M=
X-Received: by 2002:a05:690c:25c3:b0:702:52fb:4649 with SMTP id
 00721157ae682-70cab099494mr3616717b3.27.1747344240276; Thu, 15 May 2025
 14:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kevin Hilman <khilman@baylibre.com>
Date: Thu, 15 May 2025 23:23:48 +0200
X-Gm-Features: AX0GCFsdhWp5ve_9FADQ8StpGZoxKpyw1UIxSY0tIYDoeAKFXlvmfSk4ESJo7Vs
Message-ID: <CAOi56cUxTs=vJW87iatugQbeSD6z4HPbpLoEkXv8+vnunV=HJA@mail.gmail.com>
Subject: ER2025: labgrid workshop attendees
To: Bastian Krause <bst@pengutronix.de>, Leonard Goehrs <lgo@pengutronix.de>
Cc: event-orga <event-orga@pengutronix.de>, 
	Linux Embedded <linux-embedded@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bastian, Leonard,

ER has been busy and I just realized we never sent you the list of
participants for you workship.  Here's the list of names we got from
the registration as of yesterday:

MARTELLI, Matteo
MANGIAROTTI, Michele
VALLA, Francesco
SANG, Wolfram
FERREIRA, Guilherme
GOKHALE, Varad
NIEDERMAIER, Christoph
NEUHAUSER, Johann
FROST, Benjamin
