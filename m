From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Mon, 4 Aug 2008 11:24:51 -0700
Message-ID: <48974973.6000408@am.sony.com>
References: <20080731092703.661994657@free-electrons.com> <20080731093220.969460336@free-electrons.com> <20080802163848.GB30454@fieldses.org> <20080804155237.1f64892d@surf> <20080804181641.GE25940@fieldses.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20080804181641.GE25940@fieldses.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, matthew@wil.cx, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org

J. Bruce Fields wrote:
> On Mon, Aug 04, 2008 at 03:52:37PM +0200, Thomas Petazzoni wrote:
>> Le Sat, 2 Aug 2008 12:38:48 -0400,
>> "J. Bruce Fields" <bfields@fieldses.org> a =C3=A9crit :
>>
>>> Out of curiosity, why does the nfs client need disabling, but not
>>> nfsd, gfs2, fuse, etc.?
>> Then also need disabling.
>=20
> OK by me, but again, why exactly?  Since you're replacing the locking
> calls they used by stubs that just return errors, in theory nfs, nfsd=
,
> gfs2, and the rest should still compile and run, just without locking
> support, right?

I think so, but haven't tested this myself.

However, I would still be inclined to NOT add the extra config
dependencies.  Just my 2 cents.
 -- Tim

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
