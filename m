From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 07:13:12 -0700
Message-ID: <6934efce0808210713m220d2a6cje06a2dc51c4a857a@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com> <48AD42AE.4030107@de.ibm.com>
	 <200808212043.51209.nickpiggin@yahoo.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=ESpTmrMkdTUB81ORIV+reSOhb/QBPC3HHPut881jZk0=;
        b=HDN8vOBs0d+zrn1uaUDWmW5WkDz/RdeaTzKlJU8Dd03oRV3cflZ96ba4xR4XtsMIOG
         yHetYzQ2XmyYIcIHFDoI6qBbPwdBRS36a/W1SC8RS9m4waigNHoArdF7YAtYwKiZiphh
         6sWT+TvJC2NjsEgS6IiRJW8DkX0weMNT4QE6s=
In-Reply-To: <200808212043.51209.nickpiggin@yahoo.com.au>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Piggin <nickpiggin@yahoo.com.au>
Cc: carsteno@de.ibm.com, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com

> Agreed. I haven't had a good look through it yet, but at a glance it
> looks pretty neat. The VM side of things looks pretty reasonable
> (I fear XIP faulting might have another race or two, but that's a
> core mm issue rather than filesystem specific).

How might I design a test to flush those bugs out?  We haven't seen any.
