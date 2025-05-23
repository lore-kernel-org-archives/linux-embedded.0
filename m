Received: from mail-108-mta71.mxroute.com (mail-108-mta71.mxroute.com [136.175.108.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755A213236
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987277; cv=none; b=XAanXBftiX27MHLmeZyyL+Jiw6sfyejqn/JEZNuhYfmT8VIi4WE/36tlOtW4Uk+hFvG7pyvkFkzctkRzKvApq4GUa+c5U2b/46Og0mAdMRI8xqTghcM3MBleSrYExRdX9rAoiqHLzFkr5l1VV6YoSRN7K0Ggepakp5ZddNxE/u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987277; c=relaxed/simple;
	bh=rtbPZZkH220dhqQsj9lM86gJdl0x5lG/pVCPsxwUID0=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=Rga7WNfpJYFmbhMe7XcEN1hZNVGuwV32VYhLFqXn/UcgihLjx9oREutasrvDCcJXSgC+rnByC1Ml+idZulrREGvrkJentu/IKIvwaUkhNj95KMNc5CLa6V5CuyMK5upsKNqICZ0IG9glSGHqj1SIZCKElJtrgD6w1Y7iGvmkHpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=giovanardi.dev; spf=pass smtp.mailfrom=giovanardi.dev; dkim=fail (0-bit key) header.d=anymxrelay.com header.i=@anymxrelay.com header.b=c9CPjCN2 reason="key not found in DNS"; dkim=pass (2048-bit key) header.d=giovanardi.dev header.i=@giovanardi.dev header.b=I8dbTq6O; arc=none smtp.client-ip=136.175.108.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=giovanardi.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=giovanardi.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=anymxrelay.com header.i=@anymxrelay.com header.b="c9CPjCN2";
	dkim=pass (2048-bit key) header.d=giovanardi.dev header.i=@giovanardi.dev header.b="I8dbTq6O"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta71.mxroute.com (ZoneMTA) with ESMTPSA id 196fc245cee0008631.001
 for <linux-embedded@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 May 2025 07:56:03 +0000
X-Zone-Loop: 92f51844c9c615481ee8f6a28a084d452e1e7716b93e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=anymxrelay.com; s=x; h=Content-Type:Subject:To:From:Date:MIME-Version:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+d5HzBvN/9rycOzTUv/PGbjLPvIsJx20jrbWwPh+lTw=; b=c9CPjCN2slhnfqoHtqRWNTFodf
	jGcqiqwvC7yB44RLQUzJGZaf0ku67J03GWiv5e7j4T2rxyWbkAVlMkElXQ9pSSGwghnwMw3j6ETkX
	sIX5smnhcQKdq9mv/21DPZejib+3RoJN6DEZqLwltGAzzToWtQh2G8mVHA2h1ps1VghLoI8BPjNNU
	3d0egglTC6EgeMZ4qUS6lUq4YovIexZjNUD2wYIp0dTdRMAhOlaTjvHG27E2wY9IdabBa8jAYtiFS
	L54Vn8PP2zYvwaeEGDyz0F66CaFkJXZ85Dhh3x/BQW52IzMc6AJfoKn3wsNmiv76EYCb5FPTNU7rM
	1brBPBnw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=giovanardi.dev;
	s=mail; t=1747986960;
	bh=rtbPZZkH220dhqQsj9lM86gJdl0x5lG/pVCPsxwUID0=;
	h=Date:From:To:Subject:From;
	b=I8dbTq6OSL+tebXAMt5KFL7LtDl5BLqC9r+jaZsyG+UMF1cduTl/PI9lFs7Nd5yGV
	 ouqYs41Tmp0gqoK7A+ciIaSt/eSvxFDxCfnGEpRqKE/njOM/zXptndCvfOGETne918
	 bsHSKrNI8hKve55bsTbjYYckHjSJftAggzwfQkgCHzQn5BhSXzrWAjrq/6ONaGoq0l
	 +CEQ4aYvievW23maW7xMkfZSNsUdHvENsrxmIlXtFG4fQ8rd4bbsn91OBnEU8Lgbor
	 bAvoL8NCL+StSy3m106vf36iOASFCCwaGLcMgNZEAOWPwFZDcADF6Q6cobpYBlDMfk
	 TDm0lp2f50WOA==
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 May 2025 09:56:00 +0200
From: Federico Giovanardi <federico@giovanardi.dev>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Deferred probe times
Message-ID: <cd10fd7ee9a3b0ce61cf3c1ea3805fbd@giovanardi.dev>
X-Sender: federico@giovanardi.dev
Content-Type: multipart/mixed;
 boundary="=_23c8a8271c49eb4b905d30421fdc3b71"
X-DKIM: signer='giovanardi.dev' status='pass' reason=''
DKIMCheck: Server passes DKIM test, 0 Spam score
X-Authenticated-Id: giovanardi@anymxrelay.com

--=_23c8a8271c49eb4b905d30421fdc3b71
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

Hello,

I was poking around the boot data database while I noticed that the 
deferred_probe initicalls are considered as a giant block;

There is a patch that looks never went upstream to measure them:  
https://lkml.iu.edu/1707.3/02349.html

And another one from me to print the result in the .svg.


Have a nice day
Federico


--=_23c8a8271c49eb4b905d30421fdc3b71
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=update_bootgraph_deferred_init.patch
Content-Disposition: attachment;
 filename=update_bootgraph_deferred_init.patch;
 size=961

Y29tbWl0IGM4ZDk3YmFkMjk4N2IzM2IyY2U4MDQ4MDUwNzEyMThmZDdmNjhiYmQKQXV0aG9yOiBG
ZWRlcmljbyBHaW92YW5hcmRpIDxmZWRlcmljby5naW92YW5hcmRpQGNuaGluZC5jb20+CkRhdGU6
ICAgRnJpIE9jdCA0IDE0OjEzOjMwIDIwMjQgKzAyMDAKCiAgICBVcGRhdGUgYm9vdGdyYXBoIHRv
IGhhbmRsZSBkZWZlcnJlZCBpbml0Y2FsbHMKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2Jvb3RncmFw
aC5wbCBiL3NjcmlwdHMvYm9vdGdyYXBoLnBsCmluZGV4IDc5YzkwMzI5MmFlOC4uODA1N2Q5ZjQ3
NGRmIDEwMDc1NQotLS0gYS9zY3JpcHRzL2Jvb3RncmFwaC5wbAorKysgYi9zY3JpcHRzL2Jvb3Rn
cmFwaC5wbApAQCAtNjcsNyArNjcsOCBAQCBteSAkY3loZWFkZXIgPSAwOwogCiB3aGlsZSAoPD4p
IHsKIAlteSAkbGluZSA9ICRfOwotCWlmICgkbGluZSA9fiAvKFswLTlcLl0rKVxdIGNhbGxpbmcg
IChbYS16QS1aMC05XF9cLl0rKVwrLykgeworCWlmICgkbGluZSA9fiAvKFswLTlcLl0rKVxdIGNh
bGxpbmcgIChbYS16QS1aMC05XF9cLl0rKVwrLyBvcgorCQkkbGluZSA9fiAvKFswLTlcLl0rKVxd
IGRlZmVycmVkIHByb2JlIChbYS16QS1aMC05XF9cLl0rKSBALykgewogCQlteSAkZnVuYyA9ICQy
OwogCQlpZiAoJGRvbmUgPT0gMCkgewogCQkJJHN0YXJ0eyRmdW5jfSA9ICQxOwpAQCAtMTA5LDYg
KzExMCwxMiBAQCB3aGlsZSAoPD4pIHsKIAkJCSRtYXh0aW1lID0gJDE7CiAJCX0KIAl9CisJaWYg
KCRsaW5lID1+IC8oWzAtOVwuXSspXF0gZGVmZXJyZWQgcHJvYmUgKFthLXpBLVowLTlcX1wuXSsp
LipyZXR1cm5lZC8pIHsKKwkJaWYgKCRkb25lID09IDApIHsKKwkJCSRlbmR7JDJ9ID0gJDE7CisJ
CQkkbWF4dGltZSA9ICQxOworCQl9CisJfQogCiAJaWYgKCRsaW5lID1+IC8oWzAtOVwuXSspXF0g
YXN5bmNfY29udGludWluZyBAIChbMC05XSspLykgewogCQlteSAkcGlkID0gJDI7Cg==
--=_23c8a8271c49eb4b905d30421fdc3b71--
