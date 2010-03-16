From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH] devtmpfs: support !CONFIG_TMPFS
Date: Tue, 16 Mar 2010 20:14:05 +0100
Message-ID: <87wrxcgjuq.fsf@macbook.be.48ers.dk>
References: <1268389504-22179-1-git-send-email-jacmet@sunsite.dk>
	<20100316190005.GA32555@kroah.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:from:to:cc
         :subject:references:date:in-reply-to:message-id:user-agent
         :mime-version:content-type;
        bh=QPfZqzBueJeV7kDv+1UeWKU4PYxgRrfv/m4suIZrw3w=;
        b=q1dVuMv2TQC7mnrTWHJc76xYyumRa4J9tmr2tYCojmRQj/qbzfF29A356niuiy236P
         D0KzOC9vPdInj5uX8yW86fMxuHRQ1awyMcVyZXMBwJPotz+pk7wYOdlh7MVujgGSUf5B
         PRY0LXuLSW8p2g7jmfrMZop3oVR/sZiWFA7NA=
In-Reply-To: <20100316190005.GA32555@kroah.com> (Greg KH's message of "Tue, 16
	Mar 2010 12:00:05 -0700")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: kay.sievers@vrfy.org, gregkh@suse.de, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

>>>>> "Greg" == Greg KH <greg@kroah.com> writes:

Hi,

 >> config DEVTMPFS
 >> bool "Maintain a devtmpfs filesystem to mount at /dev"
 >> -	depends on HOTPLUG && SHMEM && TMPFS
 >> +	depends on HOTPLUG
 >> help
 >> This creates a tmpfs filesystem instance early at bootup.
 >> In this filesystem, the kernel driver core maintains device

 Greg> With this patch, the Kconfig help text now is incorrect.

 Greg> Is there a way to explicitly call out in the Kconfig which way
 Greg> devtmpfs is being created?  How about a multiple selection that
 Greg> chooses either TMPFS or RAMFS, with the default being TMPFS?

I don't think that's needed - If CONFIG_TMPFS isn't set, then ramfs
pretends to be tmpfs anyway, see mm/shmem.c:

static struct file_system_type tmpfs_fs_type = {
	.name		= "tmpfs",
	.get_sb		= ramfs_get_sb,
	.kill_sb	= kill_litter_super,
};

So calling it tmpfs isn't really wrong.

 Greg> So care to redo this so that people can easily determine what is going
 Greg> to happen easier than this patch currently causes?

We can change the help text to say tmpfs/ramfs if you prefer - OK?

-- 
Bye, Peter Korsgaard
