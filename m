From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: execve(NULL, argv, envp) for nommu?
Date: Tue, 12 Sep 2017 17:45:49 +0200
Message-ID: <20170912154549.GA31411@redhat.com>
References: <324c00d9-06a6-1fc5-83fe-5bd36d874501@landley.net>
 <CAMuHMdUPUaLfbbFF1kZoEUy7or-9sVOt=ykAHT+S6NBvFy5V=g@mail.gmail.com>
 <20170905142436.262ed118@alans-desktop>
 <ab6e6e8b-7040-a07d-5502-405701182568@landley.net>
 <d2d1acae-b2a1-9f41-d3bf-9d3b35a62664@landley.net>
 <20170911151526.GA4126@redhat.com>
 <d3ae79b1-810d-8abc-3692-69cef4bd1a7a@landley.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d3ae79b1-810d-8abc-3692-69cef4bd1a7a@landley.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Embedded <linux-embedded@vger.kernel.org>, dalias@libc.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 09/12, Rob Landley wrote:
>
> On 09/11/2017 10:15 AM, Oleg Nesterov wrote:
> > On 09/08, Rob Landley wrote:
> >>
> >> So is exec(NULL, argv, envp) a reasonable thing to want?
> >
> > I think that something like prctl(PR_OPEN_EXE_FILE) which does
> >
> > 	dentry_open(current->mm->exe_file->path, O_PATH)
> >
> > and returns fd make more sense.
> >
> > Then you can do execveat(fd, "", ..., AT_EMPTY_PATH).
> I'm all for it? That sounds like a cosmetic difference, a more verbose
> way of achieving the same outcome.

Simpler to implement. Something like the (untested) patch below. Not sure
it is correct, not sure it is good idea, etc.

> (Of course now you've got a filehandle you can read xattrs and such
> through from otherwise jailed contexts letting you do things you
> couldn't necessarily do before,

I can be easily wrong, this is not my area, but afaics no. Note that
you get the FMODE_PATH file (see O_PATH), you can do almost nothing
with it.

So. IIUC with this patch you can do

	fd = prctl(PR_OPEN_EXE_FILE);

	execveat(fd, "", NULL, NULL, AT_EMPTY_PATH);

and execveat should succeed even if the binary was unlinked/renamed in
between.

otoh it should fail if, say, you do "chmod a-x exename" in between.

However. This won't work after chroot() so I am not sure this solves your
problems.

> but I assume you know the security
> implications of that more than I do.

Unlikely ;)


> > But to be honest, I can't understand the problem, because I know nothing
> > about nommu.
> >
> > You need to unblock parent sleeping in vfork(), and you can't do another
> > fork (I don't undestand why).
>
> A nommu system doesn't have a memory management unit, so all addresses
> are physical addresses. This means two processes can't see different
> things at the same address: either they see the same thing or one of
> them can't see that address (due to a range register making it).

Yes, yes, I understand, and thanks for your detailed explanation...

> > Perhaps the child can create another thread? The main thread can exit
> > after that and unblock the parent. Or perhaps even something like
> > clone(CLONE_VM | CLONE_PARENT), I dunno...
>
> Launching a new thread doesn't unblock the parent.

Well, this doesn't really matter, but see above, the main thread can exit
after that. This should unblock the parent.

> And even without that, we're still in the "vfork but add concurrency"
> territory. Your threads don't have their own independent mappings,

Of course!

Just I misinterpreted your initial email as if this is fine for your
use-case, and all you need is unblock the parent and nothing else.

Oleg.
---


--- x/kernel/sys.c
+++ x/kernel/sys.c
@@ -2183,6 +2183,40 @@ static int propagate_has_child_subreaper(struct task_struct *p, void *data)
 	return 1;
 }
 
+static int open_mm_exe_file(void)
+{
+	struct file *exe_file, *file;
+	struct path *path;
+	int fd = -ENOENT;
+
+	exe_file = get_mm_exe_file(current->mm);
+	if (!exe_file)
+		goto out;
+
+	path = &exe_file->f_path;
+	if (!path->dentry)
+		goto put_exe_file;
+
+	fd = get_unused_fd_flags(O_CLOEXEC); // flags?
+	if (fd < 0)
+		goto put_exe_file;
+
+	file = dentry_open(path, O_PATH, current_cred());
+	if (IS_ERR(file)) {
+		put_unused_fd(fd);
+		fd = PTR_ERR(file);
+		goto put_exe_file;
+	}
+
+	path_get(path);
+	fd_install(fd, file);
+
+put_exe_file:
+	fput(exe_file);
+out:
+	return fd;
+}
+
 SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 		unsigned long, arg4, unsigned long, arg5)
 {
@@ -2196,6 +2230,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 
 	error = 0;
 	switch (option) {
+	case PR_OPEN_EXE_FILE:
+		error = open_mm_exe_file();
+		break;
 	case PR_SET_PDEATHSIG:
 		if (!valid_signal(arg2)) {
 			error = -EINVAL;

