Received: from mout1.freenet.de (mout1.freenet.de [195.4.92.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE46A2BB15
	for <linux-embedded@vger.kernel.org>; Sat, 11 Jan 2025 08:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.4.92.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736584826; cv=none; b=qhuhZtwbASyenWcXKKrKNAEHN7Rd8QhDOfww40Z5K+TblU6Z0FFem9pJc1/JO7X5mZ9iJKjqmmwYl67hv4dCl5+yk3YriTRRxKBFQCKUrw4/1wulHB2pyA0cXa/pTDHkVsBCTnd+BwZPPy7c8+iKPfi+V6lCwZPOl3x6XrqWDFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736584826; c=relaxed/simple;
	bh=+5yxUE4QISQ3mBDLPjqxbJarZu1PDLQU37ercQK3xxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Uoi/i2QRNYcZJu3Cg2vwZku4z5YT/FMX5c2fosXxY8fVNL7niT+cPyGc+lMkpTwQLY9VFb3GZ/5xdzfyyHSG5oXyPAEopK/OTQ7ZXyd1zyzEcAXhFLrfe1y7d1DFoCfXO8xdtRYhQ42gc9t8+81KVysY4xbd3PtZylowCvznAfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=rs7Ag8FV; arc=none smtp.client-ip=195.4.92.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="rs7Ag8FV"
Received: from [195.4.92.121] (helo=sub2.freenet.de)
	by mout1.freenet.de with esmtpa (ID MarkoHoyer@freenet.de) (port 25) (Exim 4.94.2 #2)
	id 1tWX2O-009EK4-Bi; Sat, 11 Jan 2025 09:40:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cXjZMDJ4URsGa2DzjngzUZJEseqiHJtd1+PRAf0HDB8=; b=rs7Ag8FVS1XDdzxSZK5K+2iEST
	0Jvnhd4LJWDy6nDmPVhmSB0Y7CAOM5INKlwuF4rzo9uECV+EqLJnyCCQoe0vB1Ml2XlEi1KDzw0Fk
	keQan2JGmy1SvzXYWAMK8dwxQoL/6YyI8RcCw9RMQdJ8pG8sq2jP4TGWBfOz8b3U4vRQo6IHIoqEu
	T3KjB84UJYEEXbTCOkEBnRpCYNB/YNwFA4mQpEEb0seEemrHO9lgadb5ohCKSLEWlXR1tt1OcCmdS
	Sut679XjF4VBrvQ4Wpskc24lD0CCExGaAnlPkxkbVJqZSkPww2uKUfhqV89gDCJc7eBqiwSO5x8E6
	WNH0t31A==;
Received: from [2a02:8071:7010:720:c652:8129:a43c:9fb] (port=39748)
	by sub2.freenet.de with esmtpsa (ID MarkoHoyer@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 587) (Exim 4.94.2 #2)
	id 1tWX2O-000SJV-27; Sat, 11 Jan 2025 09:40:08 +0100
Message-ID: <1b6e380d-000d-420a-b198-ecb68c356d34@freenet.de>
Date: Sat, 11 Jan 2025 09:40:06 +0100
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-time]
To: Rob Landley <rob@landley.net>, Marko Hoyer <mhoyer.oss-devel@freenet.de>,
 "Bird, Tim" <Tim.Bird@sony.com>, Shankari <beingcap11@gmail.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
References: <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
 <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <1c232997-79cf-4153-9b1c-6fcbc42121a9@freenet.de>
 <c70841da-3fe6-4b58-a24f-579dc3cc5dbc@landley.net>
Content-Language: en-US
From: Marko Hoyer <mhoyer.oss-devel@freenet.de>
In-Reply-To: <c70841da-3fe6-4b58-a24f-579dc3cc5dbc@landley.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-FN-MUUID: 17365848080D0CDE3D4ABAO
X-Originated-At: 2a02:8071:7010:720:c652:8129:a43c:9fb!39748
X-Scan-TS: Sat, 11 Jan 2025 09:40:08 +0100


Am 11.01.25 um 00:15 schrieb Rob Landley:
> On 1/10/25 16:46, Marko Hoyer wrote:
>> So I think it is worth talking a bit about udev and options to deal 
>> with it but adapting thinks a bit to todays world. I'm currently 
>> registering for the wiki, maybe I can setup an initial page at some 
>> time ...
>
> busybox mdev is a lot lighter weight, and can do pretty elaborate things.
>
> https://wiki.alpinelinux.org/wiki/Mdev
>
> https://github.com/fff7d1bc/mdev-like-a-boss
>
> The theory these days is you mount devtmpfs and then use mdev to add 
> scriptable behavior to device insertion/removal events via netlink 
> notifications.
>
> Rob

Hey Rob,

thx for the hint. Sounds good!

How is the enumeration of cold plugged devices realized in mdev? Is it 
similar to udev triggering all devices in the complete device tree?

Marko

