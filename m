From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: About the "Tiny Linux Kernel" project
Date: Fri, 10 Jun 2011 17:16:44 -0700
Message-ID: <4DF2B3EC.6020700@am.sony.com>
References: <BANLkTikupJVJtF1hbnC6Y67E8ma7xNmeGg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <BANLkTikupJVJtF1hbnC6Y67E8ma7xNmeGg@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wu zhangjin <wuzhangjin@gmail.com>
Cc: "celinux-dev@tree.celinuxforum.org" <celinux-dev@tree.celinuxforum.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dongdong Deng <libfetion@gmail.com>, Nicholas Mc Guire <der.herr@hofr.at>, Zhan Rongkai <zhanrongkai@gmail.com>

On 06/10/2011 09:41 AM, wu zhangjin wrote:
> Hi, embedded folks
> 
> "Linux has gained more and more new features in recent years but at
> the same time has increased the kernel image size bit by bit. The new
> features do expand the applications a lot but their increased size
> also limit the application of Linux in some specific places."
> 
> So, I have launched a new "Tiny Linux Kernel" project, which was a
> 'continuator' of the forthgoer: Linux-Tiny[1]. This project was
> sponsored by the "CELF Open Project 2011"[2] and its main development
> will happen in the coming 4 months and of course, I hope this will be
> maintained forever from now on.
> 
> 1. Proposal
> 
> http://elinux.org/Work_on_Tiny_Linux_Kernel
> 
> 2. Developmenet management
> 
> http://tinylab.org/index.php/projects/tinylinux/
> 
> 3. Git repository
> 
> git://gitorious.org/tinylab/tinylinux.git
> 
> @https://gitorious.org/tinylab/tinylinux
> 
> The primary development effort have been put into the 2.6.35/dev/*
> branches, most of the arch related parts are only for MIPS platform
> currently, they will be migrated for another 3 main architectures:
> ARM, PowerPC and X86. After getting enough patches of cleaning up and
> fixing up, will create 2.6.35/stable/* branches and then
> linux-next/dev/*, linux-next/upstream/* and at last maintain a branch
> for the long-term 2.6.35 and upstream some of them to the mainline
> 3.x.y.
> 
> Most of the existing patches in the 2.6.35/dev/* branches are
> experimental and some of them may even be 'ugly', they are only demos
> for the ideas proposed. Welcome your comments, tests, defect reports
> and even patches.

Wu,

Thanks very much for making this announcement.  I'm very excited
about this work.

I had a chance this week to meet with some of my colleagues inside
Sony, who are working on projects with Linux that have a RAM budget
of 3 meg. This and related size work is really important for us.

 -- Tim

P.S. For those wondering, while our RAM budget is only 3M, we
have 8M of NOR flash, and we are using both kernel and application
XIP.  The system has a full network and bluetooth stack, sensor
monitoring software, and a web browser.

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================
