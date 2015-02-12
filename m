From: K Richard Pixley <rpixley@graphitesystems.com>
Subject: embedding dtb file into kernel
Date: Thu, 12 Feb 2015 11:33:44 -0800
Message-ID: <54DD0018.7010409@graphitesystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=graphitesystems.com; s=google;
        h=to:subject:from:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=vibPRfblq6W0DKtzGwTGN6gisjZMsY2019BGDuZw0l8=;
        b=pVT4k2GVHRAljJPjJ1HGw3xW1dhCyqBBgauWfIZuJEfS9ktG6DTOc1/9DwznWLyTlj
         HxP15ODbx9gc5zXyXqyq+ZSQ8IsJ3IH1burmLEqZcYNoiHvPntX2zwwvVaUXuciemdgT
         PSMnODddFndtBaYmT7eWhsf2ifQAhbTZIxZv4=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

I'm having trouble figuring out how to embed a dtb file into my kernel.  
I'm thinking that there should be a standard, architecture independent 
facility for this akin to initramfs, yes?

Could someone please either point me to the standard facility, relevant 
doc, a currently building board that uses the standard facility, or 
outline what needs to be done to do this with a new board?

If it matters, (I can't think why it would), I'm working with powerpc on 
a 3.10 kernel.  But if there are better facilities in other versions I'd 
appreciate hearing about that too.

Thank you in advance.

--rich
