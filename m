From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 16:31:44 +0200
Message-ID: <c384c5ea0808210731k17ccc836u60c4803c3abfea31@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com> <20080821083916.GF5706@disturbed>
	 <6934efce0808210719s6458dc77w2c0755a4bf90bf8a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759907AbYHUOb7@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=aYlfMKEbmcLkpLQkOhKn8VTdRX5t7EjNz547Tv94l84=;
        b=CiqxdTsSLY5ZY7JIbmziBa3T4fKT+YlJggvkWyQunnqTEr108b+gu9pqyWazenY/4C
         tC/XLPmwHTUZxWLr69UW4i7cBwnkNExTc5Uu+ZJD0bMXsuzEg5KzZbh+lGsmkC9lHZ8b
         6/aY68+JHUjD2ex0M/s8fznj7KRSQFqB4b2Mc=
In-Reply-To: <6934efce0808210719s6458dc77w2c0755a4bf90bf8a@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

Hello Jared,

On Thu, Aug 21, 2008 at 4:19 PM, Jared Hulbert <jaredeh@gmail.com> wrote:
>> FWIW, I'm not sure it's a good idea to name this new filesystem AXFS.
>> People are almost certainly going to confuse it with XFS despite
>
People that care about their filesystem choice know their choices.
People that don't
care, well they don't care.

Maybe AXIPFS would be the close alternative.

One question on the use-case profiling and subsequent image rebuild:

What if the use-case did not cover all cases of XIP use?

If a compressed page is attempted to be executed, will the filesystem
fall back to decompression to RAM and execution from RAM, or will this
result in a faulty system?

The design choices look real good. Congrats on the achievement.

Regards,
-- 
Leon
