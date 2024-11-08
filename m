Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FCC194A68
	for <linux-embedded@vger.kernel.org>; Fri,  8 Nov 2024 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731076523; cv=none; b=tfsGStcjDpyXP2yW5zWAOaKHqfwo9GwpvvNOBDcqc9diVBSgTSfIXHdTMl5re53N4Jnk+YnA3hg1RFzpxSmV8lV15WmTq+xYf2NaJ2R4yGArEt3gL7WO0M8wOfkAw93qRJNBQ1HzrzvwBvN/B8kdkHN5Z2Bv4eSF+z5Rw7AQnTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731076523; c=relaxed/simple;
	bh=I+r86g98pPJERJjxcH2jyVqncM4oQzqHvlXPB8b0cXY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tGUqmp28NIvVBoqWSarnpblHO1JqBteYFff4uN9v4/7XMk2qLZ9nRl1dWI2+hwV7UuYopxvxWQnWfpukAuHbsem4w1XYwxRmf5M2HSumXO7zFlJPCTu1LmH9v0MrdYhvQ8VImWiZV9OeuUnDoRqGCbji1T1e/V5iYa1xLeOdi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYWOwXZ7; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYWOwXZ7"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ee1c3dbeb9so1148337eaf.1
        for <linux-embedded@vger.kernel.org>; Fri, 08 Nov 2024 06:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731076521; x=1731681321; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I+r86g98pPJERJjxcH2jyVqncM4oQzqHvlXPB8b0cXY=;
        b=SYWOwXZ7VPVM5lYs7xA9l8F98sAgESuO1RKmbRE2YADuB1/DSGQziFEJBnvAEHab91
         fsptuhqU0Ih+XqnYrRE0V6Tgxm7tACa3pnMLgUrov4FfaQgWU7X4OzYupvyR5EOXMqz/
         gp3DA8DrcmvjpmQm2sECihqUWDOT0T4Ssns9NUkBAjh5b0Yz90z0qJlmsO08AT+MmAfe
         sABxLoQ7SezMrk2luazyBz/A2fQYJbhfRkB4usmQs2kkrrARplZwI+qsF4OqpAyT1USU
         mJQPlOr/ViUviggUH80LnwZ51c6BskqEiKDdkTWBWarA/jw9z8CNxFLP1AXA/ieYBxQc
         Eetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731076521; x=1731681321;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+r86g98pPJERJjxcH2jyVqncM4oQzqHvlXPB8b0cXY=;
        b=ll4ZYosHhmJxdwkE7YVXsye2oCWTjkDJSgILW1yIRBKIgYbh6zFEgSBb8J24Mcb1kt
         hqdnEunt8jK8NnKpwvnMiOX31Z+/fLOcNuu9z6WyzsdYpI0UurpaPZcI2ZYcUt2NZ0VA
         HAK0g7HN6YPyoOAvQ8epMAKvppVb6Do31fp9g+SkBhXSJXPHlR9fr0hP7zXW4ifjIJNx
         3tz2mymf73fG38uN0nQlh0jEAgr+lW3CQysCeM+ulUo8XfkUgKqvUZEIBaidZB5RPzab
         7UwKLFhd/XQCkZaoabue8RrzNtseoQjiU221aBJ3wlth2lKIrgC+pkFAX4jF4hLHcI5q
         Vt7Q==
X-Gm-Message-State: AOJu0Yzb18XiUaN79OkA7HUyKUqNJiyaV9NjsIYX5g3k0LUA70MMI4nT
	S4OuHShtG5py2LVZkPyYkzg8ABssCtXq+iOzTEQ0r67YAHIDlwlmCJ4/TU6aOVcnQd5miRUGvbW
	29kDPrV2rTeuy3kIWkfxbyGTbF90n5gES
X-Google-Smtp-Source: AGHT+IGuHah7Rotp60bc9dMD0s9q4XcqhBYPhkKRF+qdaTGgq0zDnCEFhI4G8szzc53SSEMInmKAOXBur5q9oz8K16Q=
X-Received: by 2002:a4a:b2c5:0:b0:5eb:cff9:d208 with SMTP id
 006d021491bc7-5ee56987becmr2159852eaf.2.1731076521211; Fri, 08 Nov 2024
 06:35:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Madeeha Javed <madeeha@gmail.com>
Date: Fri, 8 Nov 2024 19:35:09 +0500
Message-ID: <CAKH5gYwJL85NYma7YaiFwN8Bz-WngHa=arvR-SfKtr_FFD3pSw@mail.gmail.com>
Subject: Request to join the mailing list
To: linux-embedded@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I work at Igalia but I am joining from my personal email account
because I have personal interest in working on Linux boot time
optimizations due to my prior experience with Automotive use-cases in
my past job.

Thanks!
Madeeha Javed
https://www.linkedin.com/in/madeehajaved/
