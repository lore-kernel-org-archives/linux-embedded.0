From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 03/10] AXFS: axfs.h
Date: Thu, 21 Aug 2008 13:07:54 -0700
Message-ID: <6934efce0808211307g4eabe29fvac24d82252bf913c@mail.gmail.com>
References: <48AD00E6.2070505@gmail.com>
	 <1219324258.23311.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=nK9z8eguX6w53sqDGtMoRr3j+6FGLakMDUsFGiDxFFo=;
        b=FEdP6lpnmev8Z6byc3Rc/ywXgVTHt+WuChzBESlqwom7k9678AjExmPaD9S3sqP9U9
         SdersytF7lX6QXdg2NVCtc4Zbh05kfYgVggDqgFhGIJ+bWDEbEA79alDYW0YJFS8f4H9
         +ZKzyiUgiPwFcCPqtAlIuZWRESfp6zbCnYKO0=
In-Reply-To: <1219324258.23311.14.camel@localhost.localdomain>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Walker <dwalker@mvista.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> I think it would be much cleaner to do all these similar macro's as
> static inline functions.

Yeah.  Been thinking about that.
