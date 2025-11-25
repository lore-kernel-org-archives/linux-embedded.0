Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5622DAFA5;
	Tue, 25 Nov 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764057210; cv=none; b=W5FuhkWOFjDsVBUzDYCEJcAAum7Y3q979CJP1WLtaquqlC/PrKtQo3fYJPBT758lSy3yoXlEeK8D6+HwrswV9LRVnKUPSTGBLEVfzxKCZAziyQ5H6uIcdU15UZXnWR2qLnudtF7rQ8lt327D6t3pdapyeYHipn5UbEVWh0zkMrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764057210; c=relaxed/simple;
	bh=vrVOl7EVuhETDdmJkVuWCXbygP3HAoSjVC9NVD6yA+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWC+StPG++ZEHe2d0RhYJTbBpg8b0xZo1vzvI0L07Ivs+yTO6cmrJUJb2ksdg8vX23BEbpgHF0wXvq1UqBHdzbcZC2GOSpEHC4lIaakn8yaviCyF4RZmAryzJus9VL+gGM3M0XJvB5/j4zla/nEkpnqMC+s0eHnmG8CpBNWU7e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iS4KwPWF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iS4KwPWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764057208; x=1795593208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vrVOl7EVuhETDdmJkVuWCXbygP3HAoSjVC9NVD6yA+8=;
  b=iS4KwPWF8XxPA1Mtlo3PXkozGuUiJzZavvuFaZ/FPIugHNmRS5U7bYCk
   2Eidl0a4krVV2BPldr+DUnbUDTWBLdfpXyNH/9s2eOjMJz0Sqr8FL1PK6
   CTjdrX3ip5F2xCQcpMeLkIE4VjV/0ofuUPSKx7bi+HdqXN9BJa03mOQ3f
   W0jW1RTru92/PPiYYL/GwHhrNgaW+z3Kc4l9X1zb7hN2YvhkrHdwovo98
   Uq9S4YKaFZqJT/YUEchQYTe5B0A5ONpRZE7lJSZE5mbc+93YGaWkgrquZ
   SMCc99f6opHAr9Fj+Vi940Ai17wU3QfxhO08+2SatpIaMxyex8FgPuBHG
   w==;
X-CSE-ConnectionGUID: H+myK+/wTp6utLjdfQc8Cw==
X-CSE-MsgGUID: NT6d/7EPQN24s5lp2h3cSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77542619"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="77542619"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 23:53:23 -0800
X-CSE-ConnectionGUID: HuLq3zmzQfyc5+eHB9dUgA==
X-CSE-MsgGUID: TPLWqce7Svan9mkEomQuIg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Nov 2025 23:53:14 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNnrL-000000001Tp-27Y0;
	Tue, 25 Nov 2025 07:53:11 +0000
Date: Tue, 25 Nov 2025 15:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Bird <tim@bird.org>, pmladek@suse.com,
	Steve Rostedt <rostedt@goodmis.org>, john.ogness@linutronix.de,
	senozhatsky@chromium.org
Cc: oe-kbuild-all@lists.linux.dev, Tim Bird <Tim.Bird@sony.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Francesco Valla <francesco@valla.it>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Re: [PATCH] printk: add early_counter_ns routine for printk blind
 spot
Message-ID: <202511251534.9kMSsAH6-lkp@intel.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>

Hi Tim,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc7]
[cannot apply to akpm-mm/mm-everything next-20251124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Bird/printk-add-early_counter_ns-routine-for-printk-blind-spot/20251125-133242
base:   linus/master
patch link:    https://lore.kernel.org/r/39b09edb-8998-4ebd-a564-7d594434a981%40bird.org
patch subject: [PATCH] printk: add early_counter_ns routine for printk blind spot
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251125/202511251534.9kMSsAH6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251534.9kMSsAH6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251534.9kMSsAH6-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: init/main.o: in function `kernel_init':
>> main.c:(.ref.text+0x144): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
