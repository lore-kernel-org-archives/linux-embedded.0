Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2EC1A6834;
	Fri,  3 Jul 2026 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097950; cv=none; b=mUoi4e5GNOYZ9+sLp5XFWgjz2wQ3q9kQxR12TZ51yMBI01oEW/r2KwVu5W/V/3eBbLJynMXp18m3jWE8JZwezqYY3JTX1gjVy3XOzJmWJX4vqZghvF8H7flzEtVeKeqbAifFunWItV560Ytoo/ZuQdCPeRg3sPJwr3y1XHtRexA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097950; c=relaxed/simple;
	bh=1jK+JH69iNk2I1nlShKL/ZmpYaP0MH8MyHq6Mton2ws=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ayn7IadOBA+3WDeNuzw6gh+8P3MLjYGLHIHTYxm5u8tXhx9B8opPjpaI/CMNsv61ynlzgppSfIB0TZQ9UIXuH6g8lz4yMW1mcI0IRtXRVa8UDVVOvijDqW/QPWKa4WyetbClmQoPK89SyTcz+ca1ymKUioeDDf/MX3yMoebDIVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcrBxovI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcrBxovI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6E21F000E9;
	Fri,  3 Jul 2026 16:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783097949;
	bh=1jK+JH69iNk2I1nlShKL/ZmpYaP0MH8MyHq6Mton2ws=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=FcrBxovIdV6plvxSiLACeAqWYjSObn68vcWx8VhCTRf4Qe0/cAazyHqGFC+2EjZ9A
	 Bh5G1PdtL5j0N1+YI/1EZ73Puz26NEDB4A76dINPOix6L0h4iST5NPSzpuuy24EH96
	 y3mJfPUfjAUXGIrmjdXYQr/QEwMS1AUmVxAtrTX8hW3IM9o36Yj4/FtikJp2S6KhYE
	 gD0uubPj+XPPkYMUQ01qHCgzcQoP7G0vBueW2fJEERd4tc7NxgurtrYR7zVG/Lbzux
	 mhNxgi/fzzJWl86lKj2/7ASxeJEiorfEda0OG2p/NAmtfyYZd89o/oYr9mpNjIHbnO
	 unNWiGERliLyw==
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 18:59:06 +0200
Message-Id: <DJP3GW0F3BYU.2OY52DAYFCDS@kernel.org>
Subject: Re: [PATCH v2] driver core: add driver name to probe debug print
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Tim Bird" <tim.bird@sony.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-embedded@vger.kernel.org>
To: "Francesco Valla" <francesco@valla.it>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260703-probe_driver-v2-1-b6060559f33b@valla.it>
In-Reply-To: <20260703-probe_driver-v2-1-b6060559f33b@valla.it>

On Fri Jul 3, 2026 at 5:10 PM CEST, Francesco Valla wrote:
> The initcall_debug command line option is a useful tool while debugging
> and optimizing the initialization of a new system, mainly because it
> allows to see probe failures and deferrals without recompiling the
> kernel (e.g., with CONFIG_DEBUG_DRIVER). However, matching a device
> with the driver it is being probed with can become difficult, since
> some devices use names that are not explicit, at least at a first sight
> (e.g.: '1-0:1.0' or '1-0060').
>
> Add the driver name alongside the device name, to allow for an immediate
> match between the two.
>
> Suggested-by: Tim Bird <tim.bird@sony.com>
> Signed-off-by: Francesco Valla <francesco@valla.it>

Acked-by: Danilo Krummrich <dakr@kernel.org>
