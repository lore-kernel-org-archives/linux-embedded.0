From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/17] pramfs: persistent and protected RAM filesystem
Date: Thu, 06 Jan 2011 17:58:55 +0100
Message-ID: <4D25F4CF.1030009@gmail.com>
References: <4D25AEEE.1050401@gmail.com> <1294322613.2016.333.camel@laptop> <4D25ED22.3070900@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=VRHD9zL/F9xPkZWtFB3JRYx4CrH2+QrHfstcFsozMAk=;
        b=N0Eunyqqse68EblGweFkJ857rDKaTYb3d7yb4ES3fLul5rUVggpSJzsK0nFrqAYJpn
         Tc10uLC28mk+J214A/LKNlG44YxtH6coSlarcxU7uVVUtZAfWtOlZysfIL7fxjEw5LV/
         +1vTk0HIoVvqx2ue3YpKqPv9ModkhE7o0+Goc=
In-Reply-To: <4D25ED22.3070900@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Tony Luck <tony.luck@intel.com>

Il 06/01/2011 17:26, Marco Stornelli ha scritto:
> Il 06/01/2011 15:03, Peter Zijlstra ha scritto:
> and temporary information with a complete fs structure. However we are
> 

Errata corrige: maybe I used the wrong term, I meant "volatile" instead
of "temporary" information, i.e. I'd like to save this info to re-read
it later but I don't want to store it in flash, a simple log, run-time
information for debug like a flight-recorder or whatever you want.
