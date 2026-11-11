Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403122;
	b=sUZ2917jODYtAcCWBG5bRUO3rqAINOS+ykbVf6wzymJ4j8F2H6m1LqJ+SCuvHlA5Qr1J
	 C0gOjxQm17C0kDXcOeQZB143Nyve9K4YEu3Z/nR+JGnQnv53c6mZeQvRrln8ZgMIZff6i
	 xC1/0s+LakwHDw9Ehv42fCy3NPstOjq7pVWl1GGpCumFtCpeEaLTpullN6QZfmAEAExxm
	 l+n9w3KzXfLAmgtsx3zlZlLcfQjj6UHJg9fdtQPyi50ECAegj0txYhDvWlQuXxvQxm9jL
	 GjAqWvqARPLz382ylJQHBX07FmQHvy562ch6jG2tVvEkfK8Bjbsgy6a4p7AsCqIEraw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403122;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
	b=Sl+ggr3Z+3FeVKOlm4Tn4hSTJJoo0muT/2QLx5ZSxkngqLmsMPQWQYf+KhR+SBmPH1wn
	 00JgsWvSDLm6sQBo3WtkA1Irs5iz5nrjZrFoXIZ/59Ow8JQMdIke1M+HjM5u6OMQIqvXa
	 TWdwh4mL+kJEvbfkTShNi1owpEZBD0dGN0CW61J25vchRU//9K4vxxVr22WjDX8LN/zzH
	 Jvce1SwEHUeQtmgp/Fp50vUjqQw23lmGp7Ybuvk0jp/MYKh/Dx05xyxDbmAG51m7sLLFt
	 UmKr/LagkyzuuaDthPlJer2EZuEGZbriUE2pkwBm19C/5vDX+U1ldlroSPZHohgMazg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iQq7dU9q;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RqC7PlOQ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24955606A321
	for <linux-embedded@vger.kernel.org>; Wed, 11 Nov 2026 13:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24955606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iQq7dU9q;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RqC7PlOQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794403121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
	b=iQq7dU9qLnoGNYDWDjGkq2hu0UGzL8U0mU2PJsT4ClAuEQwYNhuhD6lbU/L5j70yCdSj3/
	/GrODQvBHppOxWr5r6zzBgSrz38hu3YXFAWjAaXPwSspLjuvjMHkYMML/7f3qhxJCiKfAN
	dqxY4Cs0j+KVTOfLKNu99AiyUax7GtA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-zQ1oMB9iP9aa0I4y3YZMqA-1; Wed, 11 Nov 2026 08:18:38 -0500
X-MC-Unique: zQ1oMB9iP9aa0I4y3YZMqA-1
X-Mimecast-MFC-AGG-ID: zQ1oMB9iP9aa0I4y3YZMqA_1794403118
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso25863995e9.0
        for <linux-embedded@vger.kernel.org>; Wed, 11 Nov 2026 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794403118; x=1795007918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
        b=RqC7PlOQLpcRLVRN7+MIGQGYiMWNxZug8Tju31tvogWMzrAd4tQOCCnLYEDdGQmB1a
         yIU6J7qsALFakOeCg3rFjyozZXyY1ZY94vDoAH3zrYpWMWqsW3rzMAnOcfjV/MD/Ce5a
         3f99wOl4BA2vgj6J0+xX6JkVMkaI8VW2NQwwEtIGyuKrux76g4GlnDaBC8w6s7sAkLTX
         CbyPtn1OpCdhcy/up/0BM2RXl6gZXXBTuguwH77sMuZ1vEM2VZaG1zS2XaIhSTZfFi4g
         T87PD7H2j7sgEXpZpzr/Wf2M8EuE3/qGvVuSuZ5CP4DWg3BOX2f1Bcv2x7cLi70juUtk
         CoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403118; x=1795007918;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
        b=P//X0GfF9QRKYwaOAcx+uuloCOLYz97M+TwIgBLc3+56BPqvhCX4e3bqUIW3XKZYNH
         O4K66zbNsyxpl6gC4QIi28mTRHoJowlzqtHYAk/ZJo66YXmfWrvHijY0ceCv6knpMyST
         et9X20UGfmUIP7Jdt9avTfO1/mnjugFNVOp5bWAeNcHxQqA/G0UUNNTPrTm3Jcyo7f8a
         RuddZivl5awjIcKcZ2iynz1TQYvkLwztIaUSab+e2BLJio4emsnbHmlh2wlmLsKlM8Mq
         +okHJ36Q61xGX4Wb3H4gOoHPzTrj9H8KD/Gbf9ZfQvqG0DaTzx/iWtiRkzprr0vNoLjB
         FXtQ==
X-Forwarded-Encrypted: i=1; AL+hErHWu72FQEXHOs5fG/6ZIALiRBx15yakzzLdgTpFxRIaLu6Ic35hWEVpQNoHy7gXiqSz05KNAZNqAESR0LZIEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/2g5kjpny7jUFxjUVUXmJkLtIq7qSCZkUorCjPRHOvRSSUf0J4
	Lkl1yNIMsytOdlDwX+ecp4x5w7ImVfm3aNRVdsmzsLL3F3MxxN6VeEBX2gW7IJW8dcKDrR5UW3S
	BvZDY2Y9klHKeRUVb4dKlPQgFydFlRC0Tj9JozEen1oBmemmVQrLM1JWP/0LkxKKyS+u8
X-Gm-Gg: AYBFou3Nym8GkHH8NgbF+Is4zyQ12EXe4JrqYyJwNrRn5kKeOyg10xcq6jia+JaS4aT
	ZMwO6rVw1JVCChnHDTHOgoU5UTPLx04MxKsJE9Nvcd1tvW8Wi/wtiGWFEkEdBVaPFYFGRAL9j4t
	FO1yyAyoYqvMyG0hkhvr6TflRU9EkwFnnwt8UvSBlv44Eh7BK6RwXlq5GWzbb7DmLTTpwiKOhyT
	J0t7rQ6Z2bILRrFNkpjkRHe5Fpxm3vzaHlak82yCquAVnsSOSF7uWlBCM9/gCLEFIceqrAZi1TT
	cbrLS1MpcPmXa19fh2PH6lDyPB+nghMHqll5mSW/7QbBzT3Hw9QBhtOyAplEymTEQmZgryuPMwK
	nBmnrznveWDHR0Dt7e1svs7NpktsHdItXSfb8fU+pAC0FBfEhnajz+rlJTgxszeYMr4LIx4R5b0
	QzmWzoRg4hT4H7LXA+L2BDCS3g+UeUk9Hyd4HK2zU=
X-Received: by 2002:a05:600c:870f:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ba093817d0mr40825635e9.16.1794403117592;
        Wed, 11 Nov 2026 05:18:37 -0800 (PST)
X-Received: by 2002:a05:600c:870f:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ba093817d0mr40824875e9.16.1794403117057;
        Wed, 11 Nov 2026 05:18:37 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498811fa70esm9733692f8f.19.2026.11.11.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:18:36 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?M=C3=A0xim?= Pedraza Padilla <maximpedraza@gmail.com>, Maarten
 Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Helge
 Deller <deller@gmx.de>, Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>, Jani Nikula
 <jani.nikula@linux.intel.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Jocelyn Falempe <jfalempe@redhat.com>, Sam
 Ravnborg <sam@ravnborg.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/15] fbdev: efifb: move the BMP headers to
 <video/bmp.h>
In-Reply-To: <20261027135342.2003632-4-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
 <20261027135342.2003632-4-maximpedraza@gmail.com>
Date: Wed, 11 Nov 2026 14:18:35 +0100
Message-ID: <xlv1cxsba4lw.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Post: <mailto:linux-embedded@vger.kernel.org>
List-Help: <mailto:linux-embedded+help@vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-embedded+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com> writes:

Hello M=C3=A0xim,

> The DRM splash client parses the same BMP headers as efifb. Rather than
> keep a second copy of the structures, move them to include/video/bmp.h
> with the magic number.
>
> BMP is little endian whatever the CPU, so the header gives the fields
> as __le16 and __le32, and efifb now reads them with
> get_unaligned_le16() and get_unaligned_le32(). Width and height are
> read signed, as the format has them. No change on the little endian
> systems EFI runs on.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Assisted-by: Claude:claude-opus-5-5

Please drop this tag. Has been obsoleted by commit 1e035297ffda ("docs:
remove Assisted-by references").

> Signed-off-by: M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com>
> ---
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

