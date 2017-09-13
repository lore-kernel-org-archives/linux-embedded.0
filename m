From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Wed, 13 Sep 2017 16:20:11 +0200
Message-ID: <20170913142011.GA9563@redhat.com>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
 <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
 <20170905142436.262ed118@alans-desktop>
 <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
 <d2d1acae-b2a1-9f41-d3bf-9d3b35a62664@landley.net>
 <20170911151526.GA4126@redhat.com>
 <d3ae79b1-810d-8abc-3692-69cef4bd1a7a@landley.net>
 <20170912154549.GA31411@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170912154549.GA31411@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Embedded <linux-embedded@vger.kernel.org>, dalias@libc.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 09/12, Oleg Nesterov wrote:
>
> On 09/12, Rob Landley wrote:
> >
> > On 09/11/2017 10:15 AM, Oleg Nesterov wrote:
> > > On 09/08, Rob Landley wrote:
> > >>
> > >> So is exec(NULL, argv, envp) a reasonable thing to want?
> > >
> > > I think that something like prctl(PR_OPEN_EXE_FILE) which does
> > >
> > > 	dentry_open(current->mm->exe_file->path, O_PATH)
> > >
> > > and returns fd make more sense.
> > >
> > > Then you can do execveat(fd, "", ..., AT_EMPTY_PATH).
> > I'm all for it? That sounds like a cosmetic difference, a more verbose
> > way of achieving the same outcome.
>
> Simpler to implement. Something like the (untested) patch below. Not sure
> it is correct, not sure it is good idea, etc.

OTOH... with the trivial patch below

	execveat(AT_FDCWD, "", NULL, NULL, AT_EMPTY_PATH);

should always work, even if the binary is not in scope after chroot, or if
it is no longer executable, or unlinked. But I am not sure what else should
we do to avoid the security problems.

Oleg.


--- x/fs/exec.c
+++ x/fs/exec.c
@@ -832,23 +832,32 @@ static struct file *do_open_execat(int fd, struct filename *name, int flags)
 {
 	struct file *file;
 	int err;
-	struct open_flags open_exec_flags = {
-		.open_flag = O_LARGEFILE | O_RDONLY | __FMODE_EXEC,
-		.acc_mode = MAY_EXEC,
-		.intent = LOOKUP_OPEN,
-		.lookup_flags = LOOKUP_FOLLOW,
-	};
-
-	if ((flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
-		return ERR_PTR(-EINVAL);
-	if (flags & AT_SYMLINK_NOFOLLOW)
-		open_exec_flags.lookup_flags &= ~LOOKUP_FOLLOW;
-	if (flags & AT_EMPTY_PATH)
-		open_exec_flags.lookup_flags |= LOOKUP_EMPTY;
 
-	file = do_filp_open(fd, name, &open_exec_flags);
-	if (IS_ERR(file))
-		goto out;
+	if (fd == AT_FDCWD && name->name[0] == '\0' && flags == AT_EMPTY_PATH) {
+		file = get_mm_exe_file(current->mm);
+		if (!file) {
+			file = ERR_PTR(-ENOENT);
+			goto out;
+		}
+	} else {
+		struct open_flags open_exec_flags = {
+			.open_flag = O_LARGEFILE | O_RDONLY | __FMODE_EXEC,
+			.acc_mode = MAY_EXEC,
+			.intent = LOOKUP_OPEN,
+			.lookup_flags = LOOKUP_FOLLOW,
+		};
+
+		if ((flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
+			return ERR_PTR(-EINVAL);
+		if (flags & AT_SYMLINK_NOFOLLOW)
+			open_exec_flags.lookup_flags &= ~LOOKUP_FOLLOW;
+		if (flags & AT_EMPTY_PATH)
+			open_exec_flags.lookup_flags |= LOOKUP_EMPTY;
+
+		file = do_filp_open(fd, name, &open_exec_flags);
+		if (IS_ERR(file))
+			goto out;
+	}
 
 	err = -EACCES;
 	if (!S_ISREG(file_inode(file)->i_mode))

