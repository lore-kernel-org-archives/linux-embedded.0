From: wu zhangjin <wuzhangjin@gmail.com>
Subject: About the "Tiny Linux Kernel" project
Date: Sat, 11 Jun 2011 00:41:18 +0800
Message-ID: <BANLkTikupJVJtF1hbnC6Y67E8ma7xNmeGg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to:cc
         :content-type;
        bh=Xjl0B1fSyrju+rWhckmszjHMhvUSfduSjuF3KcWaaBA=;
        b=L5wzL00krPyjHAtOrJJ78oIrj940TUjJY/dBEtIrPG6FrQIVQq/U6fKXe7M4cJToi/
         vvOjlLHEqQYoX6kB03auQ8f5oLca8JF0brXG1iP7FPdEqgTVQEKOqVCdqMvEkp4ITqAJ
         e6BJ+JiDnfdYxjnzAJqyb/38bdw8c+nEOxDBc=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org
Cc: Tim Bird <tim.bird@am.sony.com>, Dongdong Deng <libfetion@gmail.com>, Nicholas Mc Guire <der.herr@hofr.at>, Zhan Rongkai <zhanrongkai@gmail.com>

Hi, embedded folks

"Linux has gained more and more new features in recent years but at
the same time has increased the kernel image size bit by bit. The new
features do expand the applications a lot but their increased size
also limit the application of Linux in some specific places."

So, I have launched a new "Tiny Linux Kernel" project, which was a
'continuator' of the forthgoer: Linux-Tiny[1]. This project was
sponsored by the "CELF Open Project 2011"[2] and its main development
will happen in the coming 4 months and of course, I hope this will be
maintained forever from now on.

1. Proposal

http://elinux.org/Work_on_Tiny_Linux_Kernel

2. Developmenet management

http://tinylab.org/index.php/projects/tinylinux/

3. Git repository

git://gitorious.org/tinylab/tinylinux.git

@https://gitorious.org/tinylab/tinylinux

The primary development effort have been put into the 2.6.35/dev/*
branches, most of the arch related parts are only for MIPS platform
currently, they will be migrated for another 3 main architectures:
ARM, PowerPC and X86. After getting enough patches of cleaning up and
fixing up, will create 2.6.35/stable/* branches and then
linux-next/dev/*, linux-next/upstream/* and at last maintain a branch
for the long-term 2.6.35 and upstream some of them to the mainline
3.x.y.

Most of the existing patches in the 2.6.35/dev/* branches are
experimental and some of them may even be 'ugly', they are only demos
for the ideas proposed. Welcome your comments, tests, defect reports
and even patches.

Thanks & Best Regards,
Wu Zhangjin

--
[1] http://elinux.org/Linux_Tiny
[2] http://elinux.org/CELF_Open_Project_Proposal_2011
