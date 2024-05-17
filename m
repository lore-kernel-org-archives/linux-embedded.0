Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D1B3BBE2
	for <linux-embedded@vger.kernel.org>; Fri, 17 May 2024 10:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715942782; cv=none; b=Ssu07GTEaytzFgJ8Muv9v0M7+YdZRKP1p926AUb9B0MeBbF4fHNXRqk7Hu8nZ/1T7qINSX1XvlKw7g5Ho0Etao4Sythp/0YbO9Wv6Qo5y1ncbXW/OR9OQTeA62gKW3mq+fGqb7PHACb1a8WVeYiPI2jcXtKgj+f9O60neNfppUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715942782; c=relaxed/simple;
	bh=UkgAXn/6j8OUvkYSzEDkBjuCcR4tQpTnuNLMPKV22Js=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tre7XrzceU+2b38PBcs2Vp+4g9UJ1tN84tQf8pH5GL2gbyfjqgy+oTA0wZx/EqjAylfGwiy4tYKWvLeF36cwivVm2TMVLYI6WcFbb2WMHuV4WvnkLKKAem0PFgo+MVh8FaO/G1PyN8USEjhMRiTeT1JtmuIDV3WxUhe4fRb19eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS5Xuocd; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS5Xuocd"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6f0fbd2d9ebso791441a34.2
        for <linux-embedded@vger.kernel.org>; Fri, 17 May 2024 03:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715942779; x=1716547579; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UkgAXn/6j8OUvkYSzEDkBjuCcR4tQpTnuNLMPKV22Js=;
        b=XS5XuocdE+XhcHB1dOaw0rBOX2W/x3hQnGIVkWmjArcX3KpRs9jkMu9Aqo+3j2LRmK
         0H/gxQ5sXHWW5bzEvwxEF7vFqz2fgGaUaWFhGw9V05sY0agsEkZbgsim97HNwQC92TQZ
         3zPkm13rwKPJacnknGmsZb5KxI2f9wN6dASteT9+U3pwXzXs77/Q0CatTBrxRPIF/TRO
         fqsGeefPi1rbL3K8o8a+V7QmKjRKKml7uLnXLMqRmEOoxlvOhnghIWuNYH00k+c3NF1d
         pJL7Vu2Kf+F6ZQG9/G/UFu2FYu5/o7ybHDfBp2ymyf9WhFBfkL7Yhcx6pZP/nqXQSnmJ
         7u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715942780; x=1716547580;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UkgAXn/6j8OUvkYSzEDkBjuCcR4tQpTnuNLMPKV22Js=;
        b=CkKfa+QJhEVRwLFTeIA0QKfYqYejzbomdVWnEacmwb7spB3AYTFHzt7KQ79Dnttn25
         wurbju//bUKFOoG3dMwekkYc/FUTs4GhSlA/Vmw0dtfUworUc1m7V68qXKTKC0onAGJg
         926Tz9ZSAyYR0i4C5hc/eZPQfE/IMiyhC7G7GRI2i9G8pCa5+fCWSn+p9ld8WEVfQCvd
         hoc3wNVqnTApYOmx2zheVgTrbYfktLFOW2Zl5MoHHjCzhVbpzs3Nts8GWGIlz47McGYz
         h13stzWx3h1bG4v3jjlmhWi1hoI8bv596WvhbVsB9JR024/VdFOihG7b5xwZic7qtQu/
         43Fg==
X-Gm-Message-State: AOJu0YyJLIU+yQz8jBf+Kn5uaBQ0QJ1Bo6yBP0Xcn3/0dtLj9zggxzc8
	GmKBh4aQUDfJGal90PBAsvvqWEZD7M+NCAcHXdoYBSzjYCMu9aZj+C7leboOwsns0RSkzeMe9I2
	8CPUvlmvqH/3WttlLjNN/YiGSjoUjQQAKXGjLzw==
X-Google-Smtp-Source: AGHT+IGGbAiT0f1vLNHsciIFLMpykNDTQR1pa6T1TLZDTp/Nfe9RrWLoqhaTuLCFsFeeUdK4g2Vt8AfFInNUTY8uKuc=
X-Received: by 2002:a05:6871:3311:b0:23c:6723:8651 with SMTP id
 586e51a60fabf-24172a4e3a4mr30400850fac.11.1715942779557; Fri, 17 May 2024
 03:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andy Gao <gjw1106364305@gmail.com>
Date: Fri, 17 May 2024 18:46:04 +0800
Message-ID: <CAP_=AYerkRCzPUOUubpAsHGaOPwgdtQZjmbMhKHdgZrPxn=bng@mail.gmail.com>
Subject: lowend platforms support such as Cortex-M
To: linux-embedded@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm curious about the level of support that modern Linux offers for
low-end platforms that lack MMU components, such as the ARM Cortex-M
family. Specifically, I'm interested in the memory protection
capabilities that Linux provides on these platforms.
While the ARM Cortex-M family offers an MPU (memory protection unit),
I haven't seen many features related to it in the Linux kernel.
Please let me know if I'm mistaken, and any additional information
would be greatly appreciated. Thank you!

Best Regards,
Andy
