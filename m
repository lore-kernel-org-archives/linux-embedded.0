From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 3/4] cramfs: add mmap support
Date: Fri, 13 Oct 2017 00:31:01 -0700
Message-ID: <20171013073101.GJ9105@infradead.org>
References: <20171012061613.28705-1-nicolas.pitre@linaro.org>
 <20171012061613.28705-4-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=JXg4sYdBmGPmsAkjNmGWx/z7BfxDXp3jrHsf74SdvaE=; b=gmz7Te/Mf02Y+yLEdYooJODl+
        h51hB1KHrGVeB3WUGZS5t+oO+sjPlwZl3I0OuuXmFrEWhDeSeBqCSxY+cqLSARVGtjRf35yqvZOUV
        oWpFgLxPKIe+ThqK6MNTwOXVw/6xb9qVj9TVdTnvqArfkBeOjQBnCkyKmkEwsnligegw1QcoTi3WP
        oMrEagQcFhmhCD9YpAjw4tu5bi/Vb7svc3sI6agT19Ei/NyANC9L0aK0MH/SHr3s2fYTwnEr+dHTL
        S6XQH8lOnySJaDv5rsuBeHv33G+cACpXkN1vO4W9seauKMgbVMe/CLhwvZ6Ecq52fZxMOaT/dafPW
    
Content-Disposition: inline
In-Reply-To: <20171012061613.28705-4-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

As said before I'm no big fan of all the debug chatter, but the rest
looks fine, so:

Reviewed-by: Christoph Hellwig <hch@lst.de>
