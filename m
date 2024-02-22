Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F254414B82B
	for <linux-embedded@vger.kernel.org>; Thu, 22 Feb 2024 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708630556; cv=none; b=W8SXC2RXTO1TgkObKAbaxdxT2Yw1urqfzqh1EG5VqaxpTXtEVkEcqS+W2+x27PAIp1t5TsC1lW94YE6FfsiXwziFYmZTGUe+OjlzIWzjBFEmYYo+o2K1NNsufqKM6xpM2k/fBgBdDGW2zkFhrhdklxNL0tGLoqbtd1SFuwDllnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708630556; c=relaxed/simple;
	bh=NVz90ha6iy198ZVLo/B3AjMKiIcFzf1854mNc1gPKDM=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=nXuVX47R3yycTk4HJpe1eeHC1GjkYwhvDKTtV+mtt32P/evwwB76gZT5qmDWYfNDbymi7jZDhEehJNaZYwN3Nf13gD4fj8wYrMo4jiIYvkt+mPxGko7N6Zo8t70PjS90XIrBBk+u87zZtj/B8OOL+HcEQLQeLgH+fvwdh07J6Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLYkKnhG; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLYkKnhG"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-a3e82664d53so10628566b.3
        for <linux-embedded@vger.kernel.org>; Thu, 22 Feb 2024 11:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708630553; x=1709235353; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVz90ha6iy198ZVLo/B3AjMKiIcFzf1854mNc1gPKDM=;
        b=mLYkKnhGNSeZ7vSEI/hI0kAe90x70vKIKQP5ldHyEJpf7Us4vG4qzonq00z1keHFv5
         OOSEmHiWQxk9iqR9yVMNaSthDqk2nhtdTng4yXk/w3ug9IxmMYgQKZHtB/57mAn4Pmet
         1MGDa2c+f1s6ZLcmQ7DQj66zB/fWSwbJgBnfPc9n6w3HsBWbkX+2C7hZhwlWUazCQOBL
         n2ve6XdYLR6N9EjaTknUTGitZ5zT3XL2XEh5vPMd31IACfvxN6Iw8AG36wJXURy0RYXx
         HoJtPE9uJ5FrLxrNMsrNBx6ITjGc1i0GOM7wDRvEjVb25bx/Xw851eMpvQ4V74vLFbJ2
         cP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708630553; x=1709235353;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NVz90ha6iy198ZVLo/B3AjMKiIcFzf1854mNc1gPKDM=;
        b=hQM2HmLIUlN0yKUpuryzuwDUrUMFXvjMq1vCjsHA6XlidPxZcS6pynPxkuJ4roBEBC
         oEpxR7QVEqnfrH4mAquzgZXT7Z+ixB5gb4slMV01wZUJEecyzXOemIZIdJLL1CtZMaD7
         pEq8b70wr0JR6IlRimtVzRTqVeLgrN906zsTtmnqFUyLmXnV+YC+T06+Hj0X/Fez86/5
         Etg2HxrBj7hI1Z6qNWifjMGBAYp6s28/q7Kcz/hkBNANgHy+XTvS/wr1hCd3f6hwkOlW
         QOo1QJh7WTa4Rl+7vDy6SxdA9Lw2OdcjBASsyObzCnm4OUguyBdMXMAn+i8zYoZk8vUP
         B67w==
X-Gm-Message-State: AOJu0YycpBo4jp/FMBm4Jx4pNKGxfq1SKNlrG11Kt7dDlsFQFFwn1Efc
	660GyaFKgrlPT2W64EjkY9EdzAIfbl0i6rkxZnW+YGu8xfZ5dPWSBXEg0bFCMDQ=
X-Google-Smtp-Source: AGHT+IFr7Z9L3Yg/eQWSuu0MJGejdm5xtRwvkeHueHYIZzJXUr0C3EczsUs5wAKciWuBBNuR+0EYTw==
X-Received: by 2002:a17:906:3559:b0:a3f:a562:ded2 with SMTP id s25-20020a170906355900b00a3fa562ded2mr972809eja.73.1708630553323;
        Thu, 22 Feb 2024 11:35:53 -0800 (PST)
Received: from [45.137.22.91] ([45.137.22.91])
        by smtp.gmail.com with ESMTPSA id gs8-20020a1709072d0800b00a3dab486a19sm6159556ejc.118.2024.02.22.11.35.52
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Feb 2024 11:35:53 -0800 (PST)
From: Paula Mortalo <nancyevans866@gmail.com>
X-Google-Original-From: Paula Mortalo <pmortalo@hotmail.com>
Message-ID: <8f1facbaf6c56b73839e5154b8225e41d94ec1dd4dba3bd3dd4ee283adfc8f5f@mx.google.com>
Reply-To: pmortalo@hotmail.com
To: linux-embedded@vger.kernel.org
Subject: Yamaha grand piano 02/22/2024
Date: Thu, 22 Feb 2024 20:35:52 +0100
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,

I'm offering my late husband's Yamaha Piano to any music enthusiast. If you or someone you know might value this instrument, please don't hesitate to reach out to me.

Warm regards,
Paula
