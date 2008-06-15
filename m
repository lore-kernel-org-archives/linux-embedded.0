From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Not as much ccache win as I expected
Date: Sun, 15 Jun 2008 19:58:35 +0200
Message-ID: <20080615175835.GA15244@logfs.org>
References: <4852C51D.30206@am.sony.com> <8499950a0806131354u7d2431b2n2df50b7b6c98f18d@mail.gmail.com> <4852E245.4020502@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4852E245.4020502@am.sony.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Oleg Verych <olecom@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Fri, 13 June 2008 14:10:29 -0700, Tim Bird wrote:
>=20
> Maybe I should just be grateful for any ccache hits I get.

ccache's usefulness depends on your workload.  If you make a change to
include/linux/fs.h, close to 100% of the kernel is rebuilt, with or
without ccache.  But when you revert that change, the build time differ=
s
dramatically.  Without ccache, fs.h was simply changed again and
everything is rebuild.  With ccache, there are hits for the old version
and all is pulled from the cache - provided you have allotted enough
disk for it.

If you never revert to an old version or do some equivalent operation,
ccache can even be a net loss.  On a fast machine, the additional disk
accesses are easily more expensive than the minimal cpu gains.

J=C3=B6rn

--=20
Public Domain  - Free as in Beer
General Public - Free as in Speech
BSD License    - Free as in Enterprise
Shared Source  - Free as in "Work will make you..."
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
