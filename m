From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] fs/binfmt_elf_fdpic.c: fix brk area overlap with stack on NOMMU
Date: Thu, 10 Sep 2015 15:29:07 +0100
Message-ID: <21921.1441895347@warthog.procyon.org.uk>
References: <55DD15AA.5040503@uclinux.org> <20150820191106.GA9655@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <55DD15AA.5040503@uclinux.org>
Content-ID: <21920.1441895347.1@warthog.procyon.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Greg Ungerer <gerg@uclinux.org>
Cc: dhowells@redhat.com, Rich Felker <dalias@libc.org>, linux-embedded@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Matt Mackall <mpm@selenic.com>, David Woodhouse <dwmw2@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

Greg Ungerer <gerg@uclinux.org> wrote:

> It would make sense to run this by David Howells <dhowells@redhat.com>,
> I think he wrote this code (added to CC list).
> 
> I have no problem with it, so:

Fine by me too.

Acked-by: David Howells <dhowells@redhat.com>
