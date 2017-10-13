From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 1/4] cramfs: direct memory access support
Date: Fri, 13 Oct 2017 00:30:22 -0700
Message-ID: <20171013073022.GI9105@infradead.org>
References: <20171012061613.28705-1-nicolas.pitre@linaro.org>
 <20171012061613.28705-2-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kb+38/hTODIDHa24hxFPRJXFcrIoOGDEVy9gipXfvfo=; b=TjYEg5opgvrNwTkSxkK5odTTu
        Ym6uXC/3rI26xxZNled8AgcMuMy2T87wQpx8IzuePGdhJ4iQbmSe6iJKimOae6MPuuF7/h//xDd9p
        4RSmibRUQI3ywqCNkZDCrqxm9uNPnbBFimhXlJ9agv6ervJb6zts+oLyoriA7I7r+fwpWiRscHi7+
        YGIzxuUSHiYKNbF/vR5aWg8VVmiclRRN1wp9n+uKAWD46bCF8sKEYZzr8YsIGCweDDBUHKnybaEHv
        dlSgMzp7eGLrlhlDh5sopwkzYzhZ/4KB44sr9P5PpRQ4fnKawOnk9zK04pojuC0fCpzkGaVVYHzZE
    
Content-Disposition: inline
In-Reply-To: <20171012061613.28705-2-nicolas.pitre@linaro.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

This looks much better, thanks.  I'm not a big fan of the games with
IS_ENABLED and letting the compiler optimize code away, but you're
the maintainer..

Reviewed-by: Christoph Hellwig <hch@lst.de>
