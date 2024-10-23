Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F251213EFF3
	for <linux-embedded@vger.kernel.org>; Wed, 23 Oct 2024 05:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661067; cv=none; b=ilwn2M8kEL81BUdrnH9szNh2V2cGP+4QwQezPKL+2c1ZfflW7uThypKKeI/J6aUjmKKHtjmTCEZkmhdDjolmpmKqLfJ+QzqNGfcnf9ycxh1LkjmJg/EtNOlO5X0oQEHtW7uN3FXg/xHSj3BFGHBoVMOBNp70aLqbrsXn0iecN84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661067; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=tXAf+iJAoqIDmIvepMyfCxy9klsL6wmrdA4UroJ/XhdEi2DDsDzXB9AswrC4uhm2gHNqttZAE9bWHv7e9M7oejJvTePkQAwv1Knql5FMw3Zxtlrm2LpT5uARv9c82Ht44mA86G4xEQ0aMb142Bybo1AJTQl1ecTRjsWUwdHsEMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHGtOnZo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHGtOnZo"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso5041362f8f.3
        for <linux-embedded@vger.kernel.org>; Tue, 22 Oct 2024 22:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729661064; x=1730265864; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=JHGtOnZoMy3LRJXFMdCguazXiNe/4W2CdL3ZOPA+EgyCxPFv0Z1QRgEnSTw+UDozn0
         YqbC2s3WgjAD3PyIlXaD5Y0wrj9xL+JwU06mZQy+1x2yZiXMCWD0MuUUOTxQvC7IwBI2
         gQwzs/FCo8cPbDultBAQWkyYgrrb+X88uR3BL8qyCQnccgmRLqGdCwLgQz1uDXpi0fNQ
         L/hBpEy7py6ZNr9RguBrKDTIcHYzIYzzUtmz6+s7wdxs5EyUfybJjbnvB8HggPNf5Rav
         NXg4+2aF/uCvmXnZt5dbiVthRfVfD1CFwLc1k4g9LKD1bk7iF0H/CmoYvQqE+UqP+Cy1
         6s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729661064; x=1730265864;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=Iorsx9PrxN3lw08wIcO24RCR0b8aw/pfwYXiQ1/+Slr9iSkyl+MmRHFzjet+7R1Tm1
         IQJB29GzJQaIiDkheLv+dGkPNB6FyDBamKiOyQRWNZrlA7y/l8PmQs5jIPA2JjIfZKZ9
         oTw8pj/DZkDreyVLZU2Aze11OlIeGJTjne5x/ScVzblZhSwD78/8rSEFsidZNyhZYyEu
         407ecE60kMTVW2ijpJ9OX0B9mDNgTVQix/21zzMBZdzrv/EQCDMNoenxcEF3a7qpiY7L
         UZE6XUzGpGViRr1nd1+S5KaDO1hjyvRT1gS8aCF2J3bUrEZv7HA1RAZlyQ3rYuSVrx7q
         Rc+Q==
X-Gm-Message-State: AOJu0YzyzRc7NkLuJXn8JvOtqz6XvdTlUVMTc/JVKZeHZhXCwgv0Wc2C
	zP1mVs/S5FCwzDGJsA4l5HKrbQXKxD9ZdMuJjmn5cpEbOvZN8kqlES+ew6a7+O+bdK8lW6M8Nr0
	zBpMWelwh3Vm3LE9JDrDXoCGTiVXVzQ==
X-Google-Smtp-Source: AGHT+IG+214zhdki8eKsnQS/MTfMtTKZfmIkWmZjXzPv3WXioJen8FaZ6lCMcXDeUwchiMoYmxVWvIB+7LAZfQJgUFA=
X-Received: by 2002:a05:6000:1863:b0:37c:cf0b:e9e6 with SMTP id
 ffacd0b85a97d-37efcf8d65cmr912829f8f.42.1729661064151; Tue, 22 Oct 2024
 22:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE_iR+jYEzf6M2vPTsXJEyAMJ+21uwHJL=c4U3S1cjF72gjjzQ@mail.gmail.com>
In-Reply-To: <CAE_iR+jYEzf6M2vPTsXJEyAMJ+21uwHJL=c4U3S1cjF72gjjzQ@mail.gmail.com>
From: priyaranjan <priyaranjan45678@gmail.com>
Date: Wed, 23 Oct 2024 10:54:12 +0530
Message-ID: <CAE_iR+jo58Xk8HCHbry7a7OLrrQ1+i=vjNtYLJx_YmbMxepXCA@mail.gmail.com>
Subject: Wish to join this group. Please add me
To: linux-embedded@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"


