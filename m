Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2528317A5BE
	for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 23:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758670711; cv=none; b=uDB4ZbtstqI4Jd3VVn683bpHLAQ2wJfrjt57Xljt50v4xtvg++F7CY3t3BGrkKYCIRA2yor23PxANhSwQPxt/O1veqqmj33fkCMcP116BArDXPUrhlH+WFtkg/AYG4/L50pEdQ1AQBW6Uzs0mU/vrJyF4qli/L28P4HwRrbXI+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758670711; c=relaxed/simple;
	bh=/3WcKn80XXf6nan1lCaLIbylKt6HJQw68rJepU86uT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/cHc/cHda/13Mu4FKzwbRJYAZDgeO3UIAai1RHdz8ZAsT+wON4QlG48Qiqk9t+GQ4BA57+O9Pz1cPDtrBP5xcg60w0hIFS5xUffGQbvO0KyeIqjyOJQXRQ7LfME2cfJeK5D3LzQXB9x4TDpXVr+9S3HF7cOMVaTlYgxapoCqIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cjlrYfyY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cjlrYfyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758670709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/uuMM0xLOGxLfbxqniNIAdFMc7QKfBFng3gt4+uLkoQ=;
	b=cjlrYfyYM+O3RLc5qiaylKqn12uzphp6xJuIjbyMNzrt42r0F1JrrKaj/uyyLitzyFCn85
	CySxf3OUXSswu0DN1Ve/4cqllRw9GILAqGJV4FCatwikBdOAYoTmBVU+NhwVXS1VIUwzPv
	aVON2jC/6xHX6uDdb39wThn0cC4G988=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-KJ_OEXnJOWm4wZe6RC2wQg-1; Tue, 23 Sep 2025 19:38:27 -0400
X-MC-Unique: KJ_OEXnJOWm4wZe6RC2wQg-1
X-Mimecast-MFC-AGG-ID: KJ_OEXnJOWm4wZe6RC2wQg_1758670706
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-afcb72a8816so298990666b.0
        for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 16:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758670706; x=1759275506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uuMM0xLOGxLfbxqniNIAdFMc7QKfBFng3gt4+uLkoQ=;
        b=NVEx2GpHBZolj/BQts+vLw7AkKT/thLOUXv+I1YtMdkuYDSQtgruL2wl/LFKbdoJUE
         lRHDMIV6pb0DbQqLfiA2GLHjANgatWGNITVhBfy2UAtvzo+QNIzQYzAF9bv7fee4GxbK
         qog1nNV8b89mkhDw9uwU2rOknjWquRNqLnQhOfnLmTg+W2Ph2JsNYt/U5/nGdue4e+18
         OhFQnVNr2ObAAUea5+cDYo/SPHcC3ytLiq9ydikj8ns1ezgPpgGXdZfj9zHBehXPdq2L
         cZWCqXn8gglFfTP5Yca7MUqeYWEWlbq95LJjddO+Tm8xoBBOzeLtK2m3v5CR9ttlWTqd
         T4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIND9f0ivi9C9Ej3B2ovueDp6MtCK0pbNFYfMvXQP9g9WsyUHOKs0M2iJxEM6oUlLJ7W/S0d9pD+BWYeOt0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZIythQ5NXfCe+p6Gld6dmfMd3HlAb9InVSIRdt+bjblI0mBYK
	JzQW5tbZju++S5tGk2xRDNzlumfAB/dAjCZBfgAeShaRVz+NDy/oUKPioBI+N5GkMVfQfJRUa7t
	rnWsC12IaZu1I5gqV3zQHTUp0KFgP++uv/4p4LOdpHjV5PDmg5w8CMVFxxwRgMiQGXuEo8zWsPQ
	ujR4yL8loiXieCvTQG6JgaTNAYM05Wczn3c2zDlJR1kwQ=
X-Gm-Gg: ASbGncscndYOdg4ICivi5+r3w3YabWhPR+lt99d2aEXGVir1fREXg9tbTkFmOGQY3+7
	gPVpLtx/SrmlB5AxNK+xfDgLc14z6sIaltEwMQYLMJ+VZqQ/vDzcleOHaDUZGw3g33oKtGGNzxD
	Bud5SkuK3sxO5ozjQXeFWGmlS9p4xW8Mq6ihjgEySUHE0DGwpt43C8
X-Received: by 2002:a17:907:1c19:b0:b07:c1df:875 with SMTP id a640c23a62f3a-b302c2033d3mr406667066b.56.1758670706346;
        Tue, 23 Sep 2025 16:38:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk3/1I4PXZi4R6ovX6yX2UPx6dYXxY3NvIilMqDU3auk9daLMwCgXTETaUDFSLe0sWzQlfr5kzWopjCBID8PU=
X-Received: by 2002:a17:907:1c19:b0:b07:c1df:875 with SMTP id
 a640c23a62f3a-b302c2033d3mr406665766b.56.1758670705938; Tue, 23 Sep 2025
 16:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2a353817-f1da-4e7c-8b2c-0853779ec054@datenfreihafen.org> <j5dtkmnu55ycmqpaseazots7mevqyt5lafclvguxj6oz5r5cts@n563dsnvwuu7>
In-Reply-To: <j5dtkmnu55ycmqpaseazots7mevqyt5lafclvguxj6oz5r5cts@n563dsnvwuu7>
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 19:38:14 -0400
X-Gm-Features: AS18NWCDhXJt3fjtOycAWKBORuZpc7nsvPw6Hg7_H0HrU-XDN_ZZxWC4VIjhYMM
Message-ID: <CABx5tq+U_hcmxXDCGpTawsu5C0bDknC=p1Rq3FrtVuJq9gj2Pw@mail.gmail.com>
Subject: Re: Call for Participation: Embedded & IoT micro-conference at Linux
 Plumbers 2025
To: Sebastian Reichel <sre@kernel.org>
Cc: Stefan Schmidt <stefan@datenfreihafen.org>, Jan Lubbe <jlu@pengutronix.de>, 
	stefan.schmidt@linaro.org, linux-embedded@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, RD Babiera <rdbabiera@google.com>, 
	Amit Sunil Dhamne <amitsd@google.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Tue, Sep 23, 2025 at 7:03=E2=80=AFPM Sebastian Reichel <sre@kernel.org> =
wrote:
> I would like to present / discuss fusb302 (or other chips handled via
> the TCPM framework) using boards that are mainly powered via USB-C and
> not having any backup power source. This kind of setup is often found
> on Rockchip boards (e.g. Libre Computer ROC-RK3399-PC, Radxa ROCK 5B
> or ArmSoM Sige 5) and quite a pain, because a hard-reset effectively
> kills the board power.
>
> I would present the problem(s), what I've done so far to get it working
> to some degree with the upstream kernel and then discuss how to improve
> the situation.
>
> I think to become a worthwhile discussion the session would need some
> people that know the USB-PD specification and kernel subsystem, such as:
>
>  * Heikki Krogerus (USB-C maintainer)
>  * Greg Kroah-Hartman (USB maintainer)
>  * RD Babiera or Amit Sunil Dhamne (Google is actively working on
>    ensuring TCPM code being compatible with the USB-PD specification
>    and they were unhappy about some of my changes :))
>
> P.S.: I'm not sure how the CfP for the LPC micro-conferences works.
> Please tell me if this mail is not good enough and I need to insert
> something into some system.

You need to submit a proposal to
https://lpc.events/event/19/abstracts/. You'll have to create an
account, and there will be a "Submit new abstract" button at the
bottom right of the page.

I went through the process for a talk that I submitted: "Fixing Clock
Tree Propagation in the Common Clk Framework". It's related to this
work:
https://lore.kernel.org/linux-clk/20250923-clk-tests-docs-v4-0-9205cb3d3cba=
@redhat.com/T/

Brian

