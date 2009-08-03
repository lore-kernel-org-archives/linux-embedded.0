From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 5/6] Add support for LZO-compressed kernels on x86
Date: Mon, 03 Aug 2009 08:11:50 -0700
Message-ID: <4A76FE36.7010603@zytor.com>
References: <20090731093107.GA29704@merkur.ravnborg.org> <1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-4-git-send-email-albin.tonnerre@free-electrons.com> <1249311501-23102-5-git-send-email-albin.tonnerre@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755237AbZHCPSn@vger.kernel.org>
In-Reply-To: <1249311501-23102-5-git-send-email-albin.tonnerre@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Albin Tonnerre <albin.tonnerre@free-electrons.com>
Cc: sam@ravnborg.org, linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, akpm@linux-foundation.org

On 08/03/2009 07:58 AM, Albin Tonnerre wrote:
> This is the third and last part of the patch, which contains the
> necessary changes to the x86 Kconfig and boot/compressed to allow the
> use of this new compression method
> 
> Signed-off-by: Albin Tonnerre <albin.tonnerre@free-electrons.com>
> ---
>  arch/x86/Kconfig                  |    1 +
>  arch/x86/boot/compressed/Makefile |    5 ++++-
>  arch/x86/boot/compressed/misc.c   |    4 ++++
>  3 files changed, 9 insertions(+), 1 deletions(-)
> 

Acked-by: H. Peter Anvin <hpa@zytor.com>

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
