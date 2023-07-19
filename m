From: Kai Tomerius <kai@tomerius.de>
Subject: Re: File system robustness
Date: Wed, 19 Jul 2023 12:51:39 +0200
Message-ID: <20230719105138.GA19936@tomerius.de>
References: <20230717075035.GA9549@tomerius.de>
 <CAG4Y6eTU=WsTaSowjkKT-snuvZwqWqnH3cdgGoCkToH02qEkgg@mail.gmail.com>
 <20230718053017.GB6042@tomerius.de>
 <CAEYzJUGC8Yj1dQGsLADT+pB-mkac0TAC-typAORtX7SQ1kVt+g@mail.gmail.com>
 <CAG4Y6eTN1XbZ_jAdX+t2mkEN=KoNOqprrCqtX0BVfaH6AxkdtQ@mail.gmail.com>
 <20230718213212.GE3842864@mit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1689763901;
    s=strato-dkim-0002; d=tomerius.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=lvLGZstJ8wKorYy8rcLHdorayXbsT3iQ7MhbnharKpE=;
    b=M3N9Gj1Ihv8I9YUfstwtzWIFX3+X2U9J5CpGZ6oP7Di3hrzt3WsVVJv1AOAErs7Ove
    CUu06Y8twnNwBNCHrSlB2nck7Vs5gxPbe0zltkHifMwKwABBUophuepqxMzpFUdWTCA3
    Qap36HEHkzX9ZZ59g3CLLXZob5ZWjMinDx1ttADn2Ah8kn9kYVxYd6Lxygin2qWGA+MY
    MruND7adGncDE2d/mlXQ2mp/HQtqB/n1A3qAQ11K0HNW7hKknR+WGr1NyByh5uKO+I5l
    QtnBiarBhsYIBGx1XvhsYuZVbmKa+oCrmut3yi6UzUbQBfaIZEcBZGhDCEi1c+nXbBDa
    +uiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1689763901;
    s=strato-dkim-0003; d=tomerius.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=lvLGZstJ8wKorYy8rcLHdorayXbsT3iQ7MhbnharKpE=;
    b=izeiG+UjQBLTpfzhdAuho9H+oPiIG8m14QCvDr/1SnrXC/4LZIUG7e8H9/IuiaHNyB
    l7nJ7yHBtDsAwrCpWADQ==
Content-Disposition: inline
In-Reply-To: <20230718213212.GE3842864@mit.edu>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Theodore Ts'o <tytso@mit.edu>
Cc: "Alan C. Assis" <acassis@gmail.com>, =?iso-8859-1?Q?Bj=F8rn?= Forsman <bjorn.forsman@gmail.com>, linux-embedded@vger.kernel.org, Ext4 Developers List <linux-ext4@vger.kernel.org>, dm-devel@redhat.com

> In answer to Kai's original question, the setup that was described
> should be fine --- assuming high quality hardware.

I wonder how to judge that ... it's an eMMC supposedly complying to
some JEDEC standard, so it *should* be ok.

> ... if power is cut suddenly, the data used by the Flash
> Translation Layer can be corrupted, in which case data written months
> or years ago (not just recent data) could be lost.

At least I haven't observed anything like that up to now.

But on another aspect: how about the interaction between dm-integrity
and ext4? Sure, they each have their own journal, and they're
independent layers. Is there anything that could go wrong, say a block
that can't be recovered in the dm-integrity layer, causing ext4 to run
into trouble, e.g., an I/O error that prevents ext4 from mounting?

I assume tne answer is "No", but can I be sure?

Thx
regards
Kai
