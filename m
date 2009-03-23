From: Mathieu Desnoyers <compudj-vdFpqfd5riKZ9vWoFJJngh2eb7JE58TQ@public.gmane.org>
Subject: Re: [Patch] ltt-relay-alloc mmap support (due to NFS lack of
	splice support)
Date: Mon, 23 Mar 2009 13:58:20 -0400
Message-ID: <20090323175820.GH24084@Krystal>
References: <91e0b5050903170224k51c4895eq8a1491da7a7a9741@mail.gmail.com> <20090320152857.GB30019@Krystal> <91e0b5050903230534g57d1ef8byd14a1fb5ca807192@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <91e0b5050903230534g57d1ef8byd14a1fb5ca807192-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Masahiro Tamori <masahiro.tamori-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, ltt-dev <ltt-dev-33AaDErTWvBVxDZ2/Zk0YoryAYyacSEB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Nick Piggin <npiggin-l3A5Bk7waGM@public.gmane.org>

* Masahiro Tamori (masahiro.tamori-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org) wrote:
> 2009/3/21 Mathieu Desnoyers <mathieu.desnoyers-scC8bbJcJLCw5LPnMra/2Q@public.gmane.org>:
> > * Masahiro Tamori (masahiro.tamori-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org) wrote:
[...]
> >> Our customer will use NFS to store trace data not storage device f=
or
> >> embedded devices.
> >> Since newer lttng use splice() even if NFS can not support splice(=
),
> >> I create a patch to support to mmap of ltt-relay-alloc.
> >>
[...]
> >> ltt-relay-alloc mmap support
> >>
> >> Splice syscall does not support NFS. We can not save trace data to
> >> NFS directory. If this feature is enabled, you can use mmap()
> >> instead of splice().
> >>
> >
> >
> > Hi Masahiro,
> >
> > Maybe we should consider implementing splice() support in NFS inste=
ad ?
> >
> > I removed the mmap support from the ltt-relay-alloc files because s=
plice
> > is more efficient and does not require to vmap the pages. =A0Unless=
 there
> > is a strong argument telling what in NFS makes it impossible to
> > implement splice(), I don't really see the gain in putting back the
> > old mmap() mechanism we had.
> >
> > Maybe the NFS people will have some information about this ?
> >
> > Thanks,
> >
> > Mathieu
> >
>=20
> Hello Mathieu,
>=20
> I think that the best solution is NFS can support splice() even if
> it cannot zero copy.
>=20
> The splice() will be used by any other tools, hence NFS should suppor=
t
> it sooner or later.
>=20
> If technical issue is remained to support splice() in NFS,
> we should support mmap in LTTng until the problem is resolved.
> Embedded people will want to use LTTng with NFS,
> though this is a bad choice.
>=20
> Thank you,
> Masahiro Tamori
>=20

There was a LKML thread on NFS splice support back in 2006 :

http://lkml.indiana.edu/hypermail/linux/kernel/0603.3/2102.html

I don't know what happened with this ? I have tested NFS v2 and v3 and
have seen they do not support splice, but haven't tested NFSv4.

Mathieu

--=20
Mathieu Desnoyers
OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE =
9A68
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
