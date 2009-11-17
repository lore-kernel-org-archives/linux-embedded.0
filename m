From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Tue, 17 Nov 2009 11:03:00 +0200
Message-ID: <1258448580.27437.81.camel@localhost>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753729AbZKQJDs@vger.kernel.org>
In-Reply-To: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David VomLehn <dvomlehn@cisco.com>
Cc: linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

A pair of nit-picks.

On Wed, 2009-11-11 at 21:13 -0500, David VomLehn wrote:
> @@ -0,0 +1,293 @@
> +/*
> + *				panic-note.c

No need to type file name there.

> + *
> + * Allow a blob to be registered with the kernel that will be printe=
d if
> + * the kernel panics.
> + *
> + * Copyright (C) 2009  Cisco Systems, Inc.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-=
1301  USA
> + */
> +
> +/* Open issues:
> + * Where should the panic_note file be created? It's almost like a s=
ysctl,
> + * but doesn't follow the same rules. When you write to a sysctl fil=
e, the
> + * previous data is replaced. When you write to the panic_note file,=
 you
> + * can append to the end of the existing data.
> + */

Please, take a look at what is the kernel comment style at
Documentation/CodingStyle. We use

/*
 * Multi-line
 * comment
 */

style.

> +
> +#include <linux/semaphore.h>
> +#include <linux/fs.h>
> +#include <linux/proc_fs.h>
> +#include <linux/module.h>
> +#include <linux/uaccess.h>
> +
> +/* Maximum size, in bytes, allowed for the blob. Having this limit p=
revents
> + * an inadvertant denial of service attack that might happen if some=
one with
> + * root privileges was automatically generating this note and the ge=
nerator
> + * had an infinite loop. Perhaps this is more of a a denial of servi=
ce
> + * suicide. */
> +#define PANIC_NOTE_SIZE		(PAGE_SIZE * 4)
> +
> +/*
> + * struct panic_note_data - Information about the panic note
> + * @n:		Number of bytes in the note
> + * @p:		Pointer to the data in the note
> + * @sem:	Semaphore controlling access to data in the note
> + */
> +struct panic_note_state {
> +	size_t			n;
> +	void			*p;
> +	struct rw_semaphore	sem;
> +};
> +
> +static struct panic_note_state panic_note_state =3D {
> +	0, NULL, __RWSEM_INITIALIZER(panic_note_state.sem)
> +};
> +static const struct file_operations panic_note_fops;
> +static struct inode_operations panic_note_iops;
> +static struct proc_dir_entry *panic_note_entry;
> +
> +/*
> + * panic_note_print - display the panic note
> + * @priority:	Printk priority to use, e.g. KERN_EMERG
> + */
> +void panic_note_print()
> +{
> +	int i;
> +	int linelen;
int i, lineline is more compact.

> +
> +	/* We skip the semaphore stuff because we're in a panic situation a=
nd
> +	 * the scheduler isn't available in case the semaphore is already o=
wned
> +	 * by someone else */
> +	for (i =3D 0; i < panic_note_state.n; i +=3D linelen) {
> +		const char *p;
> +		int remaining;
> +		const char *nl;

const char *p, *nl is more compact. And there are several more places.
But this is matter of taste, really.

> +
> +		p =3D panic_note_state.p + i;
> +		remaining =3D panic_note_state.n - i;
> +
> +		nl =3D memchr(p, '\n', remaining);
> +
> +		if (nl =3D=3D NULL) {
> +			linelen =3D remaining;
> +			pr_emerg("%.*s\n", linelen, p);
> +		} else {
> +			linelen =3D nl - p + 1;
> +			pr_emerg("%.*s", linelen, p);
> +		}
> +	}
> +}
> +
> +/*
> + * read_write_size - calculate the limited copy_to_user/copy_from_us=
er count
> + * @nbytes:	The number of bytes requested
> + * @pos:	Offset, in bytes, into the file
> + * @size:	Maximum I/O offset, in bytes. For a read, this is the actu=
al
> + *		number of bytes in the file, since you can't read past
> + *		the end. Writes can be done after the number of bytes in the
> + *		file, so this is the maximum possible file size, minus one.
> + *
> + * Returns the number of bytes to copy.
> + */
> +static ssize_t read_write_size(size_t nbytes, loff_t pos, size_t siz=
e)
> +{
> +	ssize_t retval;
> +
> +	if (pos >=3D size)
> +		retval =3D 0;
> +
Unnecessary \n
> +	else {
> +		retval =3D size - pos;
> +		if (retval > nbytes)
> +			retval =3D nbytes;
> +	}
> +
> +	return retval;
> +}


--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
