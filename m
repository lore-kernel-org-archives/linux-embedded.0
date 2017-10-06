From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 0/5] cramfs refresh for embedded usage
Date: Thu, 5 Oct 2017 23:39:19 -0700
Message-ID: <20171006063919.GA16556@infradead.org>
References: <20171006024531.8885-1-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=lbdIgiRrkwqjU03S5UvJHsU3xoaTfibnWpbO4Gwrwqg=; b=lP4Y8lUM6IiFvtDkNV4XrqBdb
        Vhk2WjAyFz3Fu6hZ9GsIfdJeSrKj6/f906jhAmP0zJ2+AvRT7abUqQjOrEnQLoVcLvQbtDlCrDhYh
        ArW/AhM0oxt/IotrY6gBD0OvgQq9zP4ntzS8d9cJiEYeA51PgBWiEcf8CTkO6WtD5HLzQr7/YdaB/
        PMPq0pBMmUviDcaocU/adzqEwVCYJoNgL0oH6x1jAsY7T2l2fHURicaiBFwCFTQWdhmDM9CN9FTlF
        RvdmNfXX+GnrI3aCPKsEQCu3p6BsICgxxw6jQwbGrHEONo7WD7Fxcf8u7Qt6M/mBH8k7iNDUwau4d
    
Content-Disposition: inline
In-Reply-To: <20171006024531.8885-1-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

This is still missing a proper API for accessing the file system,
as said before specifying a physical address in the mount command
line is a an absolute non-no.

Either work with the mtd folks to get the mtd core down to an absolute
minimum suitable for you, or figure out a way to specify fs nodes
through DT or similar.
