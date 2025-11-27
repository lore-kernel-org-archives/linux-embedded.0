Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9423E32721F;
	Thu, 27 Nov 2025 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234826; cv=none; b=TKEG6zXcg7kn5Au8e/oC5cRO6xXprBbSlJxrhMZKiEVtNiUsHY65MkyO1R0LkfNIvDfFR4DweS/z/NaTI+EvYl+/grA4n0J5WJxFYEkdHAvN5Ga0RvR+Z6MZswn0EwPxGpi/ID0oZwqQTlCWROXo7etqqkWvoXUdaukBx93UFlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234826; c=relaxed/simple;
	bh=nMeiv3SIi8QG4moeoqdXt6Rrisu/4W7V71FP8WJhXLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ad4byO0+dDsh89fK+BICRszco6Tzx+n48s0L0SljaF37O7r+v+Tn/6qPKkimPtKcMqQ9OEBBcTtb7qGHOtNvTcbC9Pw3VGFwplEVgVlPtG+tf7V2xvGUrB5u5SbIhT2WrD3epMkQ9B+2D8jT2K+/EY5qScvEHwfJyg6IdCmJpAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTvLcWPZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTvLcWPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764234824; x=1795770824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nMeiv3SIi8QG4moeoqdXt6Rrisu/4W7V71FP8WJhXLY=;
  b=CTvLcWPZGNjvbz/wSds7XMBMwmVnXa4KPUXdZG0RD0AnghiIJMSdFLbI
   OvS7+7xbEHqmQP7lznOh64q7HhsldYe5P8ZsdFiKctOAgxg4FyDaG6aap
   XYpcPTMKT3qTvustDZcqyZRoyVLtJRES7Z5ujPNQlmwrv8484KD1ok6E9
   x+CPfJOmbuZYh/g2PO1VOj2YrcedRJWU8hKhHVX20SeGs7CHOC6kpas0Y
   miai+lI6J8Rx/eoqZG/7DTv3VLjMk/QN4zI0a/a4/pLegqzKsqVN097FZ
   sxObhT4Glb1TLpzZFvTKrgbSfEWcferxslxyPsN2MlKFlRVeZimBUsxfE
   Q==;
X-CSE-ConnectionGUID: OswDUh4qTD6S5223okmwJg==
X-CSE-MsgGUID: YgvBOya3Ti6Z9doVGhN5xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="91759734"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="91759734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:13:41 -0800
X-CSE-ConnectionGUID: galzY4AMRqWW3GAP7HFGLQ==
X-CSE-MsgGUID: qPStb08kTMKgIAKRQFTcDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193206736"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 27 Nov 2025 01:13:39 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOY4F-000000001hN-3iCC;
	Thu, 27 Nov 2025 09:13:35 +0000
Date: Thu, 27 Nov 2025 10:13:23 +0100
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
Message-ID: <202511271051.yfp2O98B-lkp@intel.com>
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
[cannot apply to akpm-mm/mm-everything next-20251127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Bird/printk-add-early_counter_ns-routine-for-printk-blind-spot/20251125-133242
base:   linus/master
patch link:    https://lore.kernel.org/r/39b09edb-8998-4ebd-a564-7d594434a981%40bird.org
patch subject: [PATCH] printk: add early_counter_ns routine for printk blind spot
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20251127/202511271051.yfp2O98B-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271051.yfp2O98B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271051.yfp2O98B-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: init/main.o: in function `kernel_init':
>> init/main.c:1522:(.ref.text+0x201): undefined reference to `__udivdi3'


vim +1522 init/main.c

  1481	
  1482	static int __ref kernel_init(void *unused)
  1483	{
  1484		int ret;
  1485		u64 end_cycles, end_ns;
  1486		u32 early_mult, early_shift;
  1487	
  1488		/*
  1489		 * Wait until kthreadd is all set-up.
  1490		 */
  1491		wait_for_completion(&kthreadd_done);
  1492	
  1493		kernel_init_freeable();
  1494		/* need to finish all async __init code before freeing the memory */
  1495		async_synchronize_full();
  1496	
  1497		system_state = SYSTEM_FREEING_INITMEM;
  1498		kprobe_free_init_mem();
  1499		ftrace_free_init_mem();
  1500		kgdb_free_init_mem();
  1501		exit_boot_config();
  1502		free_initmem();
  1503		mark_readonly();
  1504	
  1505		/*
  1506		 * Kernel mappings are now finalized - update the userspace page-table
  1507		 * to finalize PTI.
  1508		 */
  1509		pti_finalize();
  1510	
  1511		system_state = SYSTEM_RUNNING;
  1512		numa_default_policy();
  1513	
  1514		rcu_end_inkernel_boot();
  1515	
  1516		do_sysctl_args();
  1517	
  1518		/* show calibration data for early_counter_ns */
  1519		end_cycles = get_cycles();
  1520		end_ns = local_clock();
  1521		clocks_calc_mult_shift(&early_mult, &early_shift,
> 1522			((end_cycles - start_cycles) * NSEC_PER_SEC)/(end_ns - start_ns),
  1523			NSEC_PER_SEC, 50);
  1524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
