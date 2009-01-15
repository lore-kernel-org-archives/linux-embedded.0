From: =?ISO-8859-1?Q?P=E1draig_Brady?= <P@draigBrady.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Thu, 15 Jan 2009 12:59:48 +0000
Message-ID: <496F3344.9060104@draigBrady.com>
References: <200901020207.30359.rob@landley.net> <200901021026.37905.a.miskiewicz@gmail.com> <20090102094934.GB17841@infradead.org> <495DE995.1070002@opensde.org> <yw1x3ag2t2gd.fsf@thrashbarg.mansr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <yw1x3ag2t2gd.fsf@thrashbarg.mansr.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

M=E5ns Rullg=E5rd wrote:
> Alejandro Mery <amery@opensde.org> writes:
>=20
>> I think the $(( ... )) bash-ism can be replaced with a simple .c hel=
per toy.
>=20
> The $(( ... )) construct is standard POSIX shell syntax, see
> http://www.opengroup.org/onlinepubs/000095399/utilities/xcu_chap02.ht=
ml#tag_02_06_04
>=20
> Bash supports $[ ... ] as an alternate syntax for the same thing.
> Perhaps you were thinking of that.

I think the misconception that $(( ... )) is a bashism is caused by
the wrong highlighting defaults chosen by vim. To fix this add this to =
~/.vimrc

let g:is_posix =3D 1

That will also allow you to use the $(command) POSIX construct.
BTW, the vim syntax maintainers don't agree with changing this default:
http://groups.google.com/group/vim_dev/browse_thread/thread/41139a32772=
b2f5f

cheers,
P=E1draig.
