From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 4/5] cramfs: add mmap support
Date: Sun, 1 Oct 2017 01:30:52 -0700
Message-ID: <20171001083052.GB17116@infradead.org>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org>
 <20170927233224.31676-5-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	 bh=aShalmDrL/UYrP7myv825qZMN3XVjMt4DaHyYfddDxI=; b=Xm4iujXabFUhOR6GT25uM6WPj
	zmPglQHqQgNSuzkqOm6WfVYhkfOy50NyKS/f0dS6RRG+QfcFbTCiIF9ku65/oRlbzwvQKF+s2+FZ8
	pSlwX/nzn8hWtl3SXe4CbeJ/c+Cu8jHzDMgk+zxPSOIZsY477uNWO5BMKJx5Jq++HXgzWjSEvvIfK
	1fI0HhbuPO65uzwdr8UFuhAxwAm5ckdgYWCdhEluM77wxVKKJ3V8R2sfpqBBdiG9cAUc4ADpy4Rda
	+mtllnK8LnkFTkj2dJFQvH4wUNluOjGVisx5ugEx1x5HbRlYxpL+IYifbKoE9ewe+LQbKNHK3P0yD
	S+AjDgNzA==;
Content-Disposition: inline
In-Reply-To: <20170927233224.31676-5-nicolas.pitre@linaro.org>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

up_read(&mm->mmap_sem) in the fault path is a still a complete
no-go,

NAK

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
