From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v4 4/5] cramfs: add mmap support
Date: Thu, 5 Oct 2017 23:49:20 +0000
Message-ID: <SG2PR06MB1165A0C7FA2194F1E6013F6B8A700@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org>
 <20170927233224.31676-5-nicolas.pitre@linaro.org>
 <20171001083052.GB17116@infradead.org>
 <nycvar.YSQ.7.76.1710011805070.5407@knanqh.ubzr>
 <CAFLxGvzfQrvU-8w7F26mez6fCQD+iS_qRJpLSU+2DniEGouEfA@mail.gmail.com>
 <nycvar.YSQ.7.76.1710021931270.5407@knanqh.ubzr>
 <20171003145732.GA8890@infradead.org>
 <nycvar.YSQ.7.76.1710031107290.5407@knanqh.ubzr>
 <20171003153659.GA31600@infradead.org>
 <nycvar.YSQ.7.76.1710031137580.5407@knanqh.ubzr>
 <20171004072553.GA24620@infradead.org>
 <nycvar.YSQ.7.76.1710041608460.1693@knanqh.ubzr>
 <SG2PR06MB11655D2F14AC44BA565848788A700@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <nycvar.YSQ.7.76.1710051707540.1693@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=sadlAgF3YpLHvOE7m0H8jD9mL8zZG6oDfyxJ18IgpCo=;
 b=D/sB95kFTdGMKC8BkRHc7atdONYhoHG+TEbGImxTicJu/oEmxWMuU4bQOLtbTmuZ/WB7CmWIeNJ4l+pWl2KNU/DClLV8Yx49H+J4YOT3E6Q98rJebVcypBVfKfJO54jsHXaq05lzAmeNx2I3i3ELrZ19QUMYpTS50yNpf0nG7e4=
In-Reply-To: <nycvar.YSQ.7.76.1710051707540.1693@knanqh.ubzr>
Content-Language: en-US
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Christoph Hellwig <hch@infradead.org>, Richard Weinberger <richard.weinberger@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thursday, October 05, 2017, Nicolas Pitre wrote:
> Do you have the same amount of free memory once booted in both cases?

Yes, almost exactly the same, so obvious it must be working the same for
both cases. That's enough evidence for me.

Thanks.

Chris

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
