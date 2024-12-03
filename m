Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C01F7554
	for <linux-embedded@vger.kernel.org>; Tue,  3 Dec 2024 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733239639; cv=none; b=I3NPi036hHJvLkzxaDMVsiNvQBJW2UDtwA+prq4biEqa5+pnlPsjRmCBEKzt7csBoiNx+MrpHyrco6NTTiefMtUr4OmEHbE1oVQQCd0Y1WH9v4CXdrtFsH9yltQqtldofP2D+vRpz+UAMrbmrxW8prfKugQHpASmW7oK68ZT27I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733239639; c=relaxed/simple;
	bh=ryqjMepciPNN9yv8Ty70slrXmv0mRcXt093RJRLWSWs=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=upKz3j7gLrvKWXrLoJtof+PpnPOmIBxhGiB9OLmfy4Yu2Bffey5qHP/qzxE0qN6FjC3abFmJiIZABrt7tXzDK/gWmfubZr53oHQChQT5128UVcElV09R63LdlJt2Xj5gyeH6JUjc3gFku7PYlX0SfLyOqnGyMIzTDoLbKWeeHKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1k86ZDb; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1k86ZDb"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-215b13e9ccbso16601485ad.0
        for <linux-embedded@vger.kernel.org>; Tue, 03 Dec 2024 07:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733239636; x=1733844436; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryqjMepciPNN9yv8Ty70slrXmv0mRcXt093RJRLWSWs=;
        b=a1k86ZDbnrI5EL59FL4A5KpUUlzirk1CHRrqCRrVYITzmpTq1mFZmgGHq66EUubcFQ
         LSYLg4UN+/u7cCftVGk8oY4WoDPU52DxSFrz/RzM3h6ACNc7Qjb1BE4qNHJZM7ExQgBF
         62xULEby01V69HppD4aZWkNd1K0OowEWFb2TQK2Gki6dze0mZUq6vvyskOWX7piPrxgR
         bIzAewvH1U66Lyk0pGVSD+sodNGytlMwuRF8Z1XR6eNTWZhPuRG+2jR4H7ZVRme8dbT9
         lQQwdKFtGWP09ZvE/RyLQRuw6FzMJfToPbhh1zqzFhQGOPLkp/CI0eBggD6QecGbxOnC
         YLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733239636; x=1733844436;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ryqjMepciPNN9yv8Ty70slrXmv0mRcXt093RJRLWSWs=;
        b=uGKMJtjxdGbN7xt85H+BOwv+3Pb9ntgGDXGCY5UJm8Vf1GPBV82Kl1BQQBNmJ/sZ2W
         u2NXhjVDkfsZkp3nCCPuHo9eX8+yuPCtKXeSxH/4fQnNGIqJ3OAWajt8krgwWG7+/3vM
         /rduFO5oc6symVedP7FZNXHttr03HW08JiDLqOX3rPm5aqEf2NKA+kyiLT1qiHeSOF4R
         qlepGZaphL0ZR7RC2hfNGZ+F+tRsDy6LEDlvYprSUAEZozYmjWP+s3yqJ0qc7hX86eCp
         ssjXSCbI9qm1rriF/Qmm5ZTGrV26zHIbvZt8VBkG7Vy5KPFPenYkYHjBtsXGlVZfxsKK
         HKSA==
X-Gm-Message-State: AOJu0YwLKJ5HN6dunKPQ+NyzKNV+2yuk8w5vwdzIAWnrJWpz3f/UZgS6
	p7T0kT6mxhBEv5JiKGbdLXr8tSnMGhGaYrHEb1Y5EARKK1uAXm31yYR0ZbR4
X-Gm-Gg: ASbGncuOjiooyYZa/JeAR8mHpnmi6gkgVaBQjgth5hwG7F/BghKIBdOzKLMUw31ZCqD
	GtzIoCU7KDCI1zGr5vohiT4MxP1M9/qy8L/peb7d2Tx9Kjhz5mzDjMfjnt95tDgi5JabybvxlN/
	fFbR9nODL4WHdJe8IgTy/ct/gf5CQNRGgXLGWc0SCHVzEc9oCOV7wIR8nfXOcAZSvvd5wloj4Ey
	vuZVa5yiiRwoRwhaz2ICOFcgIy0vpHNW5omV8MykCcIQOPkwWGRo0oVeQkbduoRSng=
X-Google-Smtp-Source: AGHT+IEfDhiVo/WWnT89+KTv7KHGJM7LSYvm5B3F1l8sgKz81s9NebvTWPvgx8TUOUiykJj8k6oiGw==
X-Received: by 2002:a17:903:98f:b0:215:8c36:9ce with SMTP id d9443c01a7336-215bd0f6349mr36848025ad.30.1733239636153;
        Tue, 03 Dec 2024 07:27:16 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fbffasm10944514b3a.103.2024.12.03.07.27.15
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2024 07:27:15 -0800 (PST)
From: Michelle Bukaty <atwaterruben73@gmail.com>
X-Google-Original-From: Michelle Bukaty <michbukaty@hotmail.com>
Message-ID: <4182572d5be68c95e857f0062a5dc90828580739072525eadd7302b6bfd9a270@mx.google.com>
Reply-To: michbukaty@hotmail.com
To: linux-embedded@vger.kernel.org
Subject: Grand Piano 12/03
Date: Tue, 03 Dec 2024 10:27:10 -0500
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,

I am reaching out once more about my late husband Yamaha piano, which i am offering to anyone who would genuinely cherish it. If you or someone you know would be interested in receiving this instrument as a gift, please feel free to get in touch.

Warm regards,
Michelle
