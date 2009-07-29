From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 5/5] Add support for LZO-compressed kernels on x86
Date: Wed, 29 Jul 2009 13:00:36 -0700
Message-ID: <4A70AA64.4020301@zytor.com>
References: <1248271279-9920-1-git-send-email-albin.tonnerre@free-electrons.com> <1248271279-9920-2-git-send-email-albin.tonnerre@free-electrons.com> <1248271279-9920-3-git-send-email-albin.tonnerre@free-electrons.com> <1248271279-9920-4-git-send-email-albin.tonnerre@free-electrons.com> <1248271279-9920-5-git-send-email-albin.tonnerre@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1248271279-9920-5-git-send-email-albin.tonnerre@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Cc: linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

On 07/22/2009 07:01 AM, Albin Tonnerre wrote:
> This is the third and last part of the patch, which contains the
> necessary changes to the x86 Kconfig and boot/compressed to allow the
> use of this new compression method
> 
> Signed-off-by: Albin Tonnerre <albin.tonnerre@free-electrons.com>

Acked-by: H. Peter Anvin <hpa@zytor.com>

Since the patchset otherwise isn't really x86-related it probably makes
more sense to pass this through the kbuild tree, or perhaps via akpm,
rather than -tip?

	-hpa
