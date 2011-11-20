From: "H. Peter Anvin" <hpa@kernel.org>
Subject: Re: [PATCH RFC 1/5] scripts: Add sortextable to sort the kernel's
 exception table.
Date: Sun, 20 Nov 2011 15:26:15 -0800
Message-ID: <4EC98C97.50604@kernel.org>
References: <1321645068-20475-1-git-send-email-ddaney.cavm@gmail.com> <1321645068-20475-2-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1321645068-20475-2-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-embedded@vger.kernel.org, x86@kernel.org, David Daney <david.daney@cavium.com>

On 11/18/2011 11:37 AM, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
> 
> Using this build-time sort saves time booting as we don't have to burn
> cycles sorting the exception table.
> 

If we're going to do this at build time, I would suggest using a
collisionless hash instead.  The lookup time for those are O(1), but
they definitely need to be done at build time.

	-hpa
