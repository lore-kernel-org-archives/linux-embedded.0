From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/5] cramfs: direct memory access support
Date: Sat, 12 Aug 2017 00:49:27 -0700
Message-ID: <20170812074927.GA8703@infradead.org>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org>
 <20170811192252.19062-2-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=s/w6ugnU+Ik1b2/oMlHDdlw+CrJHqfzzPK6/7CASgoI=; b=YZhhegqq2xNSbJ/32hQtPJ22k
        IR3Wg+VDYhheiCXRZYno4+GsymeZ2Li9IrSTYnNb8vWESyr3Y6/vwua+cIx7n72OiO+6YzxOmbAZ+
        TTmlCQANJp8M16t9jHENba92izUQ+aKItdrAozr89jd9bFHYQ2NtgRgaj5vdHKJ3C0trobXdvS9eD
        H727NCwE0tSEGXcf3PC4nfwwHFLexw7r+BXY0eaVDhzo5fP66kzQ0OZSSu+xmb6UuatQ47yWd4Cxw
        YdQWhHSrdgeGtRGtDpvLTo18h77CGIYWiEijx/nLTrElMQCNPIgasCMKcc+KNGI7j7VZgjOLGeAI3
    
Content-Disposition: inline
In-Reply-To: <20170811192252.19062-2-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

Direct physical memory access in a file system is never safe.
Please make sure this goes through struct dax_operations.
