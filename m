Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FED1F4CA4
	for <linux-embedded@vger.kernel.org>; Thu,  3 Apr 2025 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673789; cv=none; b=Iy38rc6TdYt93gLFSfTL/6JPaebkVig56Hy19RcVo7wRcPyjji/0BTDCqXqgYgVHElkOu8EHVPWsR2SuOvAhRqKNji8Od8Q7gxViqTRVK8yCtYL2N/06aBqGZOnmYRiDrhtr/7b3UCIUc5o0bfvrq6EemfOx55dYB8SAv9Kd85c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673789; c=relaxed/simple;
	bh=G6oYfeUR4bfwJrN0/bHQWLiRKz/K/9hB+KcRBhGFV/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwQaZPvk8FEkgO0BzEbrmsrmEv5hVYDorEKaZHBH4xjQy94ktmbTFgNXSByja4byFBl4HTdVAgsvPyG7N3ye4gWSp4c6S/I3MI2F/wFII/iNiy+eP5iScDJllbABgplKIJFdC3b1tEUAwvLZN94yaK5uUp1GsD0xrfI9OXm4QII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J8C/BhEX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J8C/BhEX"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so608103f8f.2
        for <linux-embedded@vger.kernel.org>; Thu, 03 Apr 2025 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743673785; x=1744278585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F/KrIHQ1MmyGFD2BIEbCGLM6y6y1lEI7pIwtYyMlkpk=;
        b=J8C/BhEXQC2q+acTD9VIS7s9T1psG9EhyN7HaniuFcGNOj40/rW2qaHy1itVaduaR2
         QbxwMrIrNBC5bzfOBOEoRtirtFoyWisX03X/x4dfxBJObN1TyMhzyPbpez/ewmw6o7W5
         oMOO5UE5JtUUGZ2hsNWXYjsHRc9Kd2sWwHTjwyQv3jejYPW9h6lBXRRtpU0BoQiL4hMS
         xi+xretE5XYBsRkeeF6xmH1O+13lNALtnzIYUZkB9HZ0gPOPOhv7Y084/EvwPLSv6Aew
         5/Zwf4sB6bm4JKLCeK1MmEyi2ypzcBfxUfBdo/97FU7O0MBgRAUYOowSO3VF3yn0CYQM
         ndGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743673785; x=1744278585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/KrIHQ1MmyGFD2BIEbCGLM6y6y1lEI7pIwtYyMlkpk=;
        b=ectk1Mflscv5Ju+G8At5kiO+0k1FtqqLTmmHfScUjRxsseQLnyfTbqeGzDBShmXvUs
         GnRZpsCvEs8Hno/h7Nsqcpn08fxsJ9IOkRTAA5dAjaFv27H1bwlllQDmfAziCM57iw4O
         4FJi5ZAruAHhHhapBjHD4N0l6m8vF1OOzbl5n7RVFy1kQ3urb7UHa50WdKoGQrW4h0oi
         XstiNZ5pf319saAtAlJFNj2j1NOyUL2nXqIFOhtGnOXBY2JmO5e7AIxMMQnuptQxyh9N
         MggyDE2VVtaB1hG/+jgao3oezyBXnrfxRsigKDHY4jTYMZrxVaxrOTZnaXIpuCkVR7sk
         nYPA==
X-Forwarded-Encrypted: i=1; AJvYcCUs6sYeGG8Kd47BpVOvxO6rrQPohPF/3lL1so/yXKCJFTGrYDxS/tIFiYT0jzjhraxLlpkeZJD2hDdkQviZwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUVmvJsDRkB06lSfSeZUrJauvT9OuTXX5Uzo4MSRThmzSEV4Qb
	nraITOuaWSekUm1ctyU6yDeaHl66DIa5eIwXGePtobOrp7h1y/I1dPJxwKuLwa8=
X-Gm-Gg: ASbGncvLBM6QPyk3N5yJm91wyRQLnxZo4Y61gfB1iui6XH6U+iOhFZKDAATHGCyy7o6
	CRM6WF8wNY0ZGMdxVgdHvLyWLPagX0C8LTM7qjWPTotrnklGObEnlIAJjKIYpZUIHCB6cPXcJv+
	cjoZxopYvX2y42mrvLGsTBlYxcbFNsfIMUCDhb+LRxhh+4CvebVVEZD6M/mnog41fbH8GnW6qKV
	DOqey2QgkB/sR+mv7oRZ7Ugj+ogzANxpyPPm+CrFpJ9EV33PP9zDdAM4x9y/Er5eJtPyWzaYMe4
	ymeZnIAz9Ll3CMTmX0jev2fn/NiUapXi4EuEmKHCQZ1LfaRB3HT2MXo=
X-Google-Smtp-Source: AGHT+IHokS94ZG2sHfhbFW8KtTRbP+tGalXra8CX5+Pf2qvikuoN0QrEFR16oqoRrZ2quQdk7Z4z2g==
X-Received: by 2002:a5d:648c:0:b0:39c:310f:f70a with SMTP id ffacd0b85a97d-39c310ff73cmr1175939f8f.7.1743673785175;
        Thu, 03 Apr 2025 02:49:45 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm13174115e9.39.2025.04.03.02.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 02:49:44 -0700 (PDT)
Date: Thu, 3 Apr 2025 11:49:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Rob Landley <rob@landley.net>, Francesco Valla <francesco@valla.it>,
	linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>, Tim Bird <Tim.Bird@sony.com>
Subject: Re: [PATCH] init/main.c: log initcall level when initcall_debug is
 used
Message-ID: <Z-5Zt66D3xm6bHOY@pathway.suse.cz>
References: <20250316205014.2830071-2-francesco@valla.it>
 <20250402195544.4897a774456eba75915cded7@linux-foundation.org>
 <5b8eea42-76cd-414d-b2f8-416336a9ae27@landley.net>
 <20250403000935.e48f8552231a28d06765b777@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403000935.e48f8552231a28d06765b777@linux-foundation.org>

On Thu 2025-04-03 00:09:35, Andrew Morton wrote:
> On Thu, 3 Apr 2025 01:42:46 -0500 Rob Landley <rob@landley.net> wrote:
> 
> > On 4/2/25 21:55, Andrew Morton wrote:
> > > Please review and test this fixlet:
> > > 
> > > --- a/init/main.c~init-mainc-log-initcall-level-when-initcall_debug-is-used-fix
> > > +++ a/init/main.c
> > > @@ -1217,7 +1217,7 @@ trace_initcall_finish_cb(void *data, ini
> > >   static __init_or_module void
> > >   trace_initcall_level_cb(void *data, const char *level)
> > >   {
> > > -	printk(KERN_DEBUG "entering initcall level: %s\n", level);
> > > +	pr_debug("entering initcall level: %s\n", level);
> > >   }
> > 
> > How do I tell kconfig to remove all pr_blah() below loglevel X so they 
> > aren't compiled into the kernel taking up space? I thought that was the 
> > reason for switching to the pr_thingy() macros (it was in the old -tiny 
> > tree Mackall walked away from) but last time I tried to do it in vanilla 
> > I couldn't find the knob or trace the relevant plumbing...
> 
> Ask the maintainer :)
> 
> I can't see a way.  Maybe it was never merged.

If I read the definition of pr_debug() correctly then it should
become nop when CONFIG_DYNAMIC_DEBUG is not defined, look
for "pr_debug" and "no_printk" in include/linux/printk.h.

That said, I have never checked this. Another condition is
that DEBUG must not be defined. But I guess that it is
the default.

Best Regards,
Petr
