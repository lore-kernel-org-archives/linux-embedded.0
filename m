Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E85A481C4
	for <linux-embedded@vger.kernel.org>; Fri, 16 May 2025 05:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747372893; cv=none; b=Ts82fTIxgqNyzHq+NoLteyh2hiKH9eKBLZbP3dacG/QNUK08G2lLSmT+uOTkhLyfRZxNh92oxgW9dvogFPZbO9ZIVqAX/TimxVXVR8Y6dWvHIIAyFKZxMCZxK59llahv1bK+xoirCZbcDsvyDHsO9fxou8UJazDHkKtBN8kSuGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747372893; c=relaxed/simple;
	bh=AlVDuFtd1gVRxkxbtXQYy5LSklDvJC35vBuGt2c0l2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=tngtgqfPaZKcgthH2IlbwdxzpW6ufb23vzaHqf/jA2rjJW7nNJOeFLOHoF0qkTsFMdODCsLLZN1O4i7qwIY4wmI0h1gnnigZUZQYgxpOWXAFY/+tedW4+5d1REK8GkgeIlY37mXYKnrq8EUjO3AuV5eZg+aqSxH63AwOnaabx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HjHt3ccv; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HjHt3ccv"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70900a80907so15832517b3.0
        for <linux-embedded@vger.kernel.org>; Thu, 15 May 2025 22:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747372889; x=1747977689; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AlVDuFtd1gVRxkxbtXQYy5LSklDvJC35vBuGt2c0l2M=;
        b=HjHt3ccvIo437xrXEvoSBEpoYyZSe9eSTRDiQWwL+SBZGpsGrD/qCUlSY4PtBvwNvw
         WBtMYVhCEVK7DonO+xfXRGY4Pl75FRUI05ujtXoRUPn6eWoP6lmRZdpyOjfRNEfBMSlW
         oG8igJUwoLyqvoEjQsVlQKJYgGkGkcMc5BnmLpDlhEKvxZQfDXMNPiajSG8JXwOe6RcN
         P3cBYghcZpmcUXvDtQu4+EhdJAXIByYdNt0eA6TaX/6haaJY1u8GhMDB8slw/qbXhkOB
         iRmfa9eJ5C9kCAf7H3alyTj2GTjyKlUbukxN/HJNOWzKJx5NZEZrL1133bO7mgVdhii5
         MzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747372889; x=1747977689;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AlVDuFtd1gVRxkxbtXQYy5LSklDvJC35vBuGt2c0l2M=;
        b=V1HIWAI85k58Zh61uB3STLrpWOKbrWmg+1YjYO7/Oqx0Runa7+u8hASDxetEEsX8Kk
         8Zlb9NhYo6sNGubiFzG5QbQ2h3BnEOKQ1bxRDvX+2tp5+B7IHGQKVZjuC3IorUDnHKpo
         hvjorpf03zDHxMFuvY4vvEbJSCji++nxEgqOSIJjhljshfQ/NgyA+fFCslUEKIdQ8Twy
         6UwqXdRvGDqObiKLVbCW07UiooFTKu4hwUJ/mJmIrkMJox8t6n8olca1fNyyNtyu23Zy
         hKdtuf2R1X4sfHXcr5JE2SiRL5fXVCXwALFVuA0JM5doAYwjdG+NCFgNvhwQLUjOfOR4
         CUaw==
X-Gm-Message-State: AOJu0YyCN3VPAOpMijIWQ/U7sH1cRYCtYswltlsGK+OGyRoCt6tbbKud
	Bsifxzb3eu7Kg3kumsMJyGpL8qgurBc4L5+vI4XIV+LPcEAbpdWGk+/cWX/pAqb/rD520VuT/P2
	tvvf1tTwRqSQeHQCZd+eq3rumIx76HVQmsHaBmUN39Pw+9CcAOQXstbCnbacZ
X-Gm-Gg: ASbGncvMB2uI0Qs3V/8bgwuFoOb0CBgVa+ilSSm5tTq/pD/n2/zVlwK0jiBAedrlv5M
	oZC/LAf0qfy7M+LioMsAkbPyHB6P/eAkgZwU29EZ6qfNZSEGsiIMt9wkCrW0lPLrlXR7Fm7Vnwu
	6CA8SQgvL0pdRqUPnxcuWW0tyDPqbHNek+yEE2G+dMzJTtxPR1+Zc9cl1clVRSj/BT4A==
X-Google-Smtp-Source: AGHT+IHQN0soj7MA42FQS2VMm6fY74pIP5plBJoAL4ZmLpn49rYkWlviYxlkbTlPTr//w4vmX6rGxvoBU1fkkN1xBM4=
X-Received: by 2002:a05:690c:74c8:b0:708:139e:4e03 with SMTP id
 00721157ae682-70ca7a45933mr40399277b3.16.1747372888904; Thu, 15 May 2025
 22:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOi56cUxTs=vJW87iatugQbeSD6z4HPbpLoEkXv8+vnunV=HJA@mail.gmail.com>
In-Reply-To: <CAOi56cUxTs=vJW87iatugQbeSD6z4HPbpLoEkXv8+vnunV=HJA@mail.gmail.com>
From: Kevin Hilman <khilman@baylibre.com>
Date: Fri, 16 May 2025 07:21:16 +0200
X-Gm-Features: AX0GCFsAh89QYBbzf3p3cPB1UOlSiU6BxoeajwJ3ZoxKdTq-D8wOd4Us0uCvjLY
Message-ID: <CAOi56cXaucQzhGw8p6xa06e7UOyfph3jJ2TkC16L7Tyns03wRg@mail.gmail.com>
Subject: Re: ER2025: labgrid workshop attendees
To: Linux Embedded <linux-embedded@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Wrong mailing list, sorry for the noise.
