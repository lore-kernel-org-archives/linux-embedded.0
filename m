From: Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH 01/17] pramfs: documentation
Date: Fri, 7 Jan 2011 10:42:44 -0800
Message-ID: <AANLkTimGt5hi+TpFHWxktJEg3tcDQmmARdqFqzAt++OQ@mail.gmail.com>
References: <4D25AF02.60208@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type;
        bh=9R54baY7aU+dZPBHtA7HVAk/W7m4l3LVlCoUup1hMEg=;
        b=qEe/b90oqaFgW9r/n7SfEHo34L3sqcYeRYJoUWaSuZA2s3t0OrmYxeo56x1jcdBCbh
         SyoIQqSia44m33md3dwJeHEWWZqhUbfT0aJ4cWtOeayNP1GnvrUblGiV5xCW1WhtfC/9
         ewrmZcuMKxlUYlXADLPwvp8qrEkDuBC0knCt4=
In-Reply-To: <4D25AF02.60208@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

On Thu, Jan 6, 2011 at 4:01 AM, Marco Stornelli
<marco.stornelli@gmail.com> wrote:
> +accessed data that must survive system reboots and power cycles. An
> +example usage might be system logs under /var/log, or a user address
> +book in a cell phone or PDA.

Some usage model questions:

How do you handle errors?  I see that there are a few sanity checks in the
"mount" path ... but there would seem to be several opportunities for the
file system to get corrupted in other ways.  Since you don't have a block
device, a standard "fsck" program looks challenging (though I guess you
could mmap("/dev/mem") to peek & poke at the filesystem before trying
to mount it).  Some sort of recovery path would seem useful for the "address
book" use model ... or do you just expect users to back their address book
up (to the cloud?) and have the phone just make a clean filesystem if any
errors are found?

What about quotas?  You have a fixed amount of persistent space, and
presumably a number of apps that the user installs on their device that
may like to use pramfs to store data.  Do you need some kernel enforcement
to stop one rogue application from using up all the space? Or do you expect that
this would be handled in some library level interface that applications will
use to access pramfs?

-Tony
