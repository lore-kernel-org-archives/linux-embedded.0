From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 3/6] Add support for LZO-compressed kernels
Date: Tue, 4 Aug 2009 16:04:20 -0700
Message-ID: <20090804160420.1e911623.akpm@linux-foundation.org>
References: <20090731093107.GA29704@merkur.ravnborg.org>
	<1249311501-23102-1-git-send-email-albin.tonnerre@free-electrons.com>
	<1249311501-23102-2-git-send-email-albin.tonnerre@free-electrons.com>
	<1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933589AbZHDXFF@vger.kernel.org>
In-Reply-To: <1249311501-23102-3-git-send-email-albin.tonnerre@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: sam@ravnborg.org, hpa@zytor.com, linux@arm.linux.org.uk, alain@knaff.lu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, albin.tonnerre@free-electrons.com

On Mon,  3 Aug 2009 16:58:18 +0200
Albin Tonnerre <albin.tonnerre@free-electrons.com> wrote:

> This is the first part of the lzo patch

Please pass this patch (and all others!) through scritps/checkpatch.pl.

checkpatch reports a number of trivial errors which you wouldn't have included
had you known about them.
