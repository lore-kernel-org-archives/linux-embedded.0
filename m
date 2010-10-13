From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 15/16] pramfs: test module
Date: Wed, 13 Oct 2010 07:23:51 -0400
Message-ID: <20101013112351.GA16422@infradead.org>
References: <4CB1EBDD.8050509@gmail.com>
 <4CB301E4.40405@gmail.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4CB301E4.40405@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kieran Bingham <kieranbingham@gmail.com>
Cc: Marco Stornelli <marco.stornelli@gmail.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

On Mon, Oct 11, 2010 at 01:24:04PM +0100, Kieran Bingham wrote:
> >@@ -0,0 +1,49 @@
> >+/*
> >+ * FILE NAME fs/pramfs/namei.c
> FILE NAME != namei.c

Yes, that's why you should never do such filename comments which are not
only utterly prone to be out of data, but also 100% useless.

