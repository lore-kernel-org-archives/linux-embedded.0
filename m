Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5104926E709
	for <linux-embedded@vger.kernel.org>; Thu, 27 Nov 2025 00:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764204246; cv=pass; b=oYF+RBHsC4g49tygVup1gwr44rYEdcA1/LO5sEnoxZE7FH2twSdD1C0gNy+GW6/EqM577q91lSlCqM4BAplsKsLXqwcthH3ZaqqcM6t2b9Fukyoda0QIky7rq6eTZofM3dnllH+Taes5tvJX/wWQEDgtckjrZ2d0b2yTU+HfKHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764204246; c=relaxed/simple;
	bh=eAOzXOzYCsE1NCcSE4xVQ6opELqbGP0PaEaxFcylpAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DuLftEy6PjqCs62ai4eNJTdgCk9OrJv8wbhzf/M0guur1FhV9/4EoC4cdsAtDFhvUOpMFOnvWKemQuDHeAj+UU9TvcjmnFdPF5dAuVCbWaOu0BuIXxcA9mFz2tp31F3UTAfHJUEZOfdfLV1M60mKbUIrbmukKw1ZcN2KEwZPnqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=gwLVRli1; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=izuZaur3; arc=pass smtp.client-ip=185.56.87.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="gwLVRli1";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="izuZaur3"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com; s=arckey; t=1764204243;
	 b=xcGzyZ5QHp6EOSOA4uRpR9Qfw74fT1vDxwdfWpMjs9mA7lC3d3YI4wesyrrD1hUB9le9b3QDk9
	  /IFttgpVxj+VfAEg+FgsADeRDUTzClq6ikVb45C6+WwXwJNBJdRIjWtwR96lUCxDZn/O5eNxO7
	  IJCca6gPj4jwUA0mJWwHF4uxE7TcHP5dcziH8mDczI7t/dsMxvULdf6rpKBaBlhKd3jVWiLM84
	  4SEAnkW3dNrd1KmheQ+L1ZpqeGuryP/9ODgUgTnXeHB/GN5VF5X3wp0z5Smjzuz2qAf+9AxAy4
	  0FPNNmAdIOJbNwBgpIaIwf+/xa4VzcKFXWe/kZnYKpjOBQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com; s=arckey; t=1764204243;
	bh=eAOzXOzYCsE1NCcSE4xVQ6opELqbGP0PaEaxFcylpAk=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=fGZLQxaIl2sUpsUcDz1XVMaTZkkabZEkr1UM9VUFBpilecgwRd1LoW5fo0YNf8jFY6Y9fgtWvC
	  Kd6RcXst7pNDqZ9ep8dylFll1VFoDzn4SGqWKdOWD9WxZmQZeoLQjpY5TwPQH3VLQmAgMJKAJS
	  wK3g3HbQocxiSYyq+JsvAdLoLqBLEp+Y7XNUO37wiOI+iB/30VLEEg86HeoRd4DLXZEKXY4tl9
	  svGrVY110z68kODfhv2cDKNnljw+kNSPnRgFHoEieFwT47DK6Qkh11XQGHGq+cgX6qv3QEV+Hk
	  dCrNlsaXC3sJl67Eavy1tAglSplXyDsbuQuzf7jxir8oNg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=vZSwSsrUtkN6RP3FGRHMxI3FIxJJtaDfzJnYIwscjRM=; b=gwLVRli1gtEXbJEvQlgCBTbHVu
	KCx4JIF74zFHElS5+m59vbWNN+ORweDaCSTDNPUxfNPXiCicg20wAC68Bd6TfNzwhEKVKP4+930Gy
	1kQkP3rA9vQMaSGfOoFR0PHqM4ZsruhIQmUH2wqD+j/f64rd/DETg4G5qKO7sHW4p2IM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4l43.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOQ1-00000009wqD-0dVL
	for linux-embedded@vger.kernel.org;
	Wed, 26 Nov 2025 22:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=vZSwSsrUtkN6RP3FGRHMxI3FIxJJtaDfzJnYIwscjRM=; b=izuZaur3Av4Kecxk8DGE2uSkPp
	BsqJRzl1Qge0xRUonFMTtM0zvQ7wkLBiK+PgXHVhN5EDpunNaVXW1CuaDX2+pK6zGm3szOJsnguaI
	0+2EYPU7NQq2LNjGbs94IkeHS6q6t+p3Ts5gNbEM3HFhFTbvKakSRedjIx2e9y/ihwNU=;
Received: from [82.59.186.57] (port=59963 helo=[192.168.178.175])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vOOPp-000000006mk-2vAI;
	Wed, 26 Nov 2025 22:55:13 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH DISCUSSION 0/8] Reducing probe deferral - for profit and
 fun
Date: Wed, 26 Nov 2025 23:54:28 +0100
Message-Id: <20251126-beagleplay-probes-v1-0-c833defd4c9b@valla.it>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyMz3aTUxPSc1IKcxErdgqL8pNRi3TRDk1RTSxPDlFRDAyWgvoKi1LT
 MCrCZ0UounsHOocHBnv5+SrG1tQDvY+SIbwAAAA==
X-Change-ID: 20251126-beagleplay-probes-f14e5941de10
To: linux-embedded@vger.kernel.org, Tim Bird <tim.bird@sony.com>
Cc: Federico Giovanardi <federico@giovanardi.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Saravana Kannan <saravanak@google.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9888; i=francesco@valla.it;
 h=from:subject:message-id; bh=eAOzXOzYCsE1NCcSE4xVQ6opELqbGP0PaEaxFcylpAk=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnqrQEH1u6xvd2zq9r8TXpbkEuFj13iditN7YtHD54/f
 cr1vHBXRykLgxgXg6yYIkvIuhv39sw1/5a2gfERzBxWJpAhDFycAjCRG/IM/2xrrbYwsjnte/v6
 1+H4i6pTLjc8/xnIqfVZY/eh569Yz8gyMuy9cTF0Z/93Lt/nqvPNJlhP6L9lkze7wZD1SuWDSW5
 fLvMAAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 8b21f0db0d3581f5a13dd13a60fa0cbc
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vOOQ1-00000009wqD-0dVL-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4l43.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

this patchset is meant as a continuation of the discussion done during
the last Boot Time SIG meeting [1] and not as something that can be
applied as-is. The maintainers for most (if not all) the involved
subsystems are not Cc'd for this reason - if anything useful will come
out of the discussion, a proper submission process will be followed.

I Cc'd the Beagleplay (well, K3 platform) maintainers because they might
be interested, but hey: feel free to ignore the thread.

== TL;DR ==

A probe deferral optimization was attemped on the Beagleplay, leading to
a reduction of 240ms of pre-init boot time and a set of techniques that
can be re-used on other platforms. Patches included.

== Introduction ==

The questions this work arose from were related to the probe deferral
process that happens during boot, and in particular:

  - how much time is "lost" doing probes that don't complete and are
    deferred?
  - is the current infrastructure good at deferring probes in an
    efficient way?
  - what can be done to enhance the current infrastructure?

They pretty much all generated doing boot time characterization on a
Beagleplay, where the probe deferral mechanism is triggered many times
during boot - half of the pre-init time of a vanilla system is spent
inside the deferred_probe_initcall() function, which is the point in
which probes that were deferred is performed.

== Status quo ==

On a Beagleplay booting the mainline kernel (v6.18-rc7) with the default
configuration (arm64 defconfig), the pre-init time is around 1080ms;
during this time span, 89 probe deferrals are triggered. This can be
easily verified using the initcall_debug command line option and
counting the occurrences of a driver returning 517 (or -517, this uneven
behavior bothers me, but I'll keep it for another time). Some example
follows:

[    0.060228] probe of 4201000.gpio returned -517 after 0 usecs
[    0.192159] probe of 2b300050.target-module returned -517 after 12 usecs
[    0.269648] probe of 2850000.serial returned -517 after 18 usecs
[    0.688228] probe of 8000f00.mdio returned 517 after 36137 usecs
[    0.959488] probe of fa20000.mmc returned 517 after 17380 usecs

It shall be noted that most of the deferral events lasts less than 10
microseconds; this is due to the excellent work the fw_devlink
infrastructure is doing under the hood to prevent the probes to even
happen if all the identified suppliers are not already present (that is,
probed) themselves. However, some other are non-negligible at all, like
the mdio friend above, which takes a whopping 36-milliseconds chunk of
time to decide that it's not the time for them to probe.

On this vanilla system, deferred_probe_initcall() takes 504765us to
complete - thats is roughly half of the entire boot process. This is not
unexpected, and not necessarily the sign that something is not working -
but let's investigate a bit.

== The investigation method ==

To investigate the reasons behind the probe deferral, two main tools
can used:

  - the initcall_debug command line option, that without any
    modification to the code offers a nice detailed view of the boot
    process (with initcall levels too, thanks to yours truly [2]);
  - the extensive debug prints that the core driver infrastructure is
    providing; this has to be enabled manually, either with
    CONFIG_DEBUG_DRIVER=y or with the plain old '#define DEBUG' inside
    drivers/base/core.c.

Combining the two, it can be seen what are the consumers and suppliers
for each peripheral and how they interact during boot; for example:

[    0.080959] platform fa00000.mmc: Linked as a consumer to 601000.gpio
[    0.089809] platform fa00000.mmc: Linked as a consumer to regulator-4
[    0.090502] platform fa00000.mmc: Linked as a consumer to regulator-5
[    0.194678] platform fa00000.mmc: Linked as a consumer to 44043000.system-controller:power-controller
[    0.198904] platform fa00000.mmc: Linked as a consumer to 44043000.system-controller:clock-controller
[    0.324348] platform fa00000.mmc: Linked as a consumer to f4000.pinctrl
[    0.720843] platform fa00000.mmc: error -EPROBE_DEFER: supplier regulator-5 not ready

This is a long - and maybe tedious, for someone - work, but in my
experience it helps to truly know a platform; if working more as an
integrator than a developer, this can be a game changer. At least, it
was for me - YMMV.

== Some possible ways out ==

Several methodologies can be exploited to "solve" the probe deferral
problem - assuming it is a problem. The ones that have been used to
obtain the results presented later - and thus covered by the patchset -
are here presented:

1) Ensure that the fw_devlink infrastructure is working correctly
   (spoiler: it is, most of the time) and close the gaps, if any; one
   of such gaps is covered in patch 1 (that was also already submitted
   [3] and will probably see a resend).

2) Help the aforementioned fw_devlink to break the cycles, because this
   might not be straightforward for its logic; this is what is done in
   patch 2 with the introduction of post-init-providers properties.
   It shall be noted that such property is not at the moment working
   with the DTB checker, because it is not considered in any schema.

3) Remove unnecessary dependencies between devices, like it is done in
   patch 3; this can happen in particular with regulators, which are
   often inserted to properly model the hardware but might not really
   be required.

4) Tune the kernel configuration - this can be done extensively with
   excellent results, but something might not be so obvious - see patch
   4 for a particularly sneaky condition that was encountered.

(Beware, from now on be dragons - you have been warned)

5) Change initcall levels. Old drivers for proven IPs - like I2C or SPI
   or GPIO controllers - might have been configured for a specific
   platform to initialize at a odd initcall level and then blindly
   re-used for new platforms. This is not always working well with
   modern systems with a System Management processor - like the
   Beagleplay - where more or less any device depends on a firmware
   interface like SCMI to be present. Some examples can be found in
   patches 5, 6 and 7.

6) Move things around inside the drivers Makefile. This is probably one
   of the most effective AND controversial thing to do, especially if
   coupled with 5), as it changes the init ordering of the various
   subsystems. Patch 8 shows what has been done for the Beagleplay, to
   ensure the SCMI firmware interface and all the services it provide
   (clocks, power domains and so on) are initialized before the drivers.
   Of course a single configuration that can be suitable for all
   platforms cannot be found, but maybe this aspect can be tackled from
   another direction, (mis-)using the LTO support that is already there.
   More work is required on this point, of course. 

== Results ==

With all the patches applied, I was able to reduce the overall pre-init
time to around 840ms, ~240ms less than the original system.

The duration of deferred_probe_initcall() lowered to ~18ms and the
number of pre-init probe deferrals to only 4 - these are not really
avoidable, as there are fixed regulators that depend on the PMIC.

Considering that no driver behavior has been modified... not bad, at
least IMO (but I'm the author and thus don't count).

== Bonus track: deferred probes of modules ==

With the discussion above focused on the pre-init time, nothing has been
said about what happens where the userspace of choice loads modules. The
answer is: a lot of deferrals can take place also there, but the
solution might however be simpler; in fact, the modprobe infrastructure
already supports soft dependencies between modules.

For the Beagleplay, probe deferrals hit the display (tidss) and sound
areas; this is the content I used inside /etc/modprobe.d/beagle.conf: 

softdep ite_it66121 pre: display_connector
softdep tidss pre: ite_it66121
softdep snd_soc_simple_card pre: ite_it66121 snd_soc_davinci_mcasp snd_soc_hdmi_codec

This solved all of the issues and ensured a smooth module experience.

== References == 

[1] https://lore.kernel.org/linux-embedded/MW5PR13MB5632E0103356DB6C0B330FCCFDD5A@MW5PR13MB5632.namprd13.prod.outlook.com/
[2] https://lore.kernel.org/linux-embedded/20250316205014.2830071-2-francesco@valla.it/
[3] https://lore.kernel.org/all/20250930-mmc_pwrseq-v2-1-80a8c6be0fb0@valla.it/

Cheers,
Francesco

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Francesco Valla (8):
      of: property: fw_devlink: Add support for "mmc-pwrseq"
      arm64: dts: ti: k3-am625-beagleplay: set post-init-providers
      arm64: dts: ti: k3-am625-beagleplay: remove inter-regulator dependency
      arm64: defconfig: compile reset-gpio as built-in
      gpio: davinci: reset initcall level
      i2c: omap: reset initcall level
      regulator: fixed: reset initcall level
      drivers: Makefile: reorder driver initialization

 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 12 ++++++++++-
 arch/arm64/configs/defconfig                   |  2 +-
 drivers/Makefile                               | 30 ++++++++++++++------------
 drivers/gpio/gpio-davinci.c                    | 17 +--------------
 drivers/i2c/busses/i2c-omap.c                  | 15 +------------
 drivers/of/property.c                          |  2 ++
 drivers/regulator/fixed.c                      | 13 +----------
 7 files changed, 33 insertions(+), 58 deletions(-)
---
base-commit: 30f09200cc4aefbd8385b01e41bde2e4565a6f0e
change-id: 20251126-beagleplay-probes-f14e5941de10

Best regards,
-- 
Francesco Valla <francesco@valla.it>

