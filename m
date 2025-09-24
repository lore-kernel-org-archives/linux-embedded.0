Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891C30C342
	for <linux-embedded@vger.kernel.org>; Wed, 24 Sep 2025 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726839; cv=none; b=Kw6dJ5brkd5HVVgD/30zx5VWo3CrHtgG1b+5e3fKIfvpHqq28G1JIrFK/T7FFUZI7otI7nT3DBq1aVTD2o21LgZMocDAjiIYc6ZSfhHpLOPQ2ioMA0tmdN5sY0IarunzFe2Ozso0u7k36ocyO+j6fvhRvHj934ousbNiGNDbZ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726839; c=relaxed/simple;
	bh=2zssR5zXvMdhgJUBqLraCSKGzS0gUhLhulG+Algaw58=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WfC8t5KIWUM9TDHiiSWc8kvMGJQBixr5jS6TBmm4kJ6gKQBbXzdwMcDcyXznKBUyINcP4C7G+X5riu55T6i7c7Sjv9hgHjHkKFiPkBuIK6myJrrjWi1NTWbgUHcXtVLoHiI2pwICghFyrEBevRi+XOojfiY5xpKnT5ZmOQAhf9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=GOWTrA0i; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="GOWTrA0i"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3194020e86so242354866b.1
        for <linux-embedded@vger.kernel.org>; Wed, 24 Sep 2025 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1758726836; x=1759331636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1U5j8T+Vn8Q7+asraZxuM6IFhu3pbhEV2SRGwjQHSqo=;
        b=GOWTrA0iVBAyi52wUJM0mDTzeRMPDAjgtMu5szuUDtT/eDhFefOTP6wHrausid1CfE
         5dNsdPJ85Z12gkwEAVbaXfzKMfmkjNkv7XSj1L6xT7XITndUrR8VrbilDhkLgA+PRYlN
         at9KRxDpPjCu4qpCf4F6hli8qWjFpORayEsqozgnMHsIsjo3Jc/m5WRtHvfVltO6scN/
         7LDICeVARGg4hAlrKhZkZgAv6jmTyRdyL6cIWy4ACxst9a92OKpFvm//VOLFBFZnwlRD
         kTc+cNhemLUxl3zo/GS648ljROAyRmvunPgtx0OEbVRtM6ud6PBOt74Ab98X28AIhFbG
         D3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726836; x=1759331636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1U5j8T+Vn8Q7+asraZxuM6IFhu3pbhEV2SRGwjQHSqo=;
        b=bPt6PTYcALX0BKs5Q7bPCUPKV0dHipSfjX9EeQ263wXHZQPCDJvTMr4dcMDkzTLQHc
         YhP47w0kv3mrVyhI9zsV0Wi4ODe/DKC48IUrimzl43hQvECpwFlKOAGkeRXTszDFYk5u
         CbzjBiVSWLTB1cwkNdNNtei/aoJzsoBAOrNfz+T3IvVmEAoHN2EsJFHPywvxTN7IEBYf
         90DFchOGHTCheYdsC2VYtVwX+M0iowzg1c+JGT47vYpRGDUjEtnDU/B+1DDsmB2xRxSK
         7+jPvhjevUL2rnO38N2BuFu85W6ftnwEYv/XCwd0TO6x8U1kiSUqNoVCdqblL9nMNP7p
         SHeA==
X-Forwarded-Encrypted: i=1; AJvYcCWLEf7LCP1J30D/wYAUMSGQxAnoi7dpED4iFOG/z3u/3O9W1J9VJUMyQBCSlXKeC9a1FhY04oxvdNHxv/D9eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmIdwx3mDo0q2ZM37rSf0HdGuOFs5zEih7CWv8iV2QdKspZqVn
	mHItUteqrKSVI4zOxhdPtGTutyecmLIxx0cyfdU/CgVm3fUyUnUoRJXHEr9Xajz4bYebL48Je+y
	oUEA5UU8=
X-Gm-Gg: ASbGncu1vYL8bB4JYDgEZyXYtjoxsx6r0ufqc0chpAFsT3DD7Duhx/rwwZB72skeNID
	d42E/IkXkMHPlLjxBMGoF7mj8mM/Hcx0Q/l94YZRI9gsQP7+DPphCvmFrJry8AjLtRb3WL6E0/y
	/be/CwOLtyvFCup0DuFAbbuPWGRenpOV4HfHt+EQOxES8tTJT1OucCsgHIuUQV7K/52DrVlQUPw
	gzaIxPfx8+h2HDB55PV9T6UY7odBIeGQoubCbseLWH1xrHuYlSFF4sPJ5kXyN7YEv4hIpP9GnWF
	oFkrrMRrqHKElbfAcAG97E40tss9yNEBssAf25tsjCTNGlsQTWkmMvLh6Kwdvw5kGMuUPwdnaKR
	3pRFtz8e4W+gA73oMf7OlK6pnlJZC2R2xZO65aRFEXTDbvTw+AlavmqUNZzqfVeXMWB1wbZdHW0
	VIfdYTmHG/pn0zmIHSQK5QdvU/vd1DciFqZXw=
X-Google-Smtp-Source: AGHT+IFBh4WXxD70ttysu7AiMohQiNTx3KzsFPfLwiiNMkN1KCGq49XsGAWG9JCO+U16AKh93EIqZg==
X-Received: by 2002:a17:907:96a2:b0:b30:e783:9867 with SMTP id a640c23a62f3a-b34bd62cd3fmr16836766b.62.1758726836178;
        Wed, 24 Sep 2025 08:13:56 -0700 (PDT)
Received: from [192.168.0.235] (cpc145676-lewi19-2-0-cust696.2-4.cable.virginm.net. [82.0.238.185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2928cd31a6sm962396366b.102.2025.09.24.08.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 08:13:55 -0700 (PDT)
Message-ID: <f2a464d9-168f-45ee-8e8d-83918c02339c@thegoodpenguin.co.uk>
Date: Wed, 24 Sep 2025 16:13:54 +0100
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PREVIEW RFC 5/6] base: bootcache: Add bootcache memory
 backend
To: Dan Scally <dan.scally@ideasonboard.com>, linux-embedded@vger.kernel.org
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
 <20250923-bootcache-v1-5-4f86fdc38b4e@thegoodpenguin.co.uk>
 <362096ec-c5eb-4fe9-8b26-6b280306e0d7@ideasonboard.com>
Content-Language: en-US
From: Andrea Campanella <acampanella@thegoodpenguin.co.uk>
In-Reply-To: <362096ec-c5eb-4fe9-8b26-6b280306e0d7@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/25 15:42, Dan Scally wrote:
> Hi Andrea
>
> On 23/09/2025 15:23, acampanella-thegoodpenguin wrote:
>> From: Marc Kelly <mkelly@thegoodpenguin.co.uk>
>>
>> bootcache_backend_memory provides a simple memory based backend that can
>> inject data found stored in a reserved-memory block into the bootcache
>> framework.
>
> This looks really cool and I'd like to give it a go; how are you 
> testing it currently? Do you have a tool to create the blob that 
> you're putting into the reserved memory that I could take a look at?
>
> Thanks
> Dan
>
>

Hello Dan,


I'm glad you are finding it interesting!

We are in the process of cleaning up the demo for public use, we are 
using qemuarm64 to test it, we should be releasing the test setup soon!


