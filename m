Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD36D395AC7
	for <linux-embedded@vger.kernel.org>; Tue,  2 Jun 2026 05:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780379588; cv=pass; b=WT4mrHzyOEzNpNnLQiqT4ELyVAM6kg8AG0Rn0kFjOAepvpjEjkz0JRh7LEOrKmYNZsYykpmWlfDSDUZcz3Ze4x6MSKFHCLYjkbn16fqvRWIMbAreJVanR7jS2YiFJTyTzQ5RyVSRSvKzdkM9RulMhC6yLG5Vv27FxRjm4KNRm5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780379588; c=relaxed/simple;
	bh=e6gLaW70u4tMtGSt9/qKTEqqXsbVT06tWFkbEz2Cldc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVKNL24vCC74ZSHKG07fyRf1gU9MHAOzY5vihXmbBoRFniYAIrZzS7t+LTDyyuSkSyF+g8hYcZzPjasf0IgNCmob0kWzN//6r9GcNmLdp+qjcLKWbBdW3EMHBn5005qfq+W5+RDEezFs+bPdP3DibJXnlq8miIOecpChZKhNd7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+Dg49Ag; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+Dg49Ag"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7dc93d02916so49250447b3.3
        for <linux-embedded@vger.kernel.org>; Mon, 01 Jun 2026 22:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780379587; cv=none;
        d=google.com; s=arc-20240605;
        b=crJjOlVPUTHszAUC0sXxhtGCrcYwc58mkhOV0ewhV8L7E0WoR5vuuozkG7YMO9UE6C
         uKHIeISvExHHuZWHRdK2hbXn6Kkzuvl1vdJrQjA9GD8wu6qLSNBGTe7h1pcRiPZTP4Xi
         Snx+SqcfIxrOMYVwgPMtiRGCZ40tpaYD2MyW52aQ1YOsg6MhqYAwhXZESGSMir+cCxuX
         jVIPPMdhyCJvPlmhokH8/P5PcHAgOEuhJgysi84u/kfRw/CGrDDRdhjiegvSsqK6KXI+
         h3LkJz7zh/DWE0rdS4w9eW4OhcTKylff5/HcKBsL7CAwt6W2ofPB1Pm/ZNnDci9eeNRm
         1G2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e6gLaW70u4tMtGSt9/qKTEqqXsbVT06tWFkbEz2Cldc=;
        fh=CK7eO2FbhpLt4ykX55do51BP2K8Y1CKxF/zNLe0zgo4=;
        b=jdfi4zNev33D8149LF/7hr5kobcUi1Ckf8wAy0JUg0N44teJ9uArG433YXLgo3SO4c
         bTjSD4/E8tMfAFHcBIv/sokO9hsXPpGOJvb3yGmeHqJ+WESAjGBcHhVE3+ND0ux7yoUJ
         DiHZPXYgxW1zvhZAGbOkpECoVvK8nQQa4hyuvM2+RRwD9EN2i3p4bGBUj7Cd+hLCuINc
         8jJt8HG2y+Meii1DNBdAj3yn3jinnRqsovZ2Dbo14marZOUaAakMN65OlXnu3fkq+9ak
         f5s0IwVJWp5Merqg3Mh5LekKdJARbHakSSrlsU0L/s+GPqgglwo7BjCE+Y7nLrj5rEk7
         Ycjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780379587; x=1780984387; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e6gLaW70u4tMtGSt9/qKTEqqXsbVT06tWFkbEz2Cldc=;
        b=o+Dg49AgctJCvUExVEZIyLr+VHy8prNBBTnaWjTVyNp0r8iFlsbzJy2X/E5yVyIsHL
         di0paNgI34kyCYw7eRJKJFIoU5qDPLhIJ5VwP1+6uUu8YYHF02xOaH/CLsCZNtbHskW9
         vaPDYnWHwXX26RNVCnSkdBjhzf3q1hGOhZEzyIvMbTZvyzX8ghWxRPmMcEjNboAxKKVi
         IKIGYn/fZ4ro9BdtR3VIV2HZuQ5lTCQSOcaU5SgJ6MiNYdSJ/fBVj34bN4QXrPxuM9o+
         Aa4q6Ga2xib5NqbKhtXFV+QpOC/QO8ffVBjJKGuK4H1KZly4vA95pSWztQ1FseGHHBKy
         zuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780379587; x=1780984387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6gLaW70u4tMtGSt9/qKTEqqXsbVT06tWFkbEz2Cldc=;
        b=TMLLhDZkkSoGLHvjlRcdac4pB5kGLinXYgxXzz6BwRyk5v635T5nYG/Mg3khI7My2p
         6tAdwpCojJioThu9XPWBxM8xP8rvGN5okA5EHHTmmhtpWfrpLYdl5np743SAoAhuJSC7
         TWPCIJDoXqIBVZ7nouxKDRY/FNA2eWGQ6utbymEGvfIMbyGO0HvNiszHXhyt1dlUpyr3
         zh7a4UIVqr0FiD+vSZyR/CRDTF4kk/Oet5COh3Ry9LzLh2RsANmbiW4nlbP1Fqa/CdO6
         wFCCFYxgg0KlYWaq+ed0YzW3H4SOrYGS25+aToxzC85KHicudF79vA5jTtC5PaI58zem
         ryBw==
X-Forwarded-Encrypted: i=1; AFNElJ/Hs1lWCVTmWDWRLUSmnEGAMI19AHxkPnBT7FjmcZtgbC4qce5sXmDrcBxoNJw765RmasYbZz9t9VRTIbCFGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhON/Z8ziEyWLYlEuq951naeFmaZkRuo36jBXhi4q5b8V4ad04
	g+jPRv3TrQXOAV2ruMMDQqj4c435e/TpJsLlZDZ+d901CtmdQLooLRGlNqIUiH0W4ozdBC3WKbF
	LyVasjECXUp3ly/RaJYQLB4wFd+s3eA==
X-Gm-Gg: Acq92OHYIBFGhFjJw0hdf+XVvu6nIO1WcigyRJDIDPwOmdVv8LYxPOr3eoQXYtPS9xB
	xgof09ThQI5xxPJuiKZbi0m88vuvTpjgRBE1/fX+nJyAb4WVJjxJcPHe+iRindf8ywO+whjvHMH
	rt+QQybtFku2qV+y1i1offTGnkc6NyRB0v4tvhIHtnjknEAczaSfLmWHJOD8kamBaQp4rvadrRC
	K1ARE/PSqTrg1Yqw9qmRT/kUzKPD3nCaYsjVTPaeCgbb/lb+mknyWkT4ctIJgM26JXWrsEdOG7I
	fI2XD5qZ40oIYr+7B3pXYEXSgC61zfENBFtqsBNBR/Yps9SncOI6Qg7hqbSaMsqjLWk+01sDLGH
	N3nrNAYy0gw50cZ/e5CsnLJglmWWb
X-Received: by 2002:a05:690c:3583:b0:7dc:aa85:5c67 with SMTP id
 00721157ae682-7e059cb3073mr138617117b3.11.1780379586688; Mon, 01 Jun 2026
 22:53:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f35774f8-4194-4715-8321-dc2fdfc7fc88@landley.net>
 <MW5PR13MB5632F0D9C8E8A12F2C24B64AFD012@MW5PR13MB5632.namprd13.prod.outlook.com>
 <81e4aefd-f052-4a52-94b5-36030b26c358@landley.net> <MW5PR13MB5632FDD1833ABA105437D02AFD162@MW5PR13MB5632.namprd13.prod.outlook.com>
 <9e3f48db-c827-4892-8e41-656e9c60ff89@landley.net>
In-Reply-To: <9e3f48db-c827-4892-8e41-656e9c60ff89@landley.net>
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Tue, 2 Jun 2026 07:52:29 +0200
X-Gm-Features: AVHnY4JbPiMEEHnTHhED-wVM6-DKOLiXRUmk3ySZZlmh8NnQmz7X91r3eu61LvE
Message-ID: <CAJGKYO4Gbq7OAyS-73aMghSx+=j67mGzU-_KXCQHT3=7HJGEwA@mail.gmail.com>
Subject: Re: mkroot quickstart (was RE: Testing on lots of architecture
 targets with mkroot.)
To: Rob Landley <rob@landley.net>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 May 2026 at 23:58, Rob Landley <rob@landley.net> wrote:
>

>
> In theory the toybox list, although that's in the process of migrating
> from dreamhost to osuosl because

osuosl is the same host busybox is using (not a question, a statement)


> Your absolute minimum is rdinit=/bin/sh or similar, but the mkroot init
> is trying to do the minimum work to bring up a usable environment with
> mount points and networking before running the $HANDOFF program.

from a PoV of the kernel it matters the /init timestamp

from a PoV of the kernel what precedes t=0 is unknown / uncertain

from a PoV of the real-world observer what precede kernel t=0 matters
and /init timestamp depends by the hardware and the kernel
version/config

IMHO, the minimum boot time is a question as well-defined as: what
"boot" means and where?


Best regards, R-
