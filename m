From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 1/5] cramfs: direct memory access support
Date: Tue, 3 Oct 2017 07:59:21 -0700
Message-ID: <20171003145921.GA9954@infradead.org>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org>
 <20170927233224.31676-2-nicolas.pitre@linaro.org>
 <20171001082955.GA17116@infradead.org>
 <nycvar.YSQ.7.76.1710011659530.5407@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	 bh=MJdOYlL8uGGPZuGjKvvRQgDGPyfU7VVEo8jNj+fLyUE=; b=LGeYO7aSZPQFL9krUTX4MLE9K
	l/x9stoUu2/r3WWCdbTM2a47sTZWyPuldki4Qnit2nz+ZVNWMVy0irQzTMDd7BnP8M8sfiN++M02r
	61oW3bP/0Yp/2ImMGux7SyVcr6G/ezyYI5rOAEyN/QLJPi/A3M5d/stxCzIrE9///MbGAOPDC8rpq
	VwvbpkUst3TKS8ZEYEPro3kzxEbno1AJ6gMHQslTpCa/UTORCXYQrGKEKKDDN8dhDBWjUCbdCFbmE
	gfR95t2QDp5Y/0UTfMEVRorSaHSnzIB4bZvmnKuYUExiI00FfIq3Ahsqifs21j7wp6H2p1BGikZZS
	XRye9FSWQ==;
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.1710011659530.5407@knanqh.ubzr>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Christoph Hellwig <hch@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org

On Sun, Oct 01, 2017 at 06:27:11PM -0400, Nicolas Pitre wrote:
> If you prefer, the physical address could be specified with a Kconfig 
> symbol just like the kernel link address. Personally I think it is best 
> to keep it along with the other root mount args. But going all the way 
> with a dynamic driver binding interface and a dummy intermediate name is 
> like using a sledge hammer to kill an ant: it will work of course, but 
> given the context it is prone to errors due to the added manipulations 
> mentioned previously ... and a tad overkill.

As soon as a kernel enables CRAMFS_PHYSMEM this mount option is
available, so you don't just need to think of your use case.

The normal way for doings this would be to specify it in the device
tree.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
