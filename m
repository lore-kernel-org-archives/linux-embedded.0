From: Holger Schurig <hs4233@mail.mn-solutions.de>
Subject: Re: [PATCH] add diffconfig utility
Date: Wed, 11 Jun 2008 08:59:47 +0200
Message-ID: <200806110859.47979.hs4233@mail.mn-solutions.de>
References: <484ED902.9040000@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <484ED902.9040000@am.sony.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Nice.

Would it be helpful to compare .config.old to .config if you 
don't provide any command line arguments?

scripts/diffconfig

would then do the job.
