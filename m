Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A3F381B13
	for <linux-embedded@vger.kernel.org>; Mon, 13 Apr 2026 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776111479; cv=none; b=k5vRCoEMnHuih+RnjIcSQnmiOkXCz/sBXSRQRV2IFBqZ2yt4GArNTOjuIN2r3whSz8nKwsW7E93m+ipxG7cn4esOcDtkz7QZ+WDiJI7QyCJdk3AAAYK6NG150H+nixSStLYucdC9NaAjTiCcWLb2BLxbDNc3/TW4A/4MI4pbsZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776111479; c=relaxed/simple;
	bh=wP4z9P4uZmwRAO8DvMsuP8Hd8F9gBkWn4g+KT+IeUYw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tGVnKmilACpNCQJGzcF45cO7jULAEfDQoOVur0UlbSmLVkOQ0B5P10ebXSeaxK6TNX5Mw2l/6A23CjN0u6PSfR7kz/X/RRuQc9iJzFrFu4lftD3Dw7UvGB5h/V2KQ2ZxVXsUK5evAAgOr0MHWvpgJ+/kdNa8dzXK0Yijb9tfDf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnNw0rJH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnNw0rJH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d7e23defbso425737f8f.0
        for <linux-embedded@vger.kernel.org>; Mon, 13 Apr 2026 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776111477; x=1776716277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QonialaOeRsx+GeBfarh1r5oZZLkjbGCk56wYsSk4i0=;
        b=BnNw0rJHyH1nXpdLAksOZh8WeTp2auztEjpCKbVtoDuykg/spoRq4kumcsRe0XvT+0
         Pi/+bzN2c18d1SilLu4FTsSZt1RGBaCdeT27CuvjWxMPMeNg3pRO6Dw4QT4B1SzpD4KR
         ngJ7MUdG+HIjHXY0oro6TyF+2rNQKIYPD6FHO9LSoiSH4CPdRILYMT3BB4c2lZyWp+Bf
         lFbxvZ9llCVMxWB22RzJ8C3jZTwQFZjM+gB8qzNjyhQ0ijJ5ZETpTBcE2K2e+hrHyAP7
         uLBfueG39rdRbMuAtn0tLHAlhZAiUUqNkeWJxTSV2NvGmRQAl6aIIWgphc56yp/8TYtd
         M3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776111477; x=1776716277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QonialaOeRsx+GeBfarh1r5oZZLkjbGCk56wYsSk4i0=;
        b=HHr4mHWgFWK0JJrCI6XQIVBFcNTZfVaNhGYsh7vHenuV2k5+zWPVMVMVgkVtkayGEx
         aW+GmacP6VyqUQTPllc8hJk0aqzZFSNWpyGgAZGjb0awjuLfnyYL/KQcts0KediU5GV0
         oFoCcuLQ8iDnXN/9OW1IUEqGKQ5K8ic3i+YNqdrIvsOcaJixAEs20VILKPWA6Ilql44C
         V0beu7qPqYL/TYu4y+i76cETzXzXg96nnQKxZcTUkjU/URfEIHT85pCZpRcLYT5B7NWE
         SkNjYGvKfSCBOPfiCDt/IMU6V6u14tq7rM6m2FSgMBKLDQ2SdHoRizVutZNI+zDvPUXd
         U7bQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eNvYYBp9q3WVwBZnT7NTTq/0goXHp6AV3dX1pX7Y/zvGP7OFSLbUgt985d38Ai1WRM9ecw45ZQ8dn6/p6QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOsgJq9l+ly7h6zlNok0v45CoX4xxuygIgP6XQ87EkozVIKFcu
	LUphUM2ARhRvkj1npk03dCLUv4Ggirz6lWogOfp8hFBrzGUvVC5zpNIH
X-Gm-Gg: AeBDietPC79avD7DGoJp0gvHk7I0GZGUD7yd8ltEJ3bojggxTq+Tr+l7OtjPwNSe1e0
	Gr+bm7lhfI9QB9njwJDjMnZ9smJNCC8AZNHVCtBQk9hM4ODQYxuTNYFH8w8Skhcm7Iltb4552WE
	z+62xxkHiOZ2y7nw0lg4c02aVN5dR9Tq2F+Vl9vLlShiE/vJJWlbus9MVALABHzFPXfWDMQnUxn
	+batiqhKmKNoRrtoBXqj84+yws+HcynyBfHKgRqheNjNSUODssia0Vq6q+58bSYGmYWowUWCRXV
	L9tDOWZpSjNczcGIwaRKtVu5nFFRtaaxxWFhonwPXqmEG4OVfEkOhj1clQdcdq3EDcTR94ATJ9b
	KTyNI91BHZk1yXmX68z8GYegcNOd2uiTDjqPTiaXYIBlodLtfJDlSHM+Dydq/bTezrRTf9z2wZS
	2ssPKSAnteKGNx6XaCmN3z4jdF2AcZ3JW1efHig6dYHQOoReFoWaFNzMSu9Sw0rgYFHDjSoJbxy
	OI=
X-Received: by 2002:a05:6000:c4f:b0:43d:68b2:a0ec with SMTP id ffacd0b85a97d-43d68b2a2b5mr12724663f8f.1.1776111476618;
        Mon, 13 Apr 2026 13:17:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec295sm34973689f8f.14.2026.04.13.13.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 13:17:56 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:17:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: kernel test robot <lkp@intel.com>, "pmladek@suse.com"
 <pmladek@suse.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "john.ogness@linutronix.de" <john.ogness@linutronix.de>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "francesco@valla.it" <francesco@valla.it>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "tglx@kernel.org" <tglx@kernel.org>,
 "shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
Message-ID: <20260413211754.643f6113@pumpkin>
In-Reply-To: <MW5PR13MB563241C9F7C8BCAF0D5F3D21FD242@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20260410203741.997410-2-tim.bird@sony.com>
	<202604121822.OvOLcTnO-lkp@intel.com>
	<MW5PR13MB563241C9F7C8BCAF0D5F3D21FD242@MW5PR13MB5632.namprd13.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Apr 2026 17:58:34 +0000
"Bird, Tim" <Tim.Bird@sony.com> wrote:

> Hmmm,
> 
> This is a false positive warning from the compiler (see below).
> 
> I apologize for not catching it.   I did test with CONFIG_EARLY_CYCLES=0
> and I'm not sure why I didn't see the warning.
> 
> I'll see if I can silence this warning.
> 
> > -----Original Message-----
> > From: kernel test robot <lkp@intel.com>
> > Sent: Sunday, April 12, 2026 4:11 AM
> > Hi Tim,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on linus/master]
> > [also build test WARNING on v7.0-rc7 next-20260410]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Bird/printk-fix-zero-valued-printk-timestamps-in-early-boot/20260412-134726
> > base:   linus/master
> > patch link:    https://lore.kernel.org/r/20260410203741.997410-2-tim.bird%40sony.com
> > patch subject: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early boot
> > config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260412/202604121822.OvOLcTnO-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 15.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121822.OvOLcTnO-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202604121822.OvOLcTnO-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from kernel/printk/printk.c:49:
> >    include/linux/early_times.h: In function 'early_times_ns':  
> > >> include/linux/early_times.h:45:61: warning: division by zero [-Wdiv-by-zero]  
> >       45 |                 return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;
> >          |                                                             ^
> > 
> > 
> > vim +45 include/linux/early_times.h
> > 
> >     34
> >     35	/* returns a nanosecond value based on early cycles */
> >     36	static inline u64 early_times_ns(void)
> >     37	{
> >     38		if (CONFIG_EARLY_CYCLES_KHZ)
> >     39			/*
> >     40			 * Note: the multiply must precede the division to avoid
> >     41			 * truncation and loss of resolution
> >     42			 * Don't use fancier MULT/SHIFT math here.  Since this is
> >     43			 * static, the compiler can optimize the math operations.
> >     44			 */  
> >   > 45			return (early_unsafe_cycles() * NS_PER_KHZ) / CONFIG_EARLY_CYCLES_KHZ;  
> Based on this conditional, it's not possible for CONFIG_EARLY_CYCLES_KHZ to be zero
> on this line of code.  Does GCC not catch this?
> if (0)
>    x = <some expression>/0;
> 
> So this is a false positive.

I suspect the warning is being generated before the optimiser throws
the code away as unreachable.
You might have to do:
	return (early_unsafe_cycles() * NS_PER_KHZ) / (CONFIG_EARLY_CYCLES_KHZ ?: 1);

David

> 
> >     46		return 0;
> >     47	}
> >     48	#else
> >     49	static inline u64 early_times_ns(void)
> >     50	{
> >     51		return 0;
> >     52	}
> >     53	#endif
> >     54
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki  

