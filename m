Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1921CAA75
	for <linux-embedded@vger.kernel.org>; Thu, 23 Jan 2025 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629130; cv=none; b=MwrLislwit+yC0k7LvrmNGkztOm8u1la26EOkdrJiPEYaJR+tXCz7Yh0x5QsDD8gfZxZj/lurWg1KvwaUA3r8LC2tmw35OWKUkqF2cijj1hi6nF2wzNp4yPE0BlVieptowLMs+pSLqyJIZdzmEL/xs/O1Ojb3EkuQYuz4W/33Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629130; c=relaxed/simple;
	bh=ykGDmvHa12R88tbrJdAyhrEQz3Yf2DI753xm7aOPVFw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mzyHQLVdOXw4Q4Ey9MVbMDXgOQbZ6zUpvlJCviYXt3ay41e16CCB5l5OSZw2PGlWFOtM5Cels5uC08AapzPuYQqJHHXOnzcA7qjT45ucO73y9N3Bw+FZBYmxC3kflyXx6HEoFFEBcUKi/gHkQXOXhSthljSmb0d85pRGyVRaO54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wm8Omooe; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wm8Omooe"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2a0206590a7so491765fac.0
        for <linux-embedded@vger.kernel.org>; Thu, 23 Jan 2025 02:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737629128; x=1738233928; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifd6mi47OK6gDsjL1zCEyC0vqkyIWtbLqL7+dCRIoGQ=;
        b=Wm8Omooe//Rj+/7emAivc09zKhYN9qacIPNHFmFzMzDZzynJrAbWTw18ZIhXIzx/TH
         e67DFH7YHlgEiJMCstJb12ocKDnD3FF9ecVNg1CczPwap0mUMe/Zg4gj9svgA87kaoJC
         nBHStS6ebVnKgyY5E1/pQ5Zao4+YzI99YnKNfubmJZGvP9jCV3eJIxtlKZWQ47mtCgyC
         H1G3Jk0JMSqd/YIjIF9cs0E1WZRpVuKOK4rth9hJ6HCKTHQWadp7SsYy0R1QPsl/nJtV
         Xe66adgtsLyXxtdplKJ9JpO2aKq10L/2t7Rx8AnAm4jhpd2BlyWAsUfN+5FWBLWLSvpK
         W4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737629128; x=1738233928;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ifd6mi47OK6gDsjL1zCEyC0vqkyIWtbLqL7+dCRIoGQ=;
        b=qn/QQtBccgUknUzCi7FoyHu193vFiXMcK104Jbqv/+bzeoHcDOnN8mq/eVfbP9+xXe
         3V+q0MyG+NLiwYgLDPYlbD6xImAK1nty6GbEAYDbQ5PCWnUs3T0o8avwayh2SCdeKvC0
         qbGGqPZsNHrIzJnQVc3adO7Wvh1VvtnHlbx/QRKCvf4OHweiIp9Ou3REanDQeeqvwuN6
         tEavXkJPdv3zLa1YFh2ideJ6jEcsgaor2xHgi46GM/meBEEG3O1x+P9M136H+c8Xt+EY
         8t3MY0dJmnOGbgNvv0OhLujEGbBT8R9UXAQH4URwKE7lwFotEmQ3lg5PGpJyObsl2ABv
         nTtA==
X-Gm-Message-State: AOJu0YyT1Ch8sD8v47xvATPiQ/iXV7NlUJzF3McPgQtua0Q+35Rf2IXi
	EF23MagI2y0IBNp2vdE18I42TKNoTS36Zreb+WUwM96gTa8Pt1UDVy1ptslCFl6Np0OzTKnmmBk
	b3mTwl5LzEghl9s9Ia/dJbSUov92VLsi6pF0=
X-Gm-Gg: ASbGncs94tm7JZa4M/93TwtnJQkBvxjbvf1h8qRmB5rCVLGaZA5r8C6oJOOKuuB8l3i
	bwqpk4RRvujlbBlxgWH4w6OtswhMjlJhse1XeYuyYUc3P7xQstyHEp2G6gIYL
X-Google-Smtp-Source: AGHT+IHZ46dqRnqAReAr93NtMORyJKIwp+9SaP2jydZOJ7KfIeC8wozB9JW/rmaifOmxIZvON4wyJ7ZbFnOy2Tilep8=
X-Received: by 2002:a05:6871:a50c:b0:284:ff51:58ad with SMTP id
 586e51a60fabf-2b1c0b0f676mr15785056fac.27.1737629128091; Thu, 23 Jan 2025
 02:45:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pradeep Roy Kandru <pradeeproy.kandru@gmail.com>
Date: Thu, 23 Jan 2025 16:15:17 +0530
X-Gm-Features: AWEUYZke6HD2GMSgoyh18jKhdztBGpMjhU8uAkc6SK1VkcRnHcgjaqIOtrPVRWE
Message-ID: <CACZigM02tQ_1F9=q1nPM+r_YM+bpyemgWhP0T0E=GZ8LQECVww@mail.gmail.com>
Subject: Request for engaging in discussions about Linux boot time
To: linux-embedded@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Tim,

I hope you=E2=80=99re doing well.

I am Pradeep Roy from Hyderabad, India, with over 13 years of
experience majoring in Linux Kernel. I am writing to kindly request
your consideration to add me to the Linux Boot Time group you
mentioned in your LinkedIn post earlier. I am very eager to contribute
to and learn from the discussions within the group, as this aligns
closely with my interests and expertise.

I had sent you a message on LinkedIn in the inbox at the time of your
announcement and have been waiting for an opportunity to join.  I
understand it might have been overlooked, so I=E2=80=99m following up via
email to ensure my request is considered.

Looking forward to hearing from you and contributing to the group=E2=80=99s
activities. Thank you for your time and consideration!


Warm Regards,linux-embedded@vger.kernel.org
Pradeep Roy,
www.linkedin.com/in/pradeeproyk
