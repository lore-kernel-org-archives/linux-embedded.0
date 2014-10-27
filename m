From: Benedikt Kleinmeier <benedikt.kleinmeier@esk.fraunhofer.de>
Subject: AW: Create/Package kernel headers for self-compiled kernel
Date: Mon, 27 Oct 2014 10:53:45 +0100
Message-ID: <2F4CF2DB24861D49816948ECBDF0D4FB0103002E10@zulu.esk.fraunhofer.de>
References: <2F4CF2DB24861D49816948ECBDF0D4FB0103002E0F@zulu.esk.fraunhofer.de>
 <20141027093934.GA9894@opentech.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20141027093934.GA9894@opentech.at>
Content-Language: de-DE
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: "'linux-embedded@vger.kernel.org'" <linux-embedded@vger.kernel.org>
Cc: 'Nicholas Mc Guire' <der.herr@hofr.at>

Hi Nicholas,

> apt-get install kernel-package (toosl for building kernel .deb)
> 
> CONCURRENCY_LEVEL=6 make-kpkg --initrd  kernel-image kernel-headers

Thanks for the hint with Debian's "kernel-package". I will give it a try.

Nonetheless, I would prefer a distribution-independent way of packaging the header files because today I have to use Debian but tomorrow I will have to use another distribution.

> the other question is why do you not build the modules on the host ? no
> reason to build that on the target box.

You are right. It's just for a quick test. In the long run, I build all stuff on the host environment.

Thanks a lot,
Benedikt
