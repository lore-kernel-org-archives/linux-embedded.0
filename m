Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78387255F27
	for <linux-embedded@vger.kernel.org>; Tue, 30 Sep 2025 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759220666; cv=none; b=lgNrIUxp61WZhqkFsDzeq5J0v0ARMLOTKSo0mWYnhuzZQh/6v+3R8E8hU0nzmRBx4bniEE3oANo9TbfMrNY0wBtSsP/6i+prO/vRevr5QjI6cYrecv56Bn592+cVqdkMsoYKCFmCZTCis1lQAfmLrjxfc8dEupv08KqlGVZLSgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759220666; c=relaxed/simple;
	bh=GH1MQvPFGZfwPBW5gneLeuSuaa9nNXGjJ2Ejk5aaFpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fuXordyqCGMGKW8PIIl/lW7FAdnWiBmaHOCxGcSv586JYTiOfYnLdlfNprM8JELfBJWg+cmPDMEHyie0QGiJoCFenquvuBayu0I+cvKTYLmCRZFh01It00HZ+XQAyaZseluwO9z+fGaxZt1fufpY8/TGcGMgOSPB6xXPTsKcW3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=cfxqNxiK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="cfxqNxiK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so47219405e9.0
        for <linux-embedded@vger.kernel.org>; Tue, 30 Sep 2025 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1759220663; x=1759825463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8sbwG/rQ5YPvRJMHfRmw3O+X88CG2G2dosjVpyqJrOM=;
        b=cfxqNxiKSxmio+XggxwMUGUfOF05AN/RC7W8T+9xBcYlUorxFqgeURl7IXiH4cSfis
         hf3m1HCiCTHJ1KhBX3LDYA9shhEj5L+zLln3wDE1mZZ3+QZCZKbPM6wtBjuYkEB8+4ZE
         5RzAPsGbJ3ZSZ6h33NsvMFfDj1yWRFzysKphJgx+tj+GzQoCulrce3hfiDpSI/rHa7p0
         9E/NK+5a6FcXGBurQh87NBaVW/yWcmhNWwG3EaJ6JgDb4w+fGxQUcG73ujKpi6DXtiHZ
         gJliN/FiB2pPzo5B1fSGm6QCNQXZOjrZfs75qPWM2oYvUtbn2Mcvhdu8UIARfocsR+JG
         ESOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220663; x=1759825463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8sbwG/rQ5YPvRJMHfRmw3O+X88CG2G2dosjVpyqJrOM=;
        b=uWz2PkHcIhF0yE3rgdZERPvcF9DEsG3A1XHeSQVfomVup4IlyulR7WSi9/h95pyqDG
         cLfkwIFV5zM3zDjSOHhu/jacy5FphrPIl9+9Pl7EU46dNBfb9ipkFECTA/GEEamUl6Zv
         kITsJyVCWu3nwzYhqAGdHz+wmE/HU6zWQCqYf95G5Ok3WpD+mnApmwOppF3n6O1/gdgJ
         w2AsVdWC5sWoX2HG1o5qZRGXISj16FwV+5BFIuEW0WkWwG/efi+8Lbw1l8ogOvUGS2q2
         4SbpZ4XAvGgT7uy2OIiWn06INB3h+UwG8GCVQeNbzm9snfbuTpKrgpoOabg9IBU4+Hnp
         uRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5spIcUc5GnRdKWz93084wU5mKGuqmuihgdvGJcWURrynYFCXqsCGWsM9NLUIe+gbQ7fRnV861ctK72vsLaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5p25GIoDrXcqQH71NceQcM4EB2eHYGuayPCQiloW0FuADXwaG
	oSNZoEL7WJU9ZDe8+awUNo13OYVDSmUmKOJgkSD4S8shP1RpHFJp+Gc8Soq0IwsXQhI=
X-Gm-Gg: ASbGnctnD6tWknUO7VHxj2K7tH/KcyiY5erU6125JUlOAY/3BlsKsw57vKkRTQttJ3O
	FHwYmJ28szt7/p99JL4bFCoOO2dewn5DMRf6HcujUpRXHsDzzmcS0JxCNqXDV7dX28+moHyLVVf
	lJHiYI9WnjwucJXCZ6dFJmdpGZ8/6vX4qxfpGrUWkTYY8ptVHiKC3Rq1a2JpmCr/PHysJGqsw9i
	ujcYtVBO6h5scRYBCW0B23erEy6umUX0/+JgbcrBSi6VKhlV9xrId3hoEG5Z7SCbRdLl1vzDzSS
	JiHcLWUDntOw/gwaH3+t8dOpjznBgdJCwR43lkczxidAY/85zCxcd3XbXe7ObBMzSP9WHXqh3OC
	zNvFfxbIteKPvREg5hNtWKcJWVsVLEQHD27ydwEDHzJ5r7/pplzfOXg6PCM0wh4FKoau5fUCx8T
	3FBkDFwx9hr7jMwlaq1Rm6dSVddmr5ZyFE+N4c0tIkj/vl9XnkUmJMFky+LBY=
X-Google-Smtp-Source: AGHT+IHTsZxFkijjKO+nSCvFsAKImIz6R1ZhtFxc2T9k81vvmDkkQE1aOB+kBIUXo8NjhbN3QUCEDg==
X-Received: by 2002:a05:6000:2910:b0:3ee:1296:d9e6 with SMTP id ffacd0b85a97d-40e4a70cd17mr18066160f8f.61.1759220662578;
        Tue, 30 Sep 2025 01:24:22 -0700 (PDT)
Received: from [192.168.0.235] (cpc145676-lewi19-2-0-cust696.2-4.cable.virginm.net. [82.0.238.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5603161sm21967608f8f.35.2025.09.30.01.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 01:24:22 -0700 (PDT)
Message-ID: <5241142d-3869-4def-af06-e7b9b76e60e0@thegoodpenguin.co.uk>
Date: Tue, 30 Sep 2025 09:24:21 +0100
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PREVIEW RFC 1/6] base: bootcache: initial commit
To: "Bird, Tim" <Tim.Bird@sony.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
 <20250923-bootcache-v1-1-4f86fdc38b4e@thegoodpenguin.co.uk>
 <MW5PR13MB5632F23BDCA56EBFF25B5837FD1BA@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Language: en-US
From: Andrea Campanella <acampanella@thegoodpenguin.co.uk>
In-Reply-To: <MW5PR13MB5632F23BDCA56EBFF25B5837FD1BA@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/30/25 00:38, Bird, Tim wrote:
>
>
> This seems redundant given we're in a #else /* !CONFIG_BOOTCACHE */ conditional section
> How could IS_ENABLED() return true?  (did I miss an #endif somewhere?)
>
>> +		return bootcache_get(name, out_val, &len);
>> +	else
>> +		return -ENOENT;
> Come to think of it, why are these specialized calls in a !CONFIG_BOOTCACHE conditional section?
> If the base call 'bootcache_get' is already conditional, and turns into a 'return -ENOENT', then
> this call (bootcache_get_u16()), will turn into 'return -ENOENT' also, which will cause the whole
> call chain to evaporate at the callsite (due to the conditional there on '==0')
>
> I'm not sure any of these specialized calls need to be in conditional sections - just the base
> ones.
>
Hi Tim,

Thanks for your feedback, good spot on that conditional, I will get it 
fixed in the last patch!


