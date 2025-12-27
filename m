Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA04313524
	for <linux-embedded@vger.kernel.org>; Sat, 27 Dec 2025 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836531; cv=none; b=sX0AN8K4X6ggJJohYDoyYFZme6AzapNmNeP8sPW/Tk2AAm9J0npFleETeBwm3a9UFGu7eMikC/bCmfXdO/eKihhAbnXrbFTWuLGPwF314dPgdz4gIV5m1qsuFCoz4KZfzYAbcn28PVP58JUt4my7C+2xA+GxWLh+X2Nvu5tFZ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836531; c=relaxed/simple;
	bh=MJeQXvYoWAeKu9JVArWuPu5BhUo3ui9wPKj5cztNZBU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WdnTERLRgggWggIAhJSEIsGE1KVLTGgWTI7rF2BG/w7ntJbAg45qBF+cOceu7UxvIO/wzd1Rs0UF3GzuPcLLqLDTe7lz6RP48Qneck7ecAiStw3JzJarK36xEMgLufm1bUipDVpgFM+LYsBtPgM/WYa5lJeHB3hUln1ULf373cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8kVoTvU; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8kVoTvU"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94388cfa259so352891241.3
        for <linux-embedded@vger.kernel.org>; Sat, 27 Dec 2025 03:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766836528; x=1767441328; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MJeQXvYoWAeKu9JVArWuPu5BhUo3ui9wPKj5cztNZBU=;
        b=h8kVoTvU/NvDu6l/tcMQwLkspB16g6NNNMmceeJFxWxVeBkGrCcpqoNNGDZnQJgaSf
         p/6OszygR6CFaI0eP9zK0NjjY8/jd0NfuzNZBw4Nn70p3vlVWYl3aXey+gGUatcsVzlt
         9jrzQ/9baQ6COn14MnNZcMwSzNwgM2MkDtpvKHF5s7iMjF6yhk8PV2/RWw2McxIi4ArW
         XVzKFe1AwrK3DyddKJUp/79YvBPchxxv8JCVEPxNx1A9N75dndpzf9XkdS7mlPAXwZbZ
         p2odyKtWO/BWQKWlQfejB76xhrLrd8qi3Xy5fKMtrdi44PLW55GG/UM1DyKx1WVP7FVw
         qGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766836528; x=1767441328;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJeQXvYoWAeKu9JVArWuPu5BhUo3ui9wPKj5cztNZBU=;
        b=hMHqZLmTr39HAM6Om0OgqxmH6pZbLspZMv91aeNQ/i9CyA6Brmkq+Q4uaBQQ5hZrqo
         SYEUr+w+8Kxlnn9ZvGrWzsMz97gIRt1DdFgIL9ze6mNQ8cs4MdE4fNOqdqxGlJ8IUxkc
         LzEcJami6ZmFLvNcG9DYf4MrYUufshxLQIERrAfFhOVgGyULXmCSVDcRyePTtxcRYU1x
         ew/dcbog/bi6qL5sHEX7POcm0krtwqh1GAydSNN/EAlBFM38OWFsbdBVoDEwtw+h93hT
         8FAXTVrrc7I0Xzfj9QeEXxmllO/Q+T7x1XPMrIgIhbYULBEZLR2ug8Xi4ucghdpn+07O
         +e4g==
X-Gm-Message-State: AOJu0YwdMYntciB+waBqhV4PA7gPpOMPbrK69pvNsXho8ibdXR7b9NGi
	7MT43Pzo/OsYf2m1uywKez/OBqsX5wf+nIiRo+DNBEzBDm111OwDqZqoP4Y9OsHQ3FIqxzaTDx/
	NCjN6fO2H3H0Ar4Q+3WKVkU+KFclANK9aM/L+A3Du9Q==
X-Gm-Gg: AY/fxX4/YqccAhezfLtE6dVhidDAcPI1BlULM1ST8kELN5cKHrwHY/OiHzeYe6neFGL
	8gnau1koGuXWQUroqEKKwFpFlPhnCtOgTp2os9iZNo5lT3d0WGAQcVi4kME/7wnjtmCz5h/DMWD
	GOxPyj+6PsVR1+03MFcaITTW6xiYV28GGEnEZip2Ajmrxx6F73GOHo3CfdhbrBxyODU9nC2trhE
	tWdKSC/gCA5Ny7e519pAuUom7Uym7FUthLPFWeVQdc33RfqY3Pzpc+FJv3lsX2BbFsaIF4u
X-Google-Smtp-Source: AGHT+IHrlJrVYU+4b1bR+WgsNK/PBRp15GIsACGoilKbM58a50q/f2A9lL1wx3RIhuwgPYBSHNWSGDNS9wODQ+j9Uz4=
X-Received: by 2002:a05:6102:e0d:b0:5dd:b32c:66f7 with SMTP id
 ada2fe7eead31-5eb1a656de4mr7067419137.13.1766836528614; Sat, 27 Dec 2025
 03:55:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: zh yon <liumtv@gmail.com>
Date: Sat, 27 Dec 2025 19:55:17 +0800
X-Gm-Features: AQt7F2rfIIYEyiRAtDqvPgut_YSuxXN0wNVf9bDtbT03z6sBmAj10Y1Y1N6pMt4
Message-ID: <CAB1xeK6-p35gU9kHL97cP6wCSKXTPr9O_PNJZnpwC60f0GqXJg@mail.gmail.com>
Subject: hello
To: linux-embedded@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

subscribe linux-embedded
