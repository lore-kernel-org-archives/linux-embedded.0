From: Ferenc Wagner <wferi@niif.hu>
Subject: Re: RFC: direct MTD support for SquashFS
Date: Tue, 23 Mar 2010 21:45:19 +0100
Message-ID: <874ok6py1s.fsf@tac.ki.iif.hu>
References: <87vdcwv139.fsf@tac.ki.iif.hu>
	<87ljdsibqe.fsf@macbook.be.48ers.dk> <87r5nhziss.fsf@tac.ki.iif.hu>
	<bffbecbb1003181440kc78f4dbvd25d4e2ea17b52e5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: Ferenc Wagner's message of "Tue\, 23 Mar 2010 12\:35\:02 +0100"
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip.lougher@gmail.com>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Ferenc Wagner <wferi@niif.hu> writes:

> I've got one more patch, which I forgot to export, to pull out the
> common logic from the backend init functions back into squashfs_read_data().
> With the bdev backend, that entails reading the first block twice in a
> row most of the time.  This again could be worked around by extending
> the backend interface, but I'm not sure if it's worth it.

Here it is.  I also corrected the name of SQUASHFS_METADATA_SIZE, so it
may as well compile now.
-- 
Regards,
Feri.
